:: Generate Datapack Package for Version of Minecraft with "pack_format"
:: Made By Th3Cr34t0r
:: Don't copy this script file
@echo off
@title Datapack Generator by Th3Cr34t0r - 2024.5.31
if exist source (
    echo Preparing to run generate.bat
    ping localhost -n 3 >nul
    goto first 
) else (
  echo Preparing to run generate.bat
  ping localhost -n 3 >nul
  echo Cannot run generate.bat
  echo folder source not found 
  echo This Program will exit in 5 seconds.
  timeout /t 5 /nobreak
  exit
)

:first
    set /p varpath=Enter Datapack Package: 
    for %%i in (project) do echo Generating Package...
    goto second

:second
    if not exist "project" (
        echo no project folder, create one
        ping localhost -n 3 >nul
        mkdir project
        cd project
        mkdir %varpath%
        cd %varpath%
        goto datapath
    ) else (
        cd project
        mkdir %varpath%
        cd %varpath%
        goto datapath
    )

:datapath
    mkdir data
    cd data
    set /p datapath=Enter Data Package: 
    mkdir %datapath%
    goto progress

:progress
    echo Please wait to create components for "%varpath%" package
    echo Create minecraft folder on datapack package
    ping localhost -n 3 >nul
    mkdir minecraft
    cd minecraft
    echo Create minecraft/tags folder on datapack package
    ping localhost -n 3 >nul
    mkdir tags
    cd tags
    echo Create minecraft/tags/functions folder on datapack package
    ping localhost -n 3 >nul
    mkdir functions
    cd functions
    echo Copy */data/minecraft/tags/functions/load.json from source/tags_load
    ping localhost -n 3 >nul
    copy "../../../../../../source/tags_load/" "./%i%"
    echo Copy */data/minecraft/tags/functions/tick.json from source/tags_tick
    ping localhost -n 3 >nul
    copy "../../../../../../source/tags_tick/" "./%i%"
    cd ../../../%datapath%
    echo Create %varpath%/data/%datapath%/functions folder on datapack package
    ping localhost -n 3 >nul
    mkdir functions
    cd functions
    echo Copy %varpath%/data/%datapath%/functions/index.mcfunction from source/index
    ping localhost -n 3 >nul
    copy "../../../../../source/index/" "./%i%"
    echo Copy %varpath%/functions/repeat.mcfunction from source/repeat
    ping localhost -n 3 >nul
    copy "../../../../../source/repeat/" "./%i%"
    cd ../

:third
    echo Select "pack_format"
    echo Not supported for Snapshot of Minecraft
    echo A: "pack_format": 4 (for 1.13 - 1.14.4)
    echo B: "pack_format": 5 (for 1.15 - 1.16.1)
    echo C: "pack_format": 6 (for 1.16.2 - 1.16.5)
    echo D: "pack_format": 7 (for 1.17 - 1.17.1)
    echo E: "pack_format": 8 (for 1.18 - 1.18.1)
    echo F: "pack_format": 9 (for 1.18.2)
    echo G: "pack_format": 10 (for 1.19 - 1.19.3)
    echo H: "pack_format": 12 (for 1.19.4)
    echo I: "pack_format": 15 (for 1.20 - 1.20.1)
    echo J: "pack_format": 18 (for 1.20.2)
    echo K: "pack_format": 26 (for 1.20.3 - 1.20.4)
    echo L: "pack_format": 41 (for 1.20.5 - 1.20.6)

    choice -c abcdefghijkl -n -m "Enter the Range [a..l]: "

    :: create pack.mcmeta from copy
    if %errorlevel% == 1 (
        echo Selected: "pack_format": 4
        copy "../../../../source/format/4" "../../%i%"
    )
    if %errorlevel% == 2 (
        echo Selected: "pack_format": 5
        copy "../../../../source/format/5" "../../%i%"
    )
    if %errorlevel% == 3 (
        echo Selected: "pack_format": 6
        copy "../../../../source/format/6" "../../%i%"
    )
    if %errorlevel% == 4 (
        echo Selected: "pack_format": 7
        copy "../../../../source/format/7" "../../%i%"
    )
    if %errorlevel% == 5 (
        echo Selected: "pack_format": 8
        copy "../../../../source/format/8" "../../%i%"
    )
    if %errorlevel% == 6 (
        echo Selected: "pack_format": 9
        copy "../../../../source/format/9" "../../%i%"
    )
    if %errorlevel% == 7 (
        echo Selected: "pack_format": 10
        copy "../../../../source/format/10" "../../%i%"
    )
    if %errorlevel% == 8 (
        echo Selected: "pack_format": 12
        copy "../../../../source/format/12" "../../%i%"
    )
    if %errorlevel% == 9 (
        echo Selected: "pack_format": 15
        copy "../../../../source/format/15" "../../%i%"
    )
    if %errorlevel% == 10 (
        echo Selected: "pack_format": 18
        copy "../../../../source/format/18" "../../%i%"
    )
    if %errorlevel% == 11 (
        echo Selected: "pack_format": 26
        copy "../../../../source/format/26" "../../%i%"
    )
    if %errorlevel% == 12 (
        echo Selected: "pack_format": 41
        copy "../../../../source/format/41" "../../%i%"
    )

    :: end
    echo Congratulations! You have successfully created datapack this name "%varpath%", This Program will exit in 5 seconds.
    timeout /t 5 /nobreak