#!/bin/sh -xe

bin/build-emcpp.sh
cp build/WorktipsCoreCpp_WASM.js worktips_utils/
cp build/WorktipsCoreCpp_WASM.wasm worktips_utils/
cp build/WorktipsCoreCpp_ASMJS.js worktips_utils/ 
cp build/WorktipsCoreCpp_ASMJS.asm.js worktips_utils/ 