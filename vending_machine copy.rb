class Suica
  attr_accessor :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def charge_amount(money)
    if money >= 100
      @balance += money
    end
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

  # def self.drink_info(drinks)
  #   drinks.map do |drink|
  #     drink.name
  #   end
  # end

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
p suica.charge_amount(1000)

drink = Drink.new(name: 'cola', price: 120)
drink2 = Drink.new(name: 'redbull', price: 200)

vending_machine = Vending_Machine.new
vending_machine.in_stock(drink, 5)
vending_machine.in_stock(drink, 3)
vending_machine.to_buy(suica, drink)
# Vending_machine.drink_info(drinks)
# vending_machine.sales


