workspace "Luminex"
    configurations { "Debug", "Development", "Profile", "Release" }
    platforms { "Win64", "MacOS" }

    startproject "Luminex"
    location "Build"
    objdir "Build/Intermediate/%{cfg.platform}/%{cfg.buildcfg}"
    targetdir "Build/Bin/%{cfg.platform}/%{cfg.buildcfg}"
    buildlog "Build/buildLog.log"

    cppdialect "C++20"
    rtti "Off"
    characterset "Unicode"
    --warnings "Default"
    warnings "Extra"

    flags { "MultiProcessorCompile", "FatalWarnings",  }

    filter { "platforms:Win64" }
        system "windows"
        defines { "WIN32", "_WIN32", "PLATFORM_WINDOWS" }
        systemversion "latest"
        architecture "x86_64"
        clr "Off"

    filter { "platforms:MacOS" }
        system "macosx"
        defines { "PLATFORM_MACOS" }
        systemversion "latest"
        architecture "universal"

    filter { "configurations:Debug" }
		defines { "DEBUG", "_DEBUG" }
		symbols "On"
		optimize "Off"
        omitframepointer "Off"
        exceptionhandling "On"
		
	filter { "configurations:Development" }
		defines { "DEBUG", "_DEBUG", "DEVELOPMENT" }
		symbols "On"
		optimize "Debug"
        omitframepointer "Off"
        exceptionhandling "On"

    filter { "configurations:Profile" }
		defines { "NDEBUG", "PROFILE" }
		symbols "Off"
		optimize "Speed"
        omitframepointer "On"
        exceptionhandling "Off"
        flags { "LinkTimeOptimization" }
	
	filter { "configurations:Release" }
		defines { "NDEBUG" }
		symbols "Off"
		optimize "Full"
        omitframepointer "On"
        exceptionhandling "Off"
        flags { "LinkTimeOptimization" }

    filter {}

project "Luminex"
    kind "WindowedApp"
    targetname "Luminex"

    pchheader "pch.h"
    pchsource "Source/Luminex/pch.cpp"
    includedirs { "Source/Luminex" }

    language "C++"

    files { "Source/Luminex/**.h", "Source/Luminex/**.cpp" }
    files { "premake5.lua" }
    removefiles { "**/Platform/**" }

    filter { "platforms:Win64" }
        files { "Source/Luminex/Platform/Windows/**.h", "Source/Luminex/Platform/Windows/**.cpp" }

    filter { "files:**.lua" }
        flags { "ExcludeFromBuild" }  

    filter {}