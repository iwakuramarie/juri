# Overview

juri adopts the mode and keybinding like vi/vim.
You can easily adapt if you have used vi/vim.
Currently you can use normal mode, visual mode, replace mode, insert mode, ex mode, filer mode.

# Install and compile

## Requires
- Nim 1.2.2 or higher
- ncurses (ncursesw)

### Install

I recommend building juri with nimble:

```
$ cd juri
$ nimble install
```

If you are running Linux Ubuntu, or a distribution based on Ubuntu, you will likely need to run

```
$ sudo apt install libncurses5-dev libncursesw5-dev
$ cd juri
$ nimble install
```

Fedora

```
$ sudo dnf install ncurses-devel
$ cd juri
$ nimble install 
```

### Debug build
```
$ cd juri
$ nimble build
```

### Release build
```
$ cd juri
$ nimble release
```

# Test

## Unit test
```
nimble test
```

## Integration test

### Requires

[abduco](https://github.com/martanne/abduco)

[shpec](https://github.com/rylnd/shpec)

### Run integration test
```
shpec ./shpec.sh
```