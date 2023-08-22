include inputloader, tables

let inputRaw2 = strip """
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
"""
let input2 = inputRaw2.splitlines

proc `$`*(t: Table[string, int]): string =
  for k, v in t:
    #result.add "$#: $#\n" % [k, $v]
    result.add "$#: $#, " % [k, $v]
  result = "{$#}" % result.strip.strip(chars = {','})

type Dir = ref object
  name: string
  children: seq[Dir]
  files: Table[string, int]
  calcSize: int

proc `$`*(dir: Dir): string =
  result.add "Dir("
  for fName, fValue in dir[].fieldPairs():
    result.add "$#: $#, " % [fName, $fValue]
  result = result.strip.strip(chars = {','}) & ")"

proc newDir(name: string): Dir =
  Dir(name: name, children: @[], files: initTable[string, int](), calcSize: -1)

proc `[]`(self: Dir, name: string): Dir =
  for c in self.children:
    if c.name == name: return c
  result = newDir(name)
  self.children.add result

proc `[]=`(self: Dir, file: string, size: int) =
  self.files[file] = size

var rootDir = newDir( "/")
var curDir: seq[string]
var allDirs = @[rootDir]

proc getDir(dirPath = curDir): Dir =
  var dir = rootDir
  for path in dirPath:
    if dir notin allDirs:
      allDirs.add dir
    dir = dir[path]
  return dir

#var input = inputRaw.split("$ ") --> filter(it.len != 0).map(it.strip.split)
for i in input2:
  if i.startsWith"$ cd":
    case i["$ cd ".len..^1]
    of "..":
      discard curDir.pop()
    of "/":
      curDir = @[]
    else:
      curDir.add i["$ cd ".len..^1]
  elif i == "$ ls":
    discard
  else:
    let
      splt = i.split
      #size = splt[0]
      #file = splt[1]
    if splt[0] == "dir":
      discard
    else:
      var dir = getDir()
      dir[splt[1]] = splt[0].parseInt
    #print file, size
#print rootDir


proc calcSums(dir: Dir): int =
  result = dir.files.values --> sum() + dir.children --> map(calcSums).sum()
  dir.calcSize = result

block part1:
  var i = 0
  discard calcSums(rootDir)
  print allDirs --> map(it.calcSize)
  echo allDirs --> filter(it.name == "/")
  #print rootDir
  for dir in allDirs:
    echo "Directory: " & $dir
    if dir.calcSize <= 100_000:
      i += dir.calcSize
    
  print i

block part2:
  var i = 0

  
  print i

