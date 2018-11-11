module SolStat::Parser
  class SCSV
    def initialize(content)
      @csv = CSV.new(content.gsub("\"", ""), headers: true, strip: true)
    end

    def each_row
      @csv.each do |row|
        time = parse_time(row["Collection Start Time"])
        period = parse_period(row["Collection Period"])
        value = row["Value"].to_f
        rw = {
          value: value,
          unit: row["Unit"],
          period: period,
          start_time: time
        }
        yield rw
      end
    end

    def parse_headers
      @csv.next # Skip headers
      {
        total: @csv["Value"].to_f,
        unit: @csv["Unit"]
      }
    end

    private def parse_period(period)
      period.split(' ').last.downcase
    end

    private def parse_time(str)
      Time.parse(
          str, 
          "%Y-%m-%d %H:%M:%S", 
          Time::Location.load("Europe/Kiev")
        )
    end
  end
end
