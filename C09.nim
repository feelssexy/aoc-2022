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
  var upperBounds = (0, 0)
  var lowerBounds = (0, 0)
  for m in moves:
    let x = (if m.dir in {Dir.U, R}: 1 else: -1)
    if m.dir in {Dir.U, D}:
      pos[1] += x * m.dist
    else:
      pos[0] += x * m.dist
    upperBounds = (max(pos[0], upperBounds[0]), max(pos[1], upperBounds[1]))
    lowerBounds = (min(pos[0], lowerBounds[0]), min(pos[1], lowerBounds[1]))
  return (
    -lowerBounds[0],
    -lowerBounds[1],
    upperBounds[0] - lowerBounds[0],
    upperBounds[1] - lowerBounds[1]
  )
    
    #[
    # smh nim isn't smart enough for this
    # this code is pretty wrong for getting dimensions actually
    let x = (if m.dir in {Dir.U, R}: 1 else: -1}
    let i = (if m.dir in {Dir.U, D}: 1 else: 0)
    result[i+2] += x * m.dist
    if m.dir in {Dir.U, R}:
      result[i] += x * m.dist
    ]#
      
      

let moves: seq[(Dir, int)] = collect:
  for line in input:
    let splt = line.split
    (parseEnum[Dir](splt[0]), splt[1].parseInt)

echo fieldDimensions(moves)

#let gamer = [1, 2, 3]
#
# leaves the compiler flabbergasted
#let gamers = toSeq:
#  (iterator: string =
#    for i in gamer: yield $i)()

block part1:
  echo moves[0..<5]
  
  {.warning[EachIdentIsTuple]: off.}
  var tailPositions: seq[(int, int)]
  var pos, lastPos = (0, 0)
  var tailPos = (0, 0)
  #for m in moves:
  for m in moves[0..<5]:
    let x = (if m.dir in {Dir.U, R}: 1 else: -1)
    for i in 0..<m.dist:
      if m.dir in {Dir.U, D}:
        pos[1] += x
      else:
        pos[0] += x

      let dist = abs(pos[0] - tailPos[0]) + abs(pos[1] - tailPos[1])
      print dist
      let diff0 = pos[0] - lastPos[0]
      let diff1 = pos[1] - lastPos[1]
      let tailDiff0 = pos[0] - tailPos[0]
      let tailDiff1 = pos[1] - tailPos[1]
      print diff0, diff1
      let diag = diff0 != 0 and diff1 != 0
      doAssert not (dist > 2)

      if dist == 2:
        tailPos = lastPos

      lastPos = pos
        
      print pos, tailPos

  echo tailPositions.len

block part2:
  var i = 0

  
  echo i

