## Yuki CLANG 18.0.0 > 
  Yuki clang 18.0.0 or superior will be moved to https://bitbucket.org/thexperienceproject/yuki-clang/
# Yuki-clang

This is a [LLVM](https://llvm.org/) and [Clang](https://clang.llvm.org/) compiler toolchain built for kernel development. Builds are always made from the latest LLVM sources rather than stable releases, so complete stability cannot be guaranteed.

This toolchain targets the AArch32, AArch64, and x86 architectures. It is built with LTO and PGO to reduce compile times as much as possible.

[binutils](https://www.gnu.org/software/binutils/) is also included for convenience. Unlike LLVM, however, the latest **stable** version of binutils is always used to reduce the opportunity for breakage because this project is primarily focused on cutting-edge Clang, not binutils. This means that **users do not need to download separate GCC toolchains** to build the Linux kernel.

Automated builds occur weekly at 11 PM UTC-6 on every Sunday using fresh sources from the [LLVM Git monorepo](https://github.com/llvm/llvm-project). If any part of the builds fail, this repository will not be updated. The build scripts (powered by [tc-build](https://github.com/ClangBuiltLinux/tc-build)).

This Readme is based on Proton clang cuz it has good information
Credits to kdrag0n.

## Building Linux

Make sure you have this toolchain in your `PATH`:

```bash
export PATH="$HOME/tools/yuki-clang/bin:$PATH"
```

For an AArch64 cross-compilation setup, you must set the following variables. Some of them can be environment variables, but some must be passed directly to `make` as a command-line argument. It is recommended to pass **all** of them as `make` arguments to avoid confusing errors:

- `CC=clang` (must be passed directly to `make`)
- `CROSS_COMPILE=aarch64-linux-gnu-`
- If your kernel has a 32-bit vDSO: `CROSS_COMPILE_ARM32=arm-linux-gnueabi-`

This is an example from one of my scripts with clang lto
```bash
    PATH="$HOME/tools/yuki-clang/bin:${PATH}" \
      make -j$(nproc --all) O=out \
      ARCH=arm64 \
      LD=ld.lld \
      NM=llvm-nm \
      AR=llvm-ar \
      CC="ccache clang" \
      CLANG_TRIPLE=aarch64-linux-gnu- \
      CROSS_COMPILE=aarch64-linux-gnu- \
      CROSS_COMPILE_ARM32=arm-linux-gnueabi-
```
if your kernel has defined REAL_CC instead of CC use:  `REAL_CC="clang"` or with ccache `REAL_CC="ccache clang"`
to use ccache you need to install ccache 

To use ld.lld linker or similar you will need aditional patches to your kernel

Android kernels 4.19 and newer use the upstream variable `CROSS_COMPILE_COMPAT`. When building these kernels, replace `CROSS_COMPILE_ARM32` in your commands and scripts with `CROSS_COMPILE_COMPAT`.
