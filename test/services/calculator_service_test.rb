class CalculatorServiceTest < ActiveSupport::TestCase
  test '#result' do
    service = CalculatorService.new equation: '3/2/1'
    assert_equal '6x+2', service.result
  end
end
