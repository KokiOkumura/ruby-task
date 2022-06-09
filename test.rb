class Test
  @test = 0
  attr_accessor :test, :name

  def initialize(name, test)
    @name = name
    @test = test
  end

  def call
    @test += 1
  end
end

test = Test.new('koki', 0)

p test.test
p test.call
p test.test
