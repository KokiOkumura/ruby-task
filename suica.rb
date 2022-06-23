class Suica
  attr_accessor :balance
  attr_reader :age, :sex

  def initialize(age, sex, balance = 0)
    @age = age
    @sex = sex
    @balance = balance
  end

  def charge_amount(money)
    @balance += money if money >= 100
  end
end

