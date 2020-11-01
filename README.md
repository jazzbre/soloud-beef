# [soloud-beef](https://github.com/jazzbre/soloud) SoLoud wrapper for the Beef Programming Language

[soloud](https://github.com/jarikomppa/soloud)

## Prerequisites
- Visual Studio 2019 Community/Professional (it can be built with other versions though, check build_windows_vs2019.cmd for more information)
- To initialize submodules run *git submodule init*  and *git submodule update*
- To build prerequisites run *build_windows_vs2019.cmd*


## Usage

Open workspace and set Example as Startup project and Run!
Example is the C API example from SoLoud, it uses winmm by default.
To use SDL2, run "build_windows_vs2019.cmd PATH_TO_SDL2_HERE", and then you can run ExampleSDL2.

## Future work
iOS, Android, macOS and Linux build scripts.
