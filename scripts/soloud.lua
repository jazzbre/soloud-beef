project "soloud"
	kind "StaticLib"
   windowstargetplatformversion("10.0")

   defines { "WITH_WINMM" }

	includedirs {
		path.join(SOURCE_DIR, "soloud/include"),
      path.join(SOURCE_DIR, "soloud/src/**")
	}

	files {
      path.join(SOURCE_DIR, "soloud/include/**.h"),
		path.join(SOURCE_DIR, "soloud/src/audiosource/**.c*"),
		path.join(SOURCE_DIR, "soloud/src/filter/**.c*"),
		path.join(SOURCE_DIR, "soloud/src/core/**.c*"),
      path.join(SOURCE_DIR, "soloud/src/backend/winmm/**.c*"),
      path.join(SOURCE_DIR, "soloud/src/c_api/**.c*")
	}

	configuration {}
