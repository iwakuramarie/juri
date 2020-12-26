# Features

## Automatic backups

Automatic backups are enabled by default.

juri is not yet "stable". Automatic backups are recommended to keep it enabled
A .history directory is created in the same directory as the source files and backups are regularly created in it.

if open ```~/juri/test.nim```, a backup will be created in ```~/juri/.history``` directory.

Backup file name is Original file name + '_' + time + Original file extension.  

For example, if open  ```test.nim```, a backup file name is ```test_2020-07-31T23:17:00+09:00.nim```

Of course, you can set an interval to execute backups.

## QuickRun

QuickRun is like vim-quickrun.

You can use ```\ + r``` in normal mode. And ```run``` or ```Q``` command in ex mode.  
Currently QuickRun supports these languages by default and runs the following command internally.

- Nim ```nim c -r filename```
- C ```gcc filename && ./a.out```
- C++ ```g++ filename && ./a.out```
- bash ```bash filename```
- sh ```sh filename```

You can overwrite the command to be executed in the setting. That way you can use other compilers and languages.

## VSCode theme

juri supports VS Code themes in addition to dark, vivid, light, which are provided as standard.  
juri is searching and reflects the current VSCode theme if you already installed VSCode and you set "vscode" in the configuration file.

## Build on save

juri can build on save if you set true in BuildOnSave.enable in the configuration file.  
By default, the ```nim c filename``` command is executed.  
You can set workSpaceRoot and command to be executed in the configuration file.

## History mode (Backup file manager)

History mode is experimental feature.

You can check, restore and delete backup files in this mode.  
If you select backup file, you can check the difference from the current original file.  

## General-purpose autocomplete

juri can now use simple auto-complete.  
It is possible to auto-complete a words in the currently open buffer.