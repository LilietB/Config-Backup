The purpose of the script is to create a copy of all files named "config.json" in a particular folder and its subfolders, with preservation of folder structure, so that the resulting backup can be copypasted back to restore all such files to the state and location they were in during the scan. It will also create a "ConfigList.txt" file with a full list of all found config.json files and the relative paths to them.

For example, let's say we have a Mods folder with several subfolders.
```Mods
|-LittleMods
|       |-LittleMod1
|       |     |-another file
|       |     |-config.json
|       |-LittleMod2
|       |      |-another file
|       |     |-config.json
|-BigMod
    |-another file
    |-yet another file
    |-more files
    |config.json

After running the script in the Mods folder, it will create the following structure:

Mods
|-ConfigBackup
|    |-LittleMods
|    |       |-LittleMod1
|    |       |     |-config.json
|    |       |-LittleMod2
|    |       |     |-config.json
|    |-BigMod
|        |config.json
|-ConfigList.txt
|
|-LittleMods (...)
|-BigMod (...)```

The original folders will not be changed in any way, only copied.


=========INSTRUCTIONS=========

The script file (either .ps1 or .exe) should be placed in the folder whose subfolders you want to scan for config.json files to backup.

Upon running it, it will create a temporary folder named ".ConfigBackup" in the same folder, and on successful completion will rename it to "ConfigBackup" and delete any previous "ConfigBackup" folder that might have already been there. If the script fails to complete, the ".ConfigBackup" folder should be deleted manually by the user. Any files and folders that have "ConfigBackup" in their name will be ignored during the search.

The file "ConfigList.txt" will be created in the same folder, and can be used to verify that any particular file, folder or path you want to check on was found, to get a total count of the files, and so on.

The .exe version of the script has much stricter limitations on file path length. If you are using it and you use a deep structure with many subfolders with long names, you may want to run the script deeper into them instead of from the root folder.

The .ps1 version of the script is cross-platform. However, Windows requires special security permission to run .ps1 files. That's why the .exe version exists.
