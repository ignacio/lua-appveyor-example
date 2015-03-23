Setlocal EnableDelayedExpansion

cd %APPVEYOR_BUILD_FOLDER%

:: Download and compile Lua (or LuaJIT)
if "%LUA%"=="luajit" (
	set lj_dest_folder=c:\lj%LJ_SHORTV%
	
	if !LJ_SHORTV!==2.1 (
		set lj_source_folder=c:\luajit-%LJ_VER%
		git clone http://luajit.org/git/luajit-2.0.git !lj_source_folder!
		c: && cd !lj_source_folder!\src
		git checkout v2.1
	) else (
		%DOWNLOADER% http://luajit.org/download/LuaJIT-%LJ_VER%.zip
		set lj_source_folder=!CD!\luajit-%LJ_VER%
		"%SEVENZIP%" x LuaJIT-%LJ_VER%.zip
		cd !lj_source_folder!\src
	)
	call msvcbuild.bat

	if not exist !lj_dest_folder! (
		mkdir !lj_dest_folder!
		mkdir !lj_dest_folder!\bin
		mkdir !lj_dest_folder!\include
		mkdir !lj_dest_folder!\lib
	)

	move !lj_source_folder!\src\luajit.exe !lj_dest_folder!\bin
	move !lj_source_folder!\src\lua51.dll !lj_dest_folder!\bin
	move !lj_source_folder!\src\lua51.lib !lj_dest_folder!\lib
	for %%a in (lauxlib.h lua.h lua.hpp luaconf.h lualib.h) do ( copy "!lj_source_folder!\src\%%a" "!lj_dest_folder!\include" )

	set LUA_DIR=!lj_dest_folder!
) else (
	%DOWNLOADER% %LUAURL%/lua-%LUA_VER%.tar.gz
	"%SEVENZIP%" x lua-%LUA_VER%.tar.gz
	"%SEVENZIP%" x lua-%LUA_VER%.tar
	cd lua-%LUA_VER%
	%DOWNLOADER% https://github.com/Tieske/luawinmake/archive/master.zip
	"%SEVENZIP%" x master.zip
	if not exist etc mkdir etc
	mv luawinmake-master\etc\winmake.bat %APPVEYOR_BUILD_FOLDER%\lua-%LUA_VER%\etc\winmake.bat
	call etc\winmake
	call etc\winmake install c:\lua%LUA_VER%
	set LUA_DIR=c:\lua%LUA_VER%
)

:: defines LUA_DIR so Cmake can find this Lua install
set PATH=!PATH!;!LUA_DIR!\bin
call !LUA! -v

:: Downloads and installs LuaRocks
cd %APPVEYOR_BUILD_FOLDER%
%DOWNLOADER% %LUAROCKS_URL%/luarocks-%LUAROCKS_VER%-win32.zip
"%SEVENZIP%" x luarocks-%LUAROCKS_VER%-win32.zip
cd luarocks-%LUAROCKS_VER%-win32
call install.bat /LUA %LUA_DIR% /Q /LV %LUA_SHORTV%
set PATH=%PATH%;%ProgramFiles(x86)%\LuaRocks\%LUAROCKS_SHORTV%\;%ProgramFiles(x86)%\LuaRocks\systree\bin
set LUA_PATH=%ProgramFiles(x86)%\LuaRocks\%LUAROCKS_SHORTV%\lua\?.lua;%ProgramFiles(x86)%\LuaRocks\%LUAROCKS_SHORTV%\lua\?\init.lua;%ProgramFiles(x86)%\LuaRocks\systree\share\lua\%LUA_SHORTV%\?.lua;%ProgramFiles(x86)%\LuaRocks\systree\share\lua\%LUA_SHORTV%\?\init.lua
set LUA_CPATH=%ProgramFiles(x86)%\LuaRocks\systree\lib\lua\%LUA_SHORTV%\?.dll
call luarocks --version

endlocal & set LUA_DIR=%LUA_DIR% & set PATH=%PATH%
