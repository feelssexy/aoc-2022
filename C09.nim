include inputloader
import sugar

type Dir = enum
  U #p = "U"
  D #own = "D"
  L #eft = "L"
  R #ight = "R"

type Move = (Dir, int)

proc dir(x: (Dir, int)): Dir = x[0]
proc dist(x: (Dir, int)): int = x[1]

proc drawField() =
  discard

proc fieldDimensions(moves: seq[Move]): (int, int, int, int) =
  # (origin_x, origin_y, w, h), origin bottom-left
  var pos = (0, 0)
  for m in moves:
    let i = (if m.dir in {Dir.U, D}c
    case m.dir
    of Dir.U:
      pos[1] += m.dist
    of Dir.R:
      pos[0] += m.dist
    of Dir.D:
      result[3] -= m.dist
      result[1] -= m.dist
    of Dir.L:
      result[2] -= m.dist
      result[0] -= m.dist
    
    #[
    # smh nim isn't smart enough for this
    # this code is pretty wrong for getting dimensions actually
    let i = (if m.dir in {Dir.U, D}: 1 else: 0)
    result[i+2] += x * m.dist
    if m.dir in {Dir.U, R}:
      result[i] += x * m.dist
    ]#
      
      

let moves: seq[(Dir, int)] = collect:
  for line in input:
    let splt = line.split
    (parseEnum[Dir](splt[0]), splt[1].parseInt)

echo fieldDimensions(moves[0..<3])

block part1:
  var i = 0
  echo moves[0..<5]

  echo i

block part2:
  var i = 0

  
  echo i

