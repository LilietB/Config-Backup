The script file (either .ps1 or .exe) should be placed in the folder whose subfolders you want to scan for config.json files to backup.

Upon running it, it will create a temporary folder named ".ConfigBackup" in the same folder, and on successful completion will rename it to "ConfigBackup" and delete any previous "ConfigBackup" folder that might have already been there. If the script fails to complete, the ".ConfigBackup" folder should be deleted manually by the user. Any files and folders that have "ConfigBackup" in their name will be ignored during the search.

It will also create a "ConfigList.txt" file that will list names and local addresses of all the config files that were found and copied.

The .exe version of the script has much stricter limitations on file path length. If you are using it and you use a deep structure with many subfolders with long names, you may want to run the script deeper into them instead of from the root folder.

The .ps1 version of the script is cross-platform. However, Windows requires special security permission to run .ps1 files. That's why the .exe version exists.
