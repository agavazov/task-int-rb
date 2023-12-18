class Action
  SUM = 1
  SUBTRACT = 2
  MULTIPLY = 3
  CALLBACK = 4
  UNDO = 5
  REDO = 6
end

class Calculator
  attr_reader :value

  def initialize(initial_value)
    @value = initial_value
    @history_undo = []
    @history_redo = []
  end

  def get_value
    @value
  end

  def calculate(event, value)
    case event
    when Action::SUM, Action::SUBTRACT, Action::MULTIPLY, Action::CALLBACK
      # Save the current state for undo
      @history_undo << @value

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

      # Clear redo history upon new action
      @history_redo.clear
    when Action::UNDO
      if @history_undo.any?
        # Save the current state for redo
        @history_redo << @value
        @value = @history_undo.pop
      end
    when Action::REDO
      if @history_redo.any?
        # Save the current state for undo
        @history_undo << @value
        @value = @history_redo.pop
      end
    else
      raise ArgumentError, 'Invalid event type'
    end
  end
end