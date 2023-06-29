include inputloader
import sets

#iterator parse(): array[2, HSlice[int, int]] =
iterator parse(): auto =
  for pair in input:
    let pair = pair
    yield pair.split(',') --> map((a, b) = it.split('-') --> map(parseInt)) --> map(a..b)

block part1:
  var i = 0
  for pair in parse():
    let pair = pair.sortedByIt(it.len)
    # check boundaries
    if (pair[0].a >= pair[1].a and
        pair[0].b <= pair[1].b):
      inc i

  echo i

block part2:
  var i = 0
  for pair in parse():
    [elf1, elf2] <- pair
    var begin, ending = -1
    for j in elf1:
      #[ # oh i thought you needed to count the overlapping assignments
      if j in elf2:
        if begin == -1:
          begin = j
      else:
        if begin != -1 and ending == -1:
          ending = j
    if begin != -1 and ending != -1:
      ]#
      if j in elf2:
        inc i
        break
  
  echo i

