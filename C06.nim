include inputloader
import sets

proc main(str: string, Chars: static int) =
  var prevs: array[Chars, char]
  for i in 0..<str.len:
    #prevs[i mod Chars] = c
    if i >= Chars:
      if str[i-Chars..<i].toHashSet.len == Chars:
        print i, str[i-Chars..<i] #, str[i-Chars..<i].toHashSet
        break

block part1:
  #let inputRaw = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
  main(inputRaw, 4)

block part2:
  main(inputRaw, 14)

