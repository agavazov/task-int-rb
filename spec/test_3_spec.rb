# spec/calculator_test_3_spec.rb

require_relative '../calculator' # Assuming your Calculator class is in a file named 'calculator.rb'

describe Calculator do
  it 'validates undo functionality for addition operations' do
    calc = Calculator.new(5)
    calc.calculate(Action::SUM, 3)
    calc.calculate(Action::SUM, 4)

    calc.calculate(Action::UNDO, nil)
    expect(calc.get_value).to eq(8)
  end

  it 'validates undo and redo functionality for addition operations' do
    calc = Calculator.new(5)
    calc.calculate(Action::SUM, 3)
    calc.calculate(Action::SUM, 4)

    calc.calculate(Action::UNDO, nil)
    calc.calculate(Action::REDO, nil)
    expect(calc.get_value).to eq(12)
  end

  it 'validates undo functionality for subtraction operations' do
    calc = Calculator.new(10)
    calc.calculate(Action::SUBTRACT, 4)
    calc.calculate(Action::SUBTRACT, 3)

    calc.calculate(Action::UNDO, nil)
    expect(calc.get_value).to eq(6)
  end

  it 'validates undo and redo functionality for subtraction operations' do
    calc = Calculator.new(12)
    calc.calculate(Action::SUBTRACT, 1)
    calc.calculate(Action::SUBTRACT, 2)

    calc.calculate(Action::UNDO, nil)
    calc.calculate(Action::REDO, nil)
    expect(calc.get_value).to eq(9)
  end

  it 'validates undo functionality for multiplication operations' do
    calc = Calculator.new(10)
    calc.calculate(Action::MULTIPLY, 2)

    calc.calculate(Action::UNDO, nil)
    expect(calc.get_value).to eq(10)
  end

  it 'validates undo and redo functionality for multiplication operations' do
    calc = Calculator.new(10)
    calc.calculate(Action::MULTIPLY, 2)
    calc.calculate(Action::MULTIPLY, 3)

    calc.calculate(Action::UNDO, nil)
    calc.calculate(Action::REDO, nil)
    expect(calc.get_value).to eq(60)
  end

  it 'validates undo functionality for callback operations' do
    calc = Calculator.new(4)
    calc.calculate(Action::CALLBACK, ->(x) { x ** 2 })

    calc.calculate(Action::UNDO, nil)
    expect(calc.get_value).to eq(4)
  end

  it 'validates undo and redo functionality for callback operations' do
    calc = Calculator.new(4)
    calc.calculate(Action::CALLBACK, ->(x) { x ** 2 })

    calc.calculate(Action::UNDO, nil)
    calc.calculate(Action::REDO, nil)
    expect(calc.get_value).to eq(16)
  end
end
