require 'date'
require 'optparse'

options = {}
opt = OptionParser.new
opt.on("-m", "--month MONTH", Integer, "this_month") { |m| options[:month] = m }
opt.on("-y", "--year YEAR", Integer, "this_year") { |y| options[:year] = y }
opt.parse(ARGV)

today = Date.today

if options[:year] && options[:month]
  data_start = Date.new(options[:year],options[:month],1)
  data_end = Date.new(options[:year],options[:month],-1)
elsif options[:month]
  data_start = Date.new(today.year,options[:month],1) 
  data_end = Date.new(today.year,options[:month],-1)
elsif options[:year]
  data_start = Date.new(options[:year],today.month,1)
  data_end = Date.new(options[:year],today.month,-1)
else
  data_start = Date.new(today.year,today.month,1)
  data_end =  Date.new(today.year,today.month,-1)
end

puts "#{data_start.month}月#{data_start.year}年".to_s.center(20)
puts "日 月 火 水 木 金 土"
print "   " * data_start.wday

loop do
  if data_start.saturday?
    puts data_start.day.to_s.rjust(3)
  else
    print data_start.day.to_s.rjust(3)
  end
  data_start += 1
  break if data_start > data_end
end
