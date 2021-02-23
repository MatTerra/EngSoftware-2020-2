require_relative './rollcall_parser'

parser = RollcallParser.new("tests/engsoft.txt")
print(parser.parse())
