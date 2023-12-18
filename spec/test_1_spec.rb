require_relative '../calculator'

describe Calculator do
  let(:calc) { Calculator.new(5) } # Create a calculator instance with an initial value of 5

  it 'verifies the initial value' do
    expect(calc.get_value).to eq(5) # Assert that the value retrieved from the calculator matches the initial value set
  end

  it 'validates addition operation' do
    calc.calculate(Action::SUM, 1) # Perform a summation operation of adding 1 to the current value
    expect(calc.get_value).to eq(6) # Assert that the value retrieved from the calculator is the result of the addition
  end

  it 'validates subtraction operation' do
    calc.calculate(Action::SUBTRACT, 2) # Perform a subtraction operation of subtracting 2 from the current value
    expect(calc.get_value).to eq(3) # Assert that the value retrieved from the calculator is the result of the subtraction
  end

  it 'validates multiplication operation' do
    calc.calculate(Action::MULTIPLY, 2) # Perform a multiplication operation of multiplying the current value by 2
    expect(calc.get_value).to eq(10) # Assert that the value retrieved from the calculator is the result of the multiplication
  end
end
