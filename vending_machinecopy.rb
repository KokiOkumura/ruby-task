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

  def initialize(name: 'cola', price: 120, stock: 5)
    @name = name
    @price = price
    @stock = stock
  end
end

class Vending_Machine
  attr_accessor :sales

  def initialize(sales = 0)
    @sales = sales
  end

  def in_stock(drink, stock)
    drink.stock += stock
    @drink_list = { name: drink.name, price: drink.price, stock: drink.stock }
  end

  def drink_info
    p @drink_list
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

drink = Drink.new

vending_machine = Vending_Machine.new
vending_machine.in_stock(drink)
# vending_machine.in_stock(cola, 5)
# vending_machine.in_stock(cola, 3)

# vending_machine.to_buy(suica, cola)

# redbull = Drink.new(name: 'redbull', price: 200)
# vending_machine.in_stock(redbull, 5)
# water = Drink.new(name: 'water', price: 100)
# vending_machine.in_stock(water, 5)

# vending_machine.to_buy(suica, redbull)

# vending_machine.drink_info
