require_relative '../calculator'

describe Calculator do
  let(:calc) { Calculator.new(3) } # Create a calculator instance with an initial value of 3

  it 'validates error handling for an invalid action' do
    expect { calc.calculate("INVALID_ACTION", 2) }.to raise_error(ArgumentError) # Verify that attempting an invalid action raises a ValueError
  end

  it 'validates callback functionality' do
    square_callback = ->(value) { value ** 2 } # Define the square callback function
    calc.calculate(Action::CALLBACK, square_callback) # Perform a callback action using the square_callback function
    expect(calc.get_value).to eq(9) # Assert that the value retrieved from the calculator reflects the result of the callback operation
  end
end
