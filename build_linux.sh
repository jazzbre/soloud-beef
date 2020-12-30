TESTSDL2PATH=$(pwd)/../sdl2-beef/submodules/SDL
echo Checking SDL path at $TESTSDL2PATH
if [ -d $TESTSDL2PATH ]; then
   echo Setting SDL2 path to $TESTSDL2PATH!
   export SDL2PATH=$TESTSDL2PATH
fi
./submodules/bx/tools/bin/linux/genie --gcc=linux-gcc gmake
make -C .build/projects/gmake-linux config=debug64 -j 8
make -C .build/projects/gmake-linux config=release64 -j 8
