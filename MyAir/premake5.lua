project "MyAir"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",
		"vendor/json/**.h",
		"vendor/json/**.cpp"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	includedirs
	{
		"src",
		"vendor/json/include"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
		}

	filter "configurations:Debug"
		defines "MYAIR_DEBUG"
		runtime "Debug"
		symbols "on"


	filter "configurations:Release"
		defines "MYAIR_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "MYAIR_DIST"
		runtime "Release"
		optimize "on"