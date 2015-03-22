cd %APPVEYOR_BUILD_FOLDER%
:: Download and compile Lua
appveyor DownloadFile %LUAURL%/lua-%LUA_VER%.tar.gz
7z x lua-%LUA_VER%.tar.gz
7z x lua-%LUA_VER%.tar
cd lua-%LUA_VER%
appveyor DownloadFile https://github.com/Tieske/luawinmake/archive/master.zip
7z x master.zip
if not exist etc mkdir etc
mv luawinmake-master\etc\winmake.bat %APPVEYOR_BUILD_FOLDER%\lua-%LUA_VER%\etc\winmake.bat
call etc\winmake.bat
call etc\winmake.bat install c:\lua%LUA_VER%
:: defines LUA_DIR so Cmake can find this Lua install
set LUA_DIR=c:\lua%LUA_VER%
set PATH=%PATH%;c:\lua%LUA_VER%\bin
:: Downloads and installs LuaRocks
cd %APPVEYOR_BUILD_FOLDER%
appveyor DownloadFile %LUAROCKS_URL%/luarocks-%LUAROCKS_VER%-win32.zip
7z x luarocks-%LUAROCKS_VER%-win32.zip
cd luarocks-%LUAROCKS_VER%-win32
call install.bat /LUA c:\lua%LUA_VER% /Q /LV %LUA_SHORTV%
set PATH="%PATH%;%ProgramFiles(x86)%\LuaRocks\%LUAROCKS_SHORTV%"
echo PATH: %PATH%
set LUA_PATH="%ProgramFiles(x86)%\LuaRocks\%LUAROCKS_SHORTV%\lua\?.lua;%ProgramFiles(x86)%\LuaRocks\%LUAROCKS_SHORTV%\lua\?\init.lua;%ProgramFiles(x86)%\LuaRocks\systree\share\lua\%LUA_SHORTV%\?.lua;%ProgramFiles(x86)%\LuaRocks\systree\share\lua\%LUA_SHORTV%\?\init.lua"
set LUA_CPATH="%ProgramFiles(x86)%\LuaRocks\systree\lib\lua\%LUA_SHORTV%\?.dll"
luarocks --version
:: Install lunitx
luarocks install lunitx
