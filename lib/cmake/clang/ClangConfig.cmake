# This file allows users to call find_package(Clang) and pick up our targets.



find_package(LLVM REQUIRED CONFIG
             HINTS "/root/yukiclang/build/build/llvm/stage1/lib/cmake/llvm")

set(CLANG_EXPORTED_TARGETS "clangBasic;clangAPINotes;clangLex;clangParse;clangAST;clangDynamicASTMatchers;clangASTMatchers;clangCrossTU;clangSema;clangCodeGen;clangAnalysis;clangEdit;clangRewrite;clangDriver;clangSerialization;clangRewriteFrontend;clangFrontend;clangFrontendTool;clangToolingCore;clangToolingInclusions;clangToolingRefactoring;clangToolingASTDiff;clangToolingSyntax;clangDependencyScanning;clangTransformer;clangTooling;clangDirectoryWatcher;clangIndex;clangIndexSerialization;clangStaticAnalyzerCore;clangStaticAnalyzerCheckers;clangStaticAnalyzerFrontend;clangFormat;clangTesting;clangInterpreter;diagtool;clang;clang-format;clangHandleCXX;clangHandleLLVM;clang-offload-bundler;clang-offload-wrapper;clang-scan-deps;clang-rename;clang-refactor;clang-cpp;libclang")
set(CLANG_CMAKE_DIR "/root/yukiclang/build/build/llvm/stage1/lib/cmake/clang")
set(CLANG_INCLUDE_DIRS "/root/yukiclang/build/llvm-project/clang/include;/root/yukiclang/build/build/llvm/stage1/tools/clang/include")
set(CLANG_LINK_CLANG_DYLIB "OFF")

# Provide all our library targets to users.
include("/root/yukiclang/build/build/llvm/stage1/lib/cmake/clang/ClangTargets.cmake")

# By creating clang-tablegen-targets here, subprojects that depend on Clang's
# tablegen-generated headers can always depend on this target whether building
# in-tree with Clang or not.
if(NOT TARGET clang-tablegen-targets)
  add_custom_target(clang-tablegen-targets)
endif()
