require 'test/unit'
require_relative '../src/count_words'

class TestWordCounter < Test::Unit::TestCase
  def test_split_word()
    assert_equal(["abc", "test"],
                 WordCounter.new().split_words("abc test"))
  end

  def test_split_word_2()
    assert_equal(["abcd", "test2"],
                 WordCounter.new().split_words("abcd,  test2"))
  end

  def test_count_words_single()
    assert_equal({"abc"=>1},
                 WordCounter.new().count_words("abc"))
  end

  def test_count_words_double()
    assert_equal({"abc"=>2},
                 WordCounter.new().count_words("abc abc"))
  end

  def test_count_words_multiple()
    assert_equal({"abc"=>2, "abcd"=>1},
                 WordCounter.new().count_words("abc abcd abc"))
  end
end