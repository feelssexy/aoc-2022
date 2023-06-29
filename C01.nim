include inputloader

block puzzleOne:
  echo inputRaw.split("\n\n") --> map(it.split() --> map(parseInt).sum()).max()

block puzzleTwo:
  echo ( inputRaw.split("\n\n") --> map(it.split() --> map(parseInt) --> sum()) ).sorted.reversed --> take(3) --> sum()

