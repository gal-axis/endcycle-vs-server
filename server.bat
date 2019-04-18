@echo off
IF EXIST "jre/bin/javaw.exe" (
	SET javaCommand=jre/bin/javaw.exe
) ELSE (
	SET javaCommand=javaw
)
start %javaCommand% -server -cp server.jar com.one2b3.endcycle.ui.ServerGUILauncher