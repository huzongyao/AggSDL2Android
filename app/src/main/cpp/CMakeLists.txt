# Sets the minimum version of CMake required to build the native
# library. You should either keep the default value or only pass a
# value of 3.4.0 or lower.

cmake_minimum_required(VERSION 3.4.1)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DGL_GLEXT_PROTOTYPES")

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds it for you.
# Gradle automatically packages shared libraries with your APK.
set(SDL2_ROOT "SDL2-2.0.8")

include_directories("${SDL2_ROOT}/include"
                    "${SDL2_ROOT}/src")

file(GLOB SDL2_SRCS "${SDL2_ROOT}/src/*.c"
        "${SDL2_ROOT}/src/audio/*.c"
        "${SDL2_ROOT}/src/audio/android/*.c"
        "${SDL2_ROOT}/src/audio/dummy/*.c"
        "${SDL2_ROOT}/src/atomic/SDL_atomic.c"
        "${SDL2_ROOT}/src/atomic/SDL_spinlock.c"
        "${SDL2_ROOT}/src/core/android/*.c"
        "${SDL2_ROOT}/src/cpuinfo/*.c"
        "${SDL2_ROOT}/src/dynapi/*.c"
        "${SDL2_ROOT}/src/events/*.c"
        "${SDL2_ROOT}/src/file/*.c"
        "${SDL2_ROOT}/src/haptic/*.c"
        "${SDL2_ROOT}/src/haptic/android/*.c"
        "${SDL2_ROOT}/src/joystick/*.c"
        "${SDL2_ROOT}/src/joystick/android/*.c"
        "${SDL2_ROOT}/src/joystick/steam/SDL_steamcontroller.c"
        "${SDL2_ROOT}/src/loadso/dlopen/*.c"
        "${SDL2_ROOT}/src/power/*.c"
        "${SDL2_ROOT}/src/power/android/*.c"
        "${SDL2_ROOT}/src/filesystem/android/*.c"
        "${SDL2_ROOT}/src/render/*.c"
        "${SDL2_ROOT}/src/render/*/*.c"
        "${SDL2_ROOT}/src/stdlib/*.c"
        "${SDL2_ROOT}/src/thread/*.c"
        "${SDL2_ROOT}/src/thread/pthread/*.c"
        "${SDL2_ROOT}/src/timer/*.c"
        "${SDL2_ROOT}/src/timer/unix/*.c"
        "${SDL2_ROOT}/src/video/*.c"
        "${SDL2_ROOT}/src/video/android/*.c"
        "${SDL2_ROOT}/src/video/yuv2rgb/*.c"
        "${SDL2_ROOT}/src/test/*.c")

add_library(SDL2 SHARED ${SDL2_SRCS})


# -------------------------------------------------------------------------------
# libagg
set(AGG_ROOT "agg-2.5")

include_directories("${AGG_ROOT}/include")

file(GLOB AGG_SRCS "${AGG_ROOT}/examples/lion_lens.cpp"
        "${AGG_ROOT}/examples/parse_lion.cpp"
        "${AGG_ROOT}/src/*.cpp"
        "${AGG_ROOT}/src/ctrl/*.cpp"
        "${AGG_ROOT}/src/platform/sdl2/*.cpp")

add_library(main SHARED ${AGG_SRCS})

# Specifies libraries CMake should link to your target library. You
# can link multiple libraries, such as libraries you define in the
# build script, prebuilt third-party libraries, or system libraries.

target_link_libraries(SDL2 dl GLESv1_CM GLESv2 log android)
target_link_libraries(main SDL2 GLESv1_CM GLESv2 log)
