class Vending_Machine
  attr_reader :sales, :drink_list, :sales_info, :purchased_at

  def initialize(sales = 0)
    @sales = sales
    @drink_list = []
    @sales_info = []
  end

  # drinkと本数を指定して在庫に追加する
  def add_drink(drink, stock)
    stock.times do
      @drink_list.push(drink)
    end
  end

  # 商品の在庫を表示させる
  def stock_info
    @drink_list.uniq.each do |s|
      puts "商品名：#{s.name}\t値段:#{s.price}\t在庫:#{@drink_list.count(s)}"
    end
  end

  def buy(suica, drink)
    if @drink_list.include?(drink) && drink.price <= suica.balance
      @drink_list.delete_at(@drink_list.index(drink))
      @sales += drink.price
      suica.balance -= drink.price
      @purchased_at = Time.new
      @sales_info.push(suica.age, suica.sex, @purchased_at, drink.name)
    end
  end
end
