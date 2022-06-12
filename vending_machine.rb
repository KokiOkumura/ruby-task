class Suica
  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def charge_amount(money)
    @balance += money if money >= 100
  end
end

class Drink
  attr_accessor :name, :price, :stock

  def initialize(name:, price:)
    @name = name
    @price = price
    @stock = 0
  end
end

class Vending_Machine
  attr_accessor :sales, :drink_list

  def initialize(sales = 0)
    @sales = sales
    @drink_list = []
  end

  # drinkと本数を指定して在庫に追加する
  def in_stock(drink, stock)
    drink.stock += stock
    @drink_list.push(drink).uniq!
  end

  # 商品の在庫を表示させる
  def stock_info
    @drink_list.each do |item|
      puts item.name
      puts item.price
      puts item.stock
    end
  end

  def to_buy(suica, drink)
    if drink.stock > 1 && drink.price <= suica.balance
      drink.stock -= 1
      @sales += drink.price
      suica.balance -= drink.price
    end
  end
end

suica = Suica.new(500)
suica.charge_amount(1000)
suica.charge_amount(1000)

cola = Drink.new(name: 'cola', price: 120)

vending_machine = Vending_Machine.new
vending_machine.in_stock(cola, 10)
vending_machine.in_stock(cola, 3)

vending_machine.to_buy(suica, cola)

redbull = Drink.new(name: 'redbull', price: 200)
vending_machine.in_stock(redbull, 5)
water = Drink.new(name: 'water', price: 100)
vending_machine.in_stock(water, 5)

vending_machine.to_buy(suica, redbull)

vending_machine.stock_info
