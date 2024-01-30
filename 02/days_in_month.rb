require 'date'

COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31].freeze

def days_in_month(month, year = Time.now.year)
  return 29 if month == 2 && DateTime.gregorian_leap?(year)

  COMMON_YEAR_DAYS_IN_MONTH[month]
end

month_days = {}

(1..12).each { |month| month_days[month] = days_in_month(month) }

month_days.each { |month, days| puts month if days == 30 }
