require 'test/unit'
require_relative '../src/accessor_with_history'

class TestAccessorWithHistory < Test::Unit::TestCase
  def test_should_have_attr_setter_and_getter
    tester = Foo.new
    tester.bar = 3
    assert_equal(3, tester.bar)
  end

  def test_should_have_empty_history_to_start
    tester = Foo.new
    assert_equal([], tester.bar_history)
  end

  def test_should_have_full_history
    tester = Foo.new
    tester.bar=3
    tester.bar=1
    tester.bar="ok"
    assert_equal([nil,3,1,"ok"], tester.bar_history)
  end

  def test_new_instance_shouldnt_have_full_history
    tester = Foo.new
    tester.bar=3
    tester.bar=1
    tester.bar="ok"
    tester = Foo.new
    tester.bar=2
    assert_equal([nil,2], tester.bar_history)
  end
end