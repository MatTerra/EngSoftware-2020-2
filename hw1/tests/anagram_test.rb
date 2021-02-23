require 'test/unit'
require_relative '../src/anagrams'

class TestAnagrams < Test::Unit::TestCase
  def test_single_letter
    assert_equal([["a"]],
                 AnagramChecker.combine_anagrams(["a"]))
  end

  def test_two_equal_anagrams
    assert_equal([["a", "a"]],
                 AnagramChecker.combine_anagrams(["a", "a"]))
  end

  def test_two_different_anagrams
    assert_equal([["ab", "ba"]],
                 AnagramChecker.combine_anagrams(["ab", "ba"]))
  end

  def test_example
    ungrouped_words = ["cars", "for", "potatoes", 'racs',
                       'four','scar', 'creams', 'scream']
    resulting_groups = [["cars", "racs", "scar"],
                        ["four"],
                        ["for"],
                        ["potatoes"],
                        ["creams", "scream"]]
    assert_equal(
      resulting_groups.sort,
      AnagramChecker.combine_anagrams(ungrouped_words).sort)
  end


end