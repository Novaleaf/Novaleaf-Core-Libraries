

@echo off
@echo .
@echo .
@echo ====================  ====================    ====================  
@echo ====================  START EXECUTING BATCH FILE: %0
@echo ====================  ====================    ====================  
@echo .
@echo .

@rem @echo off

@rem @echo ------------------------------------
@rem @echo SET UP ENVIRONMENT HELPERS
@rem @echo ------------------------------------


@rem get location of the batch file
set thisPath=%0
FOR /F %%I IN ("%0") DO SET thisDir=%%~dpI

@rem get date
FOR /F "TOKENS=1* DELIMS= " %%A IN ('DATE/T') DO SET CDATE=%%B
FOR /F "TOKENS=1,2 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET mm=%%B
FOR /F "TOKENS=1,2 DELIMS=/ eol=/" %%A IN ('echo %CDATE%') DO SET dd=%%B
FOR /F "TOKENS=2,3 DELIMS=/ " %%A IN ('echo %CDATE%') DO SET yyyy=%%B
SET date=%yyyy%%mm%%dd%

@rem @echo ------------------------------------
@rem @echo SET UP PURPOSE HELPERS
@rem @echo ------------------------------------

set targetDir=%VS110COMNTOOLS%..\Packages\schemas\html\
set targetFile=xhtml_5.xsd
set sourceDir=%thisDir%
set sourceFile=xhtml_5-ng.xsd
set targetBackupFile=%targetFile%.%date%.original

@echo ------------------------------------
@echo PURPOSE OF THIS FILE:  install our xhtml5 schema with ng bindings into visual studio 2012.
@echo     you need to run this as administrator, and need to restart visual studio afterwards to take effect
@echo ------------------------------------
pause
@echo .
@echo .


@rem @echo debug: verify paths are OK
@rem @echo %thisPath%
@rem @echo %thisDir%
@rem @echo %targetDir%
@rem @echo %sourceDir%



@echo backup original to %targetDir%%targetBackupFile%
@echo .
@echo == SAY NO IF ASKED TO OVERWRITE! == 
@echo .
copy "%targetDir%%targetFile%" "%targetDir%%targetBackupFile%" /-Y
@echo copy, overwriting xhtml5 schema 
xcopy "%sourceDir%%sourceFile%" "%targetDir%%targetFile%"  /Y

@echo .
@echo .
@echo ====================  ====================    ====================  
@echo ====================  FINISHED EXECUTING BATCH FILE: %0
@echo ====================  ====================    ====================  
@echo .
@echo .

exit 0