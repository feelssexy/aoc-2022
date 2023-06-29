include inputloader

func idx(i: int): int =
  i * 4 + 1

proc `$`(t: tuple[amount, fromm, to: int]): string = ## (this isn't really necessary)
  "move $1 from $2 to $3" % [$t.amount, $t.fromm, $t.to]


proc parseLMAOXD: (array[0..8, string], seq[tuple[amount, fromm, to: int]]) =
  let split = inputRaw.split("\n\n") --> map(it.split('\n'))
  assert split.len == 2
  for i in split[1]:
    let i = i.split()
    result[1].add (i[1].parseInt, i[3].parseInt, i[5].parseInt)
  for line in split[0][0..^2]:
    for i in 0..8:
      if line[idx i] != ' ':
        result[0][i].add line[idx i]

proc main(rev: proc (s: string): string) =
  var (crates, instructions) = parseLMAOXD()
  for inst in instructions:
    crates[inst.to - 1].insert(
      rev crates[inst.fromm - 1][0..<inst.amount], 0
    )
    delete(crates[inst.fromm - 1], 0..<inst.amount)
  for crate in crates:
    stdout.write crate[0]
  stdout.writeLine ""

block part1:
  main(proc (s: string): string = cast[string](reversed(s)))

block part2:
  main(proc (s: string): string = s)


