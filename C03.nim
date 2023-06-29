include inputloader
import sets

func splitInp(inp: string): array[2, string] =
  let half: int = inp.len div 2
  [inp[0..<half], inp[half..^1]]

proc priority(c: char): int =
  let offset =
    if c == c.toLowerAscii:
      1 - 'a'.ord
    else:
      27 - 'A'.ord
  #print offset, c, c.ord + offset
  c.ord + offset


block part1:
  var i = 0
  for line in input:
    [a, b] <- splitInp(line)
    #i.inc toSeq(intersection(toHashSet(a), toHashSet(b)))[0].priority
    i.inc toSeq(toHashSet(a) * toHashSet(b))[0].priority

  echo i

block part2:
  var i = 0
  #let t = input --> map((idx div 3, it))
  i = 0..(input.high div 3) --> map(
    (a, b, c) = input[idx*3..<(idx+1)*3]
  ) --> map(
    #toSeq(intersection(intersection(toHashSet(a), toHashSet(b)), toHashSet(c)))[0]
    toSeq(toHashSet(a) * toHashSet(b) * toHashSet(c))[0]
  ) --> map(priority) --> sum()
  
  echo i

