days_in_month = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts 'Число:'
day = gets.chomp.to_i

puts 'Номер месяца:'
month = gets.chomp.to_i

puts 'Год:'
year = gets.chomp.to_i

def leap_year?(year)
  (year % 4).zero? && (year % 100 != 0) || (year % 400).zero?
end

def date_valid?(month, day, days_in_month)
  raise 'Wrong date!!!' unless (1..days_in_month[month]).include?(day)
end

days_in_month[2] = 29 if leap_year?(year)

date_valid?(month, day, days_in_month)

def serial_date_number(day, month, days_in_month)
  if month == 1
    day
  else
    days_in_month[1..month].sum - (days_in_month[month] - day)
  end
end

puts "Порядковый номер даты c начала года: #{serial_date_number(day, month, days_in_month)}"
