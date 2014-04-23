$LOAD_PATH << "lib"
require 'calcalc'

class Month
  def initialize(m, y)
    #--------------------------------------------Checks to see if the user input the month as a word or three-letter abbreviation rather than a number, and converts to a number if so
    long_months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    short_months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    if long_months.include?(m.capitalize)
      @month = (long_months.index(m.capitalize)+1)
    elsif short_months.include?(m.capitalize)
      @month = (short_months.index(m.capitalize)+1)
    elsif m.to_i != 0
      @month = m.to_i
    else
      abort ("cal: please enter either a month number, the full name of a month, or the three-letter short name of a month")
    end

    #--------------------------------------------Converts the year to an integer and then gets the start day of the month
    @year = y.to_i
    @start_day = CalCalc.zeller(1, @month, @year)
    #Changes start_day from Zeller notation (0=Saturday) to standard (0=Sunday)
    if @start_day == 0
      @start_day = 7
    end
    @start_day -= 1

    #--------------------------------------------Gets the day count (with correction for leap years)
    day_counts = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    @days = day_counts[@month-1]

    if @month == 2 && CalCalc.leap?(@year)
      @days += 1
    end
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

  def to_month_s
    month_headers = ['    January', '   February', '     March', '     April', '      May', '     June', '     July', '    August', '   September', '    October', '   November', '   December']
    @month_s = month_headers[@month-1]

    output = @month_s + ' ' + @year.to_s
    until output.length == 20
      output << ' '
    end
    output << self.to_s

    output
  end

  def to_year_s
    month_headers = ['      January       ', '      February      ', '       March        ', '       April        ', '        May         ', '        June        ', '        July        ', '       August       ', '     September      ', '      October       ', '      November      ', '      December      ']
    @month_s = month_headers[@month-1]

    output = @month_s
    output << self.to_s
    until output.length == 160
      output << ' '
    end

    output
  end

end
