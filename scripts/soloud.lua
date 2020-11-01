project "soloud"
	kind "StaticLib"
   windowstargetplatformversion("10.0")
   
   local sdl2path = os.getenv("SDL2PATH")
   if (sdl2path) then
      print("Using SDL2!")
      defines { "WITH_SDL2_STATIC" }
      includedirs {
         path.join(sdl2path, "include"),
      }
      files {
         path.join(SOURCE_DIR, "soloud/src/backend/sdl2_static/**.c*"),
      }
   else
      defines { "WITH_WINMM" }
      files {
         path.join(SOURCE_DIR, "soloud/src/backend/winmm/**.c*"),
      }
   end

	includedirs {
		path.join(SOURCE_DIR, "soloud/include"),
      path.join(SOURCE_DIR, "soloud/src/**")
	}

	files {
      path.join(SOURCE_DIR, "soloud/include/**.h"),
		path.join(SOURCE_DIR, "soloud/src/audiosource/**.c*"),
		path.join(SOURCE_DIR, "soloud/src/filter/**.c*"),
		path.join(SOURCE_DIR, "soloud/src/core/**.c*"),      
      path.join(SOURCE_DIR, "soloud/src/c_api/**.c*")
	}

	configuration {}
