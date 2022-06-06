require 'date'
require 'optparse'

# 曜日の配列を作成
WEEK = %w[日 月 火 水 木 金 土]

def display_calendar(month)
  # 今年の西暦
  this_year = Date.today.year
  # カレンダー上部に表示
  head = Date.new(this_year, month).strftime('%-m月 %Y')
  # 1日の曜日を取得
  firstday_wday = Date.new(this_year, month, 1).wday
  # 月末日取得
  lastday_date = Date.new(this_year, month, -1).day
  # 曜日の数字
  wday = firstday_wday

  puts head.center(20)
  puts WEEK.join(' ')
  print '   ' * firstday_wday

  (1..lastday_date).each do |day|
    print day.to_s.rjust(2) + ' '
    wday += 1
    print "\n" if wday % 7 == 0
  end
  print "\n" if wday % 7 != 0
end

opt = OptionParser.new
params = {}
opt.on('-m [MON]') { |v| params[:m] = v }
opt.parse!
# 引数で指定した月を変数this_monthに代入する
month = params[:m].to_i

if month == 0
  month = Date.today.mon
  display_calendar(month)

elsif month.between?(1, 12)
  month = params[:m].to_i
  display_calendar(month)
else
  raise "#{month} is neither a month number (1..12) nor a name"
end
