class CalculatorService
  def initialize(equation:)
    @equation = equation
  end

  def result
    tuples.map do |tuple|
      number_with_exponent number: tuple[0], exponent: tuple[1]
    end.reverse.compact.join '+'
  end

  private

  def tuples
    # It would probably be beneficial to create a class for a Tuple where we
    # can more easily do all these operations on it.
    @equation.split('/').reverse.map!.with_index do |number, exponent|
      [number.to_i, exponent]
    end
  end

  def number_with_exponent(number:, exponent:)
    return if exponent.zero?

    new_number, new_exponent = differentiate number: number, exponent: exponent

    new_number.to_s + exponent_output(exponent: new_exponent)
  end

  def differentiate(number:, exponent:)
    [number * exponent, exponent - 1]
  end

  def exponent_output(exponent:)
    if exponent.zero?
      ''
    elsif exponent == 1
      'x'
    else
      "x^#{exponent}"
    end
  end
end
