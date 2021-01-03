TESTSDL2PATH=$(pwd)/../sdl2-beef/submodules/SDL
echo Checking SDL path at $TESTSDL2PATH
if [ -d $TESTSDL2PATH ]; then
   echo Setting SDL2 path to $TESTSDL2PATH!
   export SDL2PATH=$TESTSDL2PATH
fi
./submodules/bx/tools/bin/darwin/genie --gcc=osx-x64 gmake
make -C .build/projects/gmake-osx-x64 config=debug -j 8
make -C .build/projects/gmake-osx-x64 config=release -j 8
