require 'date'
require 'optparse'

options = {
  year:  Date.today.year,
  month: Date.today.month,
}
opt = OptionParser.new
opt.on("-m", "--month MONTH", Integer, "this_month") { |m| options[:month] = m }
opt.on("-y", "--year YEAR", Integer, "this_year") { |y| options[:year] = y }
opt.parse(ARGV)

date_start = Date.new(options[:year],options[:month],1)
date_end = Date.new(options[:year],options[:month],-1)

puts "#{date_start.month}月#{date_start.year}年".to_s.center(20)
puts "日 月 火 水 木 金 土"
print "   " * date_start.wday

(date_start..date_end).each do |date|
  print date.day.to_s.rjust(3)
  if date.saturday?
    print "\n"
  end
end