class Action
  SUM = 1
  SUBTRACT = 2
  MULTIPLY = 3
  CALLBACK = 4
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
    case event
    when Action::SUM, Action::SUBTRACT, Action::MULTIPLY, Action::CALLBACK
      case event
      when Action::SUM
        @value += value
      when Action::SUBTRACT
        @value -= value
      when Action::MULTIPLY
        @value *= value
      when Action::CALLBACK
        raise ArgumentError, 'Invalid callback' unless value.respond_to?(:call)

        @value = value.call(@value)
      else
        raise ArgumentError, 'Invalid action'
      end
    else
      raise ArgumentError, 'Invalid event type'
    end
  end
end