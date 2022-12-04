#!/bin/sh -xe

rm -rf build worktips_utils/WorktipsCoreCpp_*
mkdir -p build

./bin/build-boost-emscripten.sh
./bin/archive-emcpp.sh
