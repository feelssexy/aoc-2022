include inputloader
import sugar

type Dir = enum
  U #p = "U"
  D #own = "D"
  L #eft = "L"
  R #ight = "R"

type Move = (Dir, int)

proc dir(x: (Dir, int)): Dir = x[0]
proc amount(x: (Dir, int)): Dir = x[1]

proc drawField() =
  discard

proc fieldDimensions(moves: seq[Move]): (int, int, int, int) =
  # (origin_x, origin_y, w, h), origin bottom-left
  var pos = (0, 0)
  for m in moves:
    case m.dir
    of Dir.U:
      

let moves: seq[(Dir, int)] = collect:
  for line in input:
    let splt = line.split
    (parseEnum[Dir](splt[0]), splt[1].parseInt)
    
block part1:
  var i = 0
  echo moves[0..<5]

  echo i

block part2:
  var i = 0

  
  echo i

