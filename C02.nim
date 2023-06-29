include inputloader

#let input = """A Y
#B X
#C Z""".splitlines

type RPS = enum
  Rock, Paper, Scissors

type `Yay?` = enum
  Lose = 0
  Draw = 3
  Win = 6

func conv(c: char): RPS =
  #[
  case c
  of 'A', 'X':
    Rock
  of 'B', 'Y':
    Paper
  of 'C', 'Z':
    Scissors
  ]#
  var i = c.ord - 'A'.ord
  if i > 2:
    i = c.ord - 'X'.ord
  RPS(i)

proc score(a, b: RPS): `Yay?` =
  if a == b:
    return Draw
  let ab = [a, b].sorted
  if ab[1] == Scissors:
    if ab[0] == Rock:
      return if ab[0] == a: Win else: Lose
    if ab[0] == Paper:
      return if ab[0] == a: Lose else: Win
  else:
    return if a == Rock: Lose else: Win

block part1:
  var i = 0
  for round in input:
    #print input --> map(split(it, ' ').mapIt(conv(it[0]))) -->
    #  map((a, b) = it).take(4).map(score(a, b))
    [b, a] <- split(round, ' ').mapIt(conv(it[0]))
    #print [a, b]
    #print score(a, b)
    #print score(a,b).ord + a.ord + 1
    i.inc score(a,b).ord + a.ord + 1
  echo i

block part2:
  var i = 0
  for round in input:
    let
      split = split(round, ' ').mapIt(it[0])
      b = conv(split[0])
      w = `Yay?`((split[1].ord - 'X'.ord) * 3)
      items = toSeq(RPS.items)
      a = items --> filter(score(it, b) == w)[0]
    i.inc score(a,b).ord + a.ord + 1
  echo i
