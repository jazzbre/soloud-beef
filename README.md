# [soloud-beef](https://github.com/jazzbre/soloud-beef) SoLoud wrapper for the Beef Programming Language

[soloud](https://github.com/jarikomppa/soloud)

## Prerequisites
- To initialize submodules run *git submodule update --init --recursive*

## Windows
- Visual Studio 2019 Community/Professional (it can be built with other versions though, check build_windows_vs2019.cmd for more information)
- To build prerequisites run *build_windows_vs2019.cmd*

## MacOS
- To build prerequisites run *./build_macos.sh*

## Linux
- To build prerequisites run *./build_linux.sh*


## Usage

Open workspace and set Example as Startup project and Run!

Example is the C API example from SoLoud, it uses *winmm backend* by default.

To use SDL2, run "build_windows_vs2019.cmd PATH_TO_SDL2_HERE", run the Example and *SDL2 backend* will be used.

## Future work
iOS and Android build scripts.
