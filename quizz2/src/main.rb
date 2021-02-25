require_relative './rollcall_parser'

matricula=1
nome=2
parser = RollcallParser.new("tests/engsoft.txt")
print(parser.parse())
print("List order by matricula\n")
print(parser.parse(n=0, order_by=matricula)) # Para ver a lista ordenada por matricula
print("List order by nome\n")
print(parser.parse(n=0, order_by=nome)) # Para ver a lista ordenada por nome
