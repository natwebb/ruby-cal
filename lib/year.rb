$LOAD_PATH << "lib"
require 'calcalc'
require 'month'

class Year
  def initialize(year)
    @year = year
  end

  def to_a
    month_strings = []
    12.times do |i|
      month_strings << create_month_string(i+1)
    end

    month_strings
  end

=begin
  def to_woven_a(rows, cols)
    month_strings = to_a

    final_woven_array = []
    rows.times do |j|
      j *= cols
      break if j > 11
      woven_months = month_strings[j].scan(/.{20}/)
      (cols-1).times do |i|
        woven_months = woven_months.zip(month_strings[j+i+1].scan(/.{20}/))
        woven_months.each do |a|
          a.flatten!
        end
      end
    final_woven_array << woven_months
    end

    final_woven_array
  end
=end

  private

  def create_month_string(month)
    month_headers = ['      January       ', '      February      ', '       March        ', '       April        ', '        May         ', '        June        ', '        July        ', '       August       ', '     September      ', '      October       ', '      November      ', '      December      ']

    formatted_month = month_headers[month-1]
    formatted_month << Month.new(month, @year).to_s
    until formatted_month.length == 160
      formatted_month << ' '
    end

    formatted_month
  end
end
