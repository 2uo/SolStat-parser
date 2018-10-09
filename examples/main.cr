require "./src/SolStat-parser"

s = SolStat::Parser::SCSV.new("./data.csv")
pp s.parse_headers
s.each_row do |row|
end