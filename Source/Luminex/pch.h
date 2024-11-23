#pragma once

#if defined(PLATFORM_WINDOWS)
    #define NOMINMAX
    #define WIN32_LEAN_AND_MEAN
    #include "Windows.h"
#endif


#if defined(_MSC_VER)
    #define WarningPush __pragma(warning(push))
    #define WarningPop __pragma(warning(pop))
    #define WarningDisable(number, string) __pragma(warning(disable:number))
#elif defined(__GNUC__) || defined(__clang__)
    #define WarningPush _Pragma("GCC diagnostic push")
    #define WarningPop _Pragma("GCC diagnostic pop")
    #define WarningDisable(number, string) _Pragma(_Detail_VGExpandStringify(GCC diagnostic ignored VGStringify(-W##string)))
#else
    #define WarningPush
    #define WarningPop
    #define WarningDisable(number, string)
#endif
