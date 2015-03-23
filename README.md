[![Build status](https://ci.appveyor.com/api/projects/status/subf1ydrutspjtk8?svg=true)](https://ci.appveyor.com/project/ignacio/lua-appveyor-example)
[![License](http://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE)

# lua-appveyor-example

This sample repository is intended as a sample of how to integrate your Lua project with [AppVeyor](https://ci.appveyor.com/), providing you with continuous integration.

This sample builds a matrix with Lua 5.1, 5.2 and 5.3. That means that each time you commit some changes, three jobs will be queued, so your code will be run using each of those Lua versions.
So, each job will do the following:
* Installs the appropiate Lua version
* Installs LuaRocks (2.2.1)
* Builds and installs a sample Lua module containing C and Lua parts
* Runs tests

This sample is based on Alexey Melnichuk's [lua-travis-example](https://github.com/moteus/lua-travis-example).
