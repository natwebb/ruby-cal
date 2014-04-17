$LOAD_PATH << "lib"

require 'calcalc'

month = ARGV[0].to_i
year = ARGV[1].to_i
start_day = CalCalc.zeller(1, month, year)

#Changing start_day from Zeller notation (0=Saturday) to standard (0=Sunday)
if start_day == 0
  start_day = 7
end
start_day -= 1
#

months = ['    January', '   February', '     March', '     April', '      May', '     June', '     July', '    August', '   September', '    October', '   November', '   December']
month_s = months[month-1]

day_counts = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
days = day_counts[month-1]

if month == 2 && CalCalc.leap?(year)
  days += 1
end

puts month_s + ' ' + year.to_s
puts 'Su Mo Tu We Th Fr Sa'
start_day.times do
  print '   '
end
count = 1
days.times do
  day_s = count.to_s + ' '
  day_s.prepend(' ') if count < 10
  if (start_day + count)%7 == 0 || count == days
    day_s.chomp!(' ')
    puts day_s
  else
    print day_s
  end
  count += 1
end
