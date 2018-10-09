module SolStat::Parser
  class CSVParser
    def initialize(filename)
      f = File.read(filename).gsub("\"", "")
      @csv = CSV.new(f, headers: true, strip: true)
    end

    def each_row
      @csv.next
      @csv.each do |row|
        pp Time.parse(
          row["Collection Start Time"], 
          "%Y-%m-%d %H:%M:%S", 
          Time::Location.load("Europe/Kiev")
        )
      end
    end
  end
end