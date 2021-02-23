require 'test/unit'
require_relative '../src/currencies'

class TestCurrencies < Test::Unit::TestCase
  def test_dollar_in_rupees
    assert_equal(10/0.019, 10.dollars.in(:rupees))
  end

  def test_euro_in_dollars
    assert_equal(6.46,5.euros.in(:dollars))
  end

  def test_rupee_in_yen
    assert_equal(1.3/0.019, 100.yens.in(:rupee))
  end
end