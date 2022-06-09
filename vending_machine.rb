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
  attr_accessor :sales

  def initialize(sales = 0)
    @sales = sales
  end

  def in_stock(drink, stock)
    drink.stock += stock
  end

  def drink_info(drink)
    p drink.name
    p drink.price
    p drink.stock
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

drink = Drink.new(name: 'cola', price: 120)
drink2 = Drink.new(name: 'redbull', price: 200)

vending_machine = Vending_Machine.new
vending_machine.in_stock(drink, 5)
vending_machine.in_stock(drink, 3)
vending_machine.to_buy(suica, drink)
vending_machine.drink_info(drink)
vending_machine.sales

# vending_machine.in_stock(drink2, 5)
# vending_machine.drink_info(drink2, 5)
