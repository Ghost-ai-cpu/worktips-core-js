cmake_minimum_required(VERSION 3.4.1)

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

project(WorktipsCoreCpp)
#
include_directories("src")
#
set(WORKTIPS_CORE_CPP "src/submodules/worktips-core-cpp")
set(WORKTIPS_CORE_CPP_SRC "${WORKTIPS_CORE_CPP}/src")
include_directories("${WORKTIPS_CORE_CPP}/src")
#
set(WORKTIPS_SRC "${WORKTIPS_CORE_CPP}/contrib/worktips-core-custom")
include_directories(${WORKTIPS_SRC})
include_directories("${WORKTIPS_SRC}/epee/include")
include_directories("${WORKTIPS_SRC}/common")
include_directories("${WORKTIPS_SRC}/vtlogger")
include_directories("${WORKTIPS_SRC}/crypto")
include_directories("${WORKTIPS_SRC}/cryptonote_basic")
include_directories("${WORKTIPS_SRC}/multisig")
include_directories("${WORKTIPS_SRC}/cryptonote_core")
include_directories("${WORKTIPS_SRC}/cryptonote_protocol")
include_directories("${WORKTIPS_SRC}/wallet")
include_directories("${WORKTIPS_SRC}/rpc")
include_directories("${WORKTIPS_SRC}/mnemonics")
include_directories("${WORKTIPS_SRC}/contrib/libsodium/include") # support sodium/… paths
include_directories("${WORKTIPS_SRC}/contrib/libsodium/include/sodium")
#
# keeping test files in a separate source directory 
# file(GLOB TEST_SRCS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} test/test_*.cpp)
#
set(
    SRC_FILES
    #
    src/index.cpp
    src/emscr_async_send_bridge.hpp
    src/emscr_async_send_bridge.cpp
    #
    ${WORKTIPS_CORE_CPP_SRC}/worktips_address_utils.hpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_address_utils.cpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_paymentID_utils.hpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_paymentID_utils.cpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_key_image_utils.hpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_key_image_utils.cpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_fee_utils.hpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_fee_utils.cpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_transfer_utils.hpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_transfer_utils.cpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_fork_rules.hpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_fork_rules.cpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_wallet_utils.hpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_wallet_utils.cpp
    ${WORKTIPS_CORE_CPP_SRC}/serial_bridge_index.hpp
    ${WORKTIPS_CORE_CPP_SRC}/serial_bridge_index.cpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_send_routine.hpp
    ${WORKTIPS_CORE_CPP_SRC}/worktips_send_routine.cpp
    ${WORKTIPS_CORE_CPP_SRC}/serial_bridge_utils.hpp
    ${WORKTIPS_CORE_CPP_SRC}/serial_bridge_utils.cpp
    ${WORKTIPS_CORE_CPP_SRC}/tools__ret_vals.hpp
    ${WORKTIPS_CORE_CPP_SRC}/tools__ret_vals.cpp
    #
    ${WORKTIPS_SRC}/cryptonote_basic/cryptonote_basic_impl.cpp
    ${WORKTIPS_SRC}/cryptonote_basic/account.cpp
    ${WORKTIPS_SRC}/cryptonote_basic/cryptonote_format_utils.cpp
    ${WORKTIPS_SRC}/crypto/crypto.cpp
    ${WORKTIPS_SRC}/crypto/hash.c
    #${WORKTIPS_SRC}/crypto/slow-hash.c
    ${WORKTIPS_SRC}/crypto/oaes_lib.c
    ${WORKTIPS_SRC}/crypto/crypto-ops.c
    ${WORKTIPS_SRC}/crypto/crypto-ops-data.c
    ${WORKTIPS_SRC}/crypto/keccak.c
    ${WORKTIPS_SRC}/crypto/chacha.c
    ${WORKTIPS_SRC}/crypto/random.c
    ${WORKTIPS_SRC}/crypto/aesb.c
    ${WORKTIPS_SRC}/crypto/tree-hash.c
    ${WORKTIPS_SRC}/crypto/hash-extra-blake.c
    ${WORKTIPS_SRC}/crypto/blake256.c
    ${WORKTIPS_SRC}/crypto/hash-extra-groestl.c
    ${WORKTIPS_SRC}/crypto/hash-extra-jh.c
    ${WORKTIPS_SRC}/crypto/hash-extra-skein.c
    ${WORKTIPS_SRC}/crypto/groestl.c
    ${WORKTIPS_SRC}/crypto/jh.c
    ${WORKTIPS_SRC}/crypto/skein.c
    ${WORKTIPS_SRC}/cryptonote_core/cryptonote_tx_utils.cpp
    ${WORKTIPS_SRC}/common/base58.cpp
    ${WORKTIPS_SRC}/common/threadpool.cpp
    ${WORKTIPS_SRC}/common/aligned.c
    ${WORKTIPS_SRC}/common/util.cpp
    ${WORKTIPS_SRC}/epee/src/hex.cpp
    ${WORKTIPS_SRC}/epee/src/string_tools.cpp
    ${WORKTIPS_SRC}/epee/src/memwipe.c
    ${WORKTIPS_SRC}/epee/src/mlocker.cpp
    ${WORKTIPS_SRC}/epee/src/wipeable_string.cpp
    ${WORKTIPS_SRC}/device/device.cpp
    ${WORKTIPS_SRC}/device/device_default.cpp
    ${WORKTIPS_SRC}/ringct/rctOps.cpp
    ${WORKTIPS_SRC}/ringct/rctTypes.cpp
    ${WORKTIPS_SRC}/ringct/rctCryptoOps.c
    ${WORKTIPS_SRC}/ringct/rctSigs.cpp
    ${WORKTIPS_SRC}/ringct/bulletproofs.cc
    ${WORKTIPS_SRC}/ringct/multiexp.cc
    ${WORKTIPS_SRC}/mnemonics/electrum-words.cpp
    ${WORKTIPS_SRC}/vtlogger/logger.cpp
    ${WORKTIPS_SRC}/contrib/libsodium/src/crypto_verify/verify.c
)


#
#
set (
    EMCC_LINKER_FLAGS___BASE
    #
    # TODO? does EXPORT_NAME need to be the same for both targets? (or should it be set per-target with …_WASM, …_ASMJS?)
    "-Wall -std=c++14 \
--bind -s MODULARIZE=1 \
-s 'EXPORT_NAME=\"WorktipsCoreCpp\"' \
--llvm-lto 1 \
-s ERROR_ON_UNDEFINED_SYMBOLS=0 \
-s ASSERTIONS=2 \
-s EXIT_RUNTIME=0 \
-s \"BINARYEN_TRAP_MODE='clamp'\" \
-s PRECISE_F32=1 \
-s DISABLE_EXCEPTION_CATCHING=0 \
-s EXCEPTION_DEBUG=1 \
-s DEMANGLE_SUPPORT=1 \
-s NO_DYNAMIC_EXECUTION=1 \
-s EXTRA_EXPORTED_RUNTIME_METHODS='[\"UTF8ToString\"]' \
"
    # • Disabling exception catching does not introduce silent failures 
    # • Probably don't need PRECISE_F32 but wouldn't want to not use it
    #
    #
    # -s SAFE_HEAP=1 \
    # -g \
)
set(
    EMCC_LINKER_FLAGS__ASMJS
    "${EMCC_LINKER_FLAGS___BASE} \
-s WASM=0 \
-Os \
--separate-asm \
-s AGGRESSIVE_VARIABLE_ELIMINATION=1 \
-s ALLOW_MEMORY_GROWTH=0 \
--memory-init-file 0 \
-s SEPARATE_ASM_MODULE_NAME=asmjs \
"
    # --memory-init-file is explicitly set to 0 because optimization level is Oz, and some clients like React Native have trouble loading .mem files
    # .... it also didn't seem to have a giant impact on perf. but this should be tested again
    #
    # --closure 1 \
)
set(
    EMCC_LINKER_FLAGS__WASM
    "${EMCC_LINKER_FLAGS___BASE} \
-s WASM=1 \
-Oz \
-s ALLOW_MEMORY_GROWTH=1 \
--post-js ${CMAKE_CURRENT_LIST_DIR}/src/module-post.js \
"
    # -g \
)
#
#    -s EXPORTED_FUNCTIONS='[\"_sc_reduce\", \"_sc_reduce32\", \"_sc_check\", \"_sc_add\", \"_ge_fromfe_frombytes_vartime\", \"_ge_mul8\", \"_ge_p1p1_to_p3\", \"_ge_p3_tobytes\", \"_ge_scalarmult\", \"_ge_tobytes\", \"_sc_sub\", \"_sc_mulsub\", \"_ge_scalarmult_base\", \"_sc_0\", \"_ge_double_scalarmult_base_vartime\", \"_ge_double_scalarmult_precomp_vartime\", \"_ge_frombytes_vartime\", \"_ge_dsm_precomp\"]' \
#
#
message(STATUS "EMCC_LINKER_FLAGS__WASM ${EMCC_LINKER_FLAGS__WASM}")
message(STATUS "EMCC_LINKER_FLAGS__ASMJS ${EMCC_LINKER_FLAGS__ASMJS}")
#
add_executable(WorktipsCoreCpp_WASM ${SRC_FILES})
add_executable(WorktipsCoreCpp_ASMJS ${SRC_FILES})
#
set_target_properties(WorktipsCoreCpp_WASM PROPERTIES LINK_FLAGS "${EMCC_LINKER_FLAGS__WASM}")
set_target_properties(WorktipsCoreCpp_ASMJS PROPERTIES LINK_FLAGS "${EMCC_LINKER_FLAGS__ASMJS}")
#
# set_target_properties(WorktipsCoreCpp_WASM PROPERTIES SUFFIX ".html")
# set_target_properties(WorktipsCoreCpp_ASMJS PROPERTIES SUFFIX ".html")
#
target_link_libraries(
    WorktipsCoreCpp_WASM
    #
    ${log-lib}
)
target_link_libraries(
    WorktipsCoreCpp_ASMJS
    #
    #
    ${log-lib}
)
