set_target_properties(LLVMPolly PROPERTIES
              IMPORTED_LOCATION_RELEASE /root/yukiclang/build/build/llvm/stage1/lib/LLVMPolly.so)
set_target_properties(PollyISL PROPERTIES
              IMPORTED_LOCATION_RELEASE /root/yukiclang/build/build/llvm/stage1/lib/libPollyISL.a)
set_target_properties(Polly PROPERTIES
              IMPORTED_LOCATION_RELEASE /root/yukiclang/build/build/llvm/stage1/lib/libPolly.a)
