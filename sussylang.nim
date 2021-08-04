import strutils
import random
import os

let error_msgs: array = [ "Don't lie to me Walt!", "I don't know man, you've been seeming sus lately!", "Sussy Baka!" ]
var stack: seq[int] = @[]

var i = 0

proc isValidInt(str: string): bool =
    for i in 0 ..< str.len:
        if(not str[i].isDigit()):
            return false
    return true

proc sussy_parser(line: string): void =
    if(line.substr(0, 3) == "sus "):
        if(not line.substr(4).isValidInt()):
            echo(sample(error_msgs), ':', i)
            randomize()
            return
        stack.add(line.substr(4).parseInt())
    elif(line == "sussy"):
        if(stack.len == 0):
            echo(sample(error_msgs), ':', i)
            randomize()
            return
        discard stack.pop()
    elif(line == "sussybaka"):
        if(stack.len == 0):
            echo(sample(error_msgs), ':', i)
            randomize()
            return
        stdout.write($stack[stack.high])
    elif(line == "amogus"):
        if(stack.len == 0):
            echo(sample(error_msgs), ':', i)
            randomize()
            return
        stdout.write($stack[stack.high].chr)
    elif(line == "sussyballs"):
        if(stack.len < 2):
            echo(sample(error_msgs), ':', i)
            randomize()
            return
        stack.add(-stack.pop())
    elif(line == "imposter"):
        if(stack.len < 2):
            echo(sample(error_msgs), ':', i)
            randomize()
            return
        let a: int = stack.pop()
        let b: int = stack.pop()
        stack.add(a + b)
    elif(line == "crew"):
        if(stack.len < 2):
            echo(sample(error_msgs), ':', i)
            randomize()
            return
        let a: int = stack.pop()
        let b: int = stack.pop()
        stack.add(a * b)
    elif(line == "ඞ"):
        if(stack.len < 2):
            echo(sample(error_msgs), ':', i)
            randomize()
            return
        let a: int = stack.pop()
        let b: int = stack.pop()
        stack.add((int)(a / b))
    elif(line == "amorgos"):
        if(stack.len < 2):
            echo(sample(error_msgs), ':', i)
            randomize()
            return
        let a: int = stack[stack.high]
        let b: int = stack[stack.high - 1]
        stack.add(a)
        stack.add(b)
    elif(line == "amongdrip"):
        if(stack.len == 0):
            echo(sample(error_msgs), ':', i)
            randomize()
            return
        stack.add(stack[stack.high])
    elif(line == "task"):
        if(stack.len == 0):
            echo(sample(error_msgs), ':', i)
            randomize()
            return
        if(stack[stack.high] < 1):
            i += 1
    elif(line.substr(0, 8) == "jermasus "):
        if(not line.substr(9).isValidInt()):
            echo(sample(error_msgs), ':', i)
            randomize()
            return
        i = line.substr(9).parseInt() - 1
    elif(line == "redsus"):
        let numstr: string = stdin.readLine().strip()
        if(not numstr.isValidInt()):
            echo(sample(error_msgs), ':', i)
            randomize()
            return
        stack.add(numstr.parseInt())
    elif(line == "pensus"):
        let ch: char = stdin.readChar()
        stack.add((int)ch)
    elif(line == "emergencymeeting"):
        i = -2
    else:
        echo(sample(error_msgs), " \"", line, "\":", i)
        randomize()
        return

if(paramCount() != 1):
    echo(sample(error_msgs))
    quit(-1)

let lines: seq[string] = readFile(paramStr(1)).splitLines(false)

while(i < lines.len):
    if(i == -1):
        break

    if(lines[i].strip() != ""):
        sussy_parser(lines[i].toLower().strip())
    i += 1
