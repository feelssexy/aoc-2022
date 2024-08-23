import os, strutils, httpclient

type il_CookieTxtEntry {.pure.} = enum
  il_Host, il_Subdomains, il_Path, il_IsSecure, il_Expiry, il_Name, il_Value

proc il_cookies: HttpHeaders =
  ## reads netscape cookie into HttpHeaders object
  result = newHttpHeaders()
  var str: string
  let koks = readFile("inputs" / "cookies.txt")
  for line in koks.splitLines:
    if line.len != 0 and not line.startsWith("# "):
      let split: seq[string] = line.split('\t')
      if split[il_Host.ord].toLower.contains("adventofcode.com"):
        str.add "$1=$2; " % [split[il_Name.ord], split[il_Value.ord]]
  result["cookie"] = str

proc il_main: string =
  let appName = getAppFilename().extractFilename

  # assumes the binary (as created by `nim r`) contains 'C' character followed by 2 digits
  let idx = appName.find('C')
  let challengeNumber = appName[idx+1..idx+2].parseInt
  let inputFilename = "inputs" / "C" & align($challengeNumber, 2, '0') & ".input"

  if not fileExists(inputFilename):
    var client = newHttpClient(headers = il_cookies())
    let res = client.get("https://adventofcode.com/2022/day/$1/input" % $challengeNumber)
    if not res.code.is2xx():
      raise newException(AssertionDefect, res.body) # wrong Exception but i dont bother
    let input = res.body
    writeFile(inputFilename, input)
  #if challengeNumber != 5:
  #  open(inputFilename).readAll.strip
  #else:
  if true:
    return open(inputFilename).readAll.strip(false, true)

when isMainModule:
  import sequtils, zero_functional, algorithm, unpack, print
  {.hint[XDeclaredButNotUsed]: off.}
  {.hint[DuplicateModuleImport]: off.}
  {.warning[UnusedImport]: off.}
  let inputRaw = il_main()
  let input = inputRaw.splitLines
else:
  {.error: "inputloader works only by including it".}

