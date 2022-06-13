class Suica
  attr_accessor :balance
  attr_reader :age, :sex

  FEMALE = :female
  MALE = :male

  def initialize(age, sex, balance = 0)
    @age = age
    @sex = sex
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
  attr_reader :sales, :drink_list, :sales_info, :purchase_time

  def initialize(sales = 0)
    @sales = sales
    @drink_list = []
    @sales_info = []
  end

  # drinkと本数を指定して在庫に追加する
  def restock(drink, stock)
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

  def buy(suica, drink)
    if drink.stock > 1 && drink.price <= suica.balance
      drink.stock -= 1
      @sales += drink.price
      suica.balance -= drink.price
      @purchase_time = Time.new
      @sales_info.push(suica.age, suica.sex, @purchase_time, drink.name)
    end
  end
end
