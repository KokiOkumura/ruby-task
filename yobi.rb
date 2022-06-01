require 'date'
require 'optparse'

# 今日の月と西暦を取得→カレンダー上部に表示
head = Date.today.strftime('%-m月 %Y')
# 今年の西暦
year = Date.today.year

mon = Date.today.mon

# 今月1日の曜日を取得
firstday_wday = Date.new(year, mon, 1).wday
# 今月の末日を取得
lastday_date = Date.new(year, mon, -1).day
# 曜日の配列を作成
week = %w[日 月 火 水 木 金 土]

opt = OptionParser.new
params = {}
opt.on('-m [MON]') { |v| params[:m] = v }
opt.parse!
# 引数で指定した月を変数this_monthに代入する
this_month = params[:m].to_i

if this_month == 0
  puts head.center(20)
  puts week.join(' ')
  print  '   ' * firstday_wday

  # 曜日の数字
  wday = firstday_wday

  (1..lastday_date).each do |day|
    print day.to_s.rjust(2) + ' '
    wday += 1
    print "\n" if wday % 7 == 0
  end
  print "\n" if wday % 7 != 0
elsif 1 <= this_month && this_month <= 12
  mon = params[:m].to_i
  head = Date.new(year, mon).strftime('%-m月 %Y')
  # 今月1日の曜日を取得
  firstday_wday = Date.new(year, mon, 1).wday
  # 今月の末日を取得
  lastday_date = Date.new(year, mon, -1).day
  puts head.center(20)
  puts week.join(' ')
  print  '   ' * firstday_wday

  # 曜日の数字
  wday = firstday_wday

  (1..lastday_date).each do |day|
    print day.to_s.rjust(2) + ' '
    wday += 1
    print "\n" if wday % 7 == 0
  end
  print "\n" if wday % 7 != 0
else
  raise '22 is neither a month number (1..12) nor a name'
end
