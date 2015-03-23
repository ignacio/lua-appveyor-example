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
