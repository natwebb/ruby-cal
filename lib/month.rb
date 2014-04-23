$LOAD_PATH << "lib"
require 'calcalc'

class Month
  def initialize(m, y)
    @month = m
    @year = y.to_i
    @start_day = start_day
    @days = day_count
  end

  def to_s
    output = ''
    output << 'Su Mo Tu We Th Fr Sa'
    @start_day.times do
      output << '   '
    end
    count = 1
    @days.times do
      day_s = count.to_s + ' '
      day_s.prepend(' ') if count < 10
      if (@start_day + count)%7 == 0 || count == @days
        day_s.chomp!(' ')
      end
      output << day_s
      count += 1
    end

    output
  end

  def to_a
    month = to_month_s

    split_month = month.scan(/.{20}/)

    final_line_count = month.length%20
    final_line = month.slice(final_line_count*-1, final_line_count)
    split_month << final_line unless final_line == ''

    split_month
  end

  private

  def start_day
    start_day = CalCalc.zeller(1, @month, @year)

    #Changes start_day from Zeller notation (0=Saturday) to standard (0=Sunday)
    if start_day == 0
      start_day = 7
    end
    start_day -= 1

    start_day
  end

  def day_count
    day_counts = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    day_count = day_counts[@month-1]

    if @month == 2 && CalCalc.leap?(@year)
      day_count += 1
    end

    day_count
  end

  def to_month_s
    month_headers = ['    January', '   February', '     March', '     April', '      May', '     June', '     July', '    August', '   September', '    October', '   November', '   December']
    month_title = month_headers[@month-1]

    output = month_title + ' ' + @year.to_s
    until output.length == 20
      output << ' '
    end
    output << to_s

    output
  end
end
