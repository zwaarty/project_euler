# You are given the following information, but you may prefer to do some research for yourself.

# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

def leap_year? year
  year % 4 == 0 && (year % 400 == 0 || year % 100 != 0)
end

def next_month month
  month % 12 + 1
end

def days_of(year, month)
  case month
  when 1, 3, 5, 7, 8, 10, 12
    31
  when 4, 6, 9, 11
    30
  else
    if leap_year? year
      29
    else
      28
    end
  end
end

# week_day : 1:Sun 2:Mon,...,6:Fri, 0:Sat
def next_month_first_day(year, month, week_day)
  days = days_of year, month
  w = (week_day + (days % 7)) % 7
  m = next_month month
  y = year
  y += 1 if m == 1
  [y, m, w]
end

start = [1900, 1, 2]
num_sunday = 0
11.times.with_object(start) do
  start = next_month_first_day(*start)
end

(12 * 100 - 1).times.with_object(start) do
  start = next_month_first_day(*start)
  num_sunday += 1 if start[2] == 1
end
p num_sunday
