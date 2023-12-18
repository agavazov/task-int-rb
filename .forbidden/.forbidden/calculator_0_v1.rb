class Action
  SUM = 1
  SUBTRACT = 2
  MULTIPLY = 3
end

class Calculator
  attr_reader :value

  def initialize(initial_value)
    @value = initial_value
  end

  def get_value
    @value
  end

  def calculate(event, value)
    #  @todo write the body
  end
end
