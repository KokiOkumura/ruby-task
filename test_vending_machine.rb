require 'minitest/autorun'
require './vending_machine'

class Vending_MachineTest < Minitest::Test
  # ステップ0 Suicaのチャージ
  def test_suica_chage
    suica = Suica.new(27, Suica::MALE)
    assert_equal 1000, suica.charge_amount(1000)
    assert_equal 1500, suica.charge_amount(500)
    assert_equal 1500, suica.balance
  end

  # ステップ1 ジュースの管理
  def test_drink_to_magane
    cola = Drink.new(name: 'cola', price: 120)
    vending_machine = Vending_Machine.new
    vending_machine.restock(cola, 5)
    assert_equal cola, vending_machine.drink_list[0]
  end

  # ステップ2 購入
  def test_buy
    suica = Suica.new(27, Suica::MALE)
    suica.charge_amount(1000)
    cola = Drink.new(name: 'cola', price: 120)
    vending_machine = Vending_Machine.new
    vending_machine.restock(cola, 5)
    assert vending_machine.buy(suica, cola)
    vending_machine.buy(suica, cola)
    assert_equal 3, cola.stock
    assert_equal 240, vending_machine.sales
    assert_equal 760, suica.balance
    suica = Suica.new(27, Suica::MALE, balance = 0)
    refute vending_machine.buy(suica, cola)
    assert_equal 240, vending_machine.sales
  end

  # ステップ3 機能拡張
  def test_extensions
    suica = Suica.new(27, Suica::MALE)
    suica.charge_amount(1000)
    cola = Drink.new(name: 'cola', price: 120)
    vending_machine = Vending_Machine.new
    vending_machine.restock(cola, 5)
    redbull = Drink.new(name: 'redbull', price: 200)
    vending_machine.restock(redbull, 5)
    water = Drink.new(name: 'water', price: 100)
    vending_machine.restock(water, 5)
    assert_equal [cola, redbull, water], vending_machine.stock_info
    assert vending_machine.buy(suica, redbull)
    assert vending_machine.buy(suica, water)
  end

  # ステップ4 利用者属性の管理
  def test_user_info
    suica_male = Suica.new(27, Suica::MALE)
    suica_female = Suica.new(25, Suica::FEMALE)
    assert_equal 27, suica_male.age
    assert_equal :female, suica_female.sex
  end

  # ステップ5 売り上げ管理
  def test_sales_management
    suica = Suica.new(27, Suica::MALE)
    suica.charge_amount(1000)
    cola = Drink.new(name: 'cola', price: 120)
    vending_machine = Vending_Machine.new
    vending_machine.restock(cola, 5)
    vending_machine.buy(suica, cola)
    purchase_time = Time.new
    assert_equal [suica.age, suica.sex, vending_machine.purchase_time, 'cola'], vending_machine.sales_info
  end
end
