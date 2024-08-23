include inputloader
import tables, sugar

let inputExRaw = """
30373
25512
65332
33549
35390
"""
let inputEx = inputExRaw.splitLines()

let maxCol = input[0].len - 1
let maxRow = inputRaw.strip.count('\n')
print maxCol, maxRow

var cache: Table[(int, int), int]

proc hideScore(coord: (int, int)): int =
  let (col, row) = coord

#[
var i = 0
for col in 0..<maxCol:
  for row in 0..<maxRow:
#for col in 0..0:
#  for row in 0..10:
    let maxes = collect:
      for (val, maxVal, valIsRow) in [(col, maxCol, false), (row, maxRow, true)]:
        for range in [
          0..val,
          val..maxVal
        ]:
          if val == maxVal or val == 0:
            0
          elif valIsRow:
            range --> map($inputEx[val][it]).map(it.parseInt).max()
          else:
            range --> map($inputEx[it][val]).map(it.parseInt).max()
    #print maxes --> max(), parseInt($inputEx[col][row])
    if maxes --> min() < parseInt($inputEx[row][col]):
      print col, row, maxes
      inc i
]#



#[
block part1:
  var i = 0
  for col in 1..maxCol-1:
    for row in 1..maxRow-1:
      let x = inputEx[row][col]
      #print col, row
      var isVisible = false
      # left
      isVisible = isVisible or (1..row-1).allIt(inputEx[row][it] < x)
      # right
      isVisible = isVisible or (row+1..maxRow-1).allIt(inputEx[row][it] < x)
      # top... what
      isVisible = isVisible or (1..col-1).allIt(inputEx[col][it] < x)
      isVisible = isVisible or (col+1..maxCol-1).allIt(inputEx[col][it] < x)
      if isVisible:
        inc i

  print (maxRow) * 2 + (maxCol) * 2
  print i
]#

block part1:
  var i = 0
  for col in 0..maxCol:
    for row in 0..maxRow:
      let x = input[row][col]
      #print col, row
      var isVisible = false
      # left
      isVisible = isVisible or (0..row-1).allIt(input[it][col] < x)
      # right
      isVisible = isVisible or (row+1..maxRow).allIt(input[it][col] < x)
      # top... what
      isVisible = isVisible or (0..col-1).allIt(input[row][it] < x)
      isVisible = isVisible or (col+1..maxCol).allIt(input[row][it] < x)
      if isVisible:
        inc i

  #print (maxRow + maxCol - 1) * 2
  print i


block part2:
  #let input = inputEx
  #let inputRaw = inputExRaw

  let maxCol = input[0].len - 1
  let maxRow = inputRaw.strip.count('\n')

  var i = 0
#  for col in 0..maxCol:
#    for row in 0..maxRow:
  for col in 0..0:
    for row in 0..0:
      let x = input[row][col]

      var ii = 1
      ii *= (if (let f = (0..row-1).mapIt(input[it][col] < x).find(false); f != -1): f + 1 else: row)
      ii *= (if (let f = (row+1..maxRow).mapIt(input[it][col] < x).find(false); f != -1): f + 1 else: maxRow - row - 1)
      ii *= (if (let f = (0..col-1).mapIt(input[row][it] < x).find(false); f != -1): f + 1 else: col)
      ii *= (if (let f = (col+1..maxCol).mapIt(input[row][it] < x).find(false); f != -1): f + 1 else: maxCol - col - 1)
      if ii > i:
        i = ii
  
  print i

