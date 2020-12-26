import parseopt, pegs, os, strformat

type CmdParsedList* = seq[tuple[filename: string]]

proc staticReadVersionFromNimble: string {.compileTime.} =
  let peg = """@ "version" \s* "=" \s* \" {[0-9.]+} \" @ $""".peg
  var captures: seq[string] = @[""]
  let
    nimblePath = currentSourcePath.parentDir() / "../../juri.nimble"
    nimbleSpec = staticRead(nimblePath)

  assert nimbleSpec.match(peg, captures)
  assert captures.len == 1
  return captures[0]

proc checkReleaseBuild: string {.compileTime.} =
  if defined(release): return "Release"
  else: return "Debug"

proc generateVersionInfoMessage(): string =
  const
    versionInfo = "juri v" & staticReadVersionFromNimble()
    buildType = "Build type: " & checkReleaseBuild()

  result = versionInfo & "\n" & buildType

proc writeVersion() =
  echo generateVersionInfoMessage()
  quit()

proc generateHelpMessage(): string =
  const helpMessage = """
Usage:
  juri [file]       Edit file
Arguments:
  -h, --help       Print this help
  -v, --version    Print version
"""

  result = generateVersionInfoMessage() & "\n\n" & helpMessage

proc writeHelp() =
  echo generateHelpMessage()
  quit()

proc writeCmdLineError(kind: CmdLineKind, arg: string) =
  # Short option or long option
  let optionStr = if kind == cmdShortOption: "-" else: "--"

  echo fmt"Unknown option argument: {optionStr}{arg}"
  echo """Please check "juri -h""""
  quit()

proc parseCommandLineOption*(line: seq[string]): CmdParsedList =
  var
    parsedLine = initOptParser(line)
    index = 0
  for kind, key, val in parsedLine.getopt():
    case kind:
      of cmdArgument:
        result.add((filename: key))
      of cmdShortOption:
        case key:
          of "v": writeVersion()
          of "h": writeHelp()
          else: writeCmdLineError(kind, key)
      of cmdLongOption:
        case key:
          of "version": writeVersion()
          of "help": writeHelp()
          else: writeCmdLineError(kind, key)
      of cmdEnd:
        assert(false)

    inc(index)