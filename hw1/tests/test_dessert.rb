require 'test/unit'
require_relative '../src/dessert'

class TestDessert < Test::Unit::TestCase
  def test_delicious_should_be_true
    assert_equal(true,
                 Dessert.new("test dessert",0).delicious?)
  end

  def test_is_healthy_under_200_cal
    assert_equal(true,
                 Dessert.new("test dessert", 199).healthy?)
  end

  def test_not_healthy_over_200_cal
    assert_equal(false,
                 Dessert.new("test dessert", 201).healthy?)
  end

  def test_get_name
    dess = Dessert.new("dessert",0)
    assert_equal("dessert",
                 dess.name)
  end

  def test_set_name
    dess = Dessert.new("dessert",0)
    dess.name = "test"
    assert_equal("test",
                 dess.name)
  end

  def test_get_calories
    dess = Dessert.new("dessert",0)
    assert_equal(0,
                 dess.calories)
  end

  def test_set_calories
    dess = Dessert.new("dessert",0)
    dess.calories = 200
    assert_equal(200,
                 dess.calories)
  end

end