# Package

version 	= "0.2.4"
author		= "iwakuramarie"
description	= "a command line based text editor"
license		= "CC-0"
srcDir		= "src"
bin		= @["juri"]

# Dependencies

requires "nim >= 1.4.0"
requires "https://github.com/walkre-niboshi/nim-ncurses >= 1.0.2"
requires "unicodedb >= 0.9.0"
requires "parsetoml >= 0.4.0"

task release, "Build for release":
	exec "nim c -o:juri -d:release src/juri"
