require "./src/SLib-parser"

s = SLib::CSVParser.new("./data.csv")
s.each_row