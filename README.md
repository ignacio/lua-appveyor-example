[![Build status](https://ci.appveyor.com/api/projects/status/subf1ydrutspjtk8/branch/master?svg=true)](https://ci.appveyor.com/project/ignacio/lua-appveyor-example/branch/master)
[![License](http://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE)

# lua-appveyor-example

This sample repository is intended as a sample of how to integrate your Lua project with [AppVeyor](https://ci.appveyor.com/), providing you with continuous integration.

This sample builds a matrix with Lua (versions 5.1, 5.2 and 5.3) and LuaJIT (2.0 and 2.1). That means that each time you commit some changes, five jobs will be queued, so your code will be run using each of those versions.
So, each job will do the following:
* Installs the appropiate Lua (using [luawinmake](https://github.com/Tieske/luawinmake)) or LuaJIT version.
* Installs [LuaRocks](https://rocks.moonscript.org/) (2.2.1)
* Builds and installs a sample Lua module containing C and Lua parts
* Runs tests using [Telescope](https://github.com/norman/telescope)

This sample is based on Alexey Melnichuk's [lua-travis-example](https://github.com/moteus/lua-travis-example).

## Customizing the environment

By default, you can set a test matrix with different Lua and LuaJIT versions. Using the `LUA_VER` variable yo specify the full Lua version to use (i.e. 5.2.4).
Using the `LJ_VER` variable, you specify the LuaJIT version to use (i.e. 2.0.3). LuaJIT 2.1 is special in that it is currently tracking the HEAD of its git repository.

The following variables can also be overridden if necessary:

- LUAROCKS_URL: Where to download LuaRocks from (http://keplerproject.github.io/luarocks/releases)
- LUAROCKS_REPO: Which LuaRocks repository to use (http://rocks.moonscript.org)
- LUA_URL: Where to download Lua from (http://www.lua.org/ftp)
- LUAJIT_GIT_REPO: Where is LuaJIT's git repository (http://luajit.org/git/luajit-2.0.git)
- LUAJIT_URL: Where to download LuaJIT stable releases from (http://luajit.org/download)
- LR_EXTERNAL: c:\external
- LUAROCKS_INSTALL: Where to install LuaRocks (%ProgramFiles(x86)%\LuaRocks)
- LR_SYSTREE: Where to install the system tree (%ProgramFiles(x86)%\LuaRocks\systree)
- SEVENZIP: Path of [7z](http://www.7-zip.org/)
