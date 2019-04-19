project "ImGui"
    kind "StaticLib"
    language "C++"
    
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
        "imgui_demo.cpp"
    }
    
	filter "system:windows"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "On"

        defines
        {
             "IMGUI_API=__declspec( dllexport )"
        }

    filter "configurations:Debug"
        defines "HZ_DEBUG_ENABLED"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "HZ_RELEASE_ENABLED"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        defines "HZ_DIST_ENABLED"
        runtime "Release"
        optimize "On"
