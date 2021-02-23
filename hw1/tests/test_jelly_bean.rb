require 'test/unit'
require_relative '../src/jelly_bean'

class TestJellyBean < Test::Unit::TestCase
  def test_delicious_should_be_true
    bean = JellyBean.new("bean",0, "flavor")
    assert_equal(true,
                 bean.delicious?)
  end

  def test_delicious_black_licorine_false
    bean = JellyBean.new("bean",0, "black licorine")
    assert_equal(false,
                 bean.delicious?)
  end

  def test_is_healthy_under_200_cal
    bean = JellyBean.new("bean",199, "flavor")
    assert_equal(true,
                 bean.healthy?)
  end

  def test_not_healthy_over_200_cal
    bean = JellyBean.new("bean",201, "flavor")
    assert_equal(false,
                 bean.healthy?)
  end

  def test_get_flavor
    dess = JellyBean.new("dessert",0, "flav")
    assert_equal("flav",
                 dess.flavor)
  end

  def test_set_flavor
    dess = JellyBean.new("dessert",0, "flav")
    dess.flavor = "black licorine"
    assert_equal("black licorine",
                 dess.flavor)
  end
end