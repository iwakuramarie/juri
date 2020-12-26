import os, osproc, strformat
import syntax/highlite
import unicodetext

proc build*(filename, workspaceRoot,
            command: seq[Rune],
            language: SourceLanguage): tuple[output: TaintedString, exitCode: int] =

  if language == SourceLanguage.langNim:
    let
      currentDir = getCurrentDir()
      workspaceRoot = workspaceRoot
      cmd = if command.len > 0: $command
            elif ($workspaceRoot).dirExists: fmt"cd {workspaceRoot} && nimble build"
            else: fmt"nim c {filename}"

    result = cmd.execCmdEx

    currentDir.setCurrentDir

  elif command.len > 0:
    let currentDir = getCurrentDir()

    result = ($command).execCmdEx

    if getCurrentDir() != currentDir: currentDir.setCurrentDir