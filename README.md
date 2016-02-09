[![Build status](https://ci.appveyor.com/api/projects/status/subf1ydrutspjtk8/branch/master?svg=true)](https://ci.appveyor.com/project/ignacio/lua-appveyor-example/branch/master)
[![License](http://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE)
[![Coverage Status](https://coveralls.io/repos/github/ignacio/lua-appveyor-example/badge.svg?branch=luacov)](https://coveralls.io/github/ignacio/lua-appveyor-example?branch=luacov)

# lua-appveyor-example

This repository is intended as an example of how to integrate your Lua project with [AppVeyor](https://ci.appveyor.com/), providing you with continuous integration on a Windows environment.

Just add `appveyor.yml` and the `.appveyor` folder to your repository, follow the steps to [enable integration](http://www.appveyor.com/docs) with AppVeyor and that's it.

Each time you push some changes to your repository, or someone sends you a pull request, the code will be checked out, built and tested with different versions of Lua (and LuaJIT), for both 32 and 64 bits, using different compilers.

All those combinations form what is known as a "build matrix". The matrix is comprised of "build jobs". Each build job will download and build a given Lua and LuaRocks version, using a given compiler, for the given platform. So, one build job could be "Lua 5.3.1 64 bits using Visual Studio 2015", another one could be "Lua 5.2.4 32 bits using MinGW", etc.

- Supported Lua versions are 5.1, 5.2 and 5.3.
- Supported LuaJIT versions are 2.0.4 and 2.1
- Supported compilers are Visual Studio 2012 to 2015 (for both 32 and 64 bits), Visual Studio 2008 and 2010 (only for 32 bits) and MinGW (only for 32 bits).

Note: It is best to edit the `appveyor.yml` file to suite your needs. You probably won't need to run tests using all those different compilers, or you're just interested in a certain Lua version. See the _Customizing the environment_ section below.

So, each job will do the following:
* Install the appropiate Lua (using [luawinmake](https://github.com/Tieske/luawinmake)) or LuaJIT version.
* Install [LuaRocks](https://luarocks.org/) (2.3.0)
* Build and install a sample Lua module containing C and Lua parts, using the selected compiler.
* Run tests using [Busted](http://olivinelabs.com/busted/)
* Uploads a coverage report to [coveralls.io](https://coveralls.io/) using [luacov](https://keplerproject.github.io/luacov/) and [luacov-coveralls](https://github.com/moteus/luacov-coveralls).

This project is based on Alexey Melnichuk's [lua-travis-example](https://github.com/moteus/lua-travis-example).

## Customizing the environment

By default, you can set a test matrix with different Lua and LuaJIT versions. Using the `LUA_VER` variable yo specify the full Lua version to use (i.e. 5.2.4).
Using the `LJ_VER` variable, you specify the LuaJIT version to use (i.e. 2.0.4). LuaJIT 2.1 is special in that it is currently tracking the HEAD of its git repository.

The C compiler to be used is chosen ìn the `configuration` section of the `appveyor.yml` file, and the platform (32 or 64 bits) is chosen in the `platform` section.

The following variables can also be overridden if necessary:

- LUAROCKS_URL: Where to download LuaRocks from (http://keplerproject.github.io/luarocks/releases)
- LUAROCKS_REPO: Which LuaRocks repository to use (https://luarocks.org)
- LUAROCKS_VER: Which LuaRocks version to use. If you define it to `HEAD`, the current sources at [LuaRocks repository](https://github.com/keplerproject/luarocks) will be used (the _master_ branch).
- LUA_URL: Where to download Lua from (http://www.lua.org/ftp)
- LUAJIT_GIT_REPO: Where is LuaJIT's git repository (http://luajit.org/git/luajit-2.0.git)
- LUAJIT_URL: Where to download LuaJIT stable releases from (http://luajit.org/download)
- LR_EXTERNAL: c:\external
- LUAROCKS_INSTALL: Where to install LuaRocks (%ProgramFiles(x86)%\LuaRocks)
- LR_SYSTREE: Where to install the system tree (%ProgramFiles(x86)%\LuaRocks\systree)
- SEVENZIP: Path of [7z](http://www.7-zip.org/)
