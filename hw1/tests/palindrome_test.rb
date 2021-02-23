require 'test/unit'
require_relative '../src/palindrome'

class TestPalindrome < Test::Unit::TestCase
  def test_single_letter
    assert_equal(true,
                 PalindromeChecker.is_palindrome("a"))
  end

  def test_two_equal_letters
    assert_equal(true,
                 PalindromeChecker.is_palindrome("aa"))
  end

  def test_two_different_letters
    assert_equal(false,
                 PalindromeChecker.is_palindrome("ab"))
  end

  def test_three_letters_palindrome
    assert_equal(true,
                 PalindromeChecker.is_palindrome("aba"))
  end

  def test_three_letters_not_palindrome
    assert_equal(false,
                 PalindromeChecker.is_palindrome("abc"))
  end

  def test_four_letters_palindrome
    assert_equal(true,
                 PalindromeChecker.is_palindrome("abba"))
  end

  def test_four_letters_not_palindrome
    assert_equal(false,
                 PalindromeChecker.is_palindrome("abca"))
  end

  def test_example
    assert_equal(true,
                 PalindromeChecker.is_palindrome(
                   "socorrammesubinoonibusemmarrocos"))
  end

  def test_example_with_case
    assert_equal(true,
                 PalindromeChecker.is_palindrome(
                   "SocorrammesubinoonibusemMarrocos"))
  end

  def test_example_with_special_char
    assert_equal(true,
                 PalindromeChecker.is_palindrome(
                   "Socorram-me subi no onibus em Marrocos!"))
  end

  def test_palindrome_as_method
    assert_equal(true,
                 "Socorram-me subi no onibus em Marrocos!".palindrome?)
  end

  def test_palindrome_as_method_for_enumerables
    assert_equal(true,
                 [1,2,3,2,1].palindrome?)
  end

  def test_palindrome_as_method_for_enumerables_false
    assert_equal(false,
                 [1,2,3,1].palindrome?)
  end

  def test_palindrome_as_method_for_hash
    assert_equal(true,
                 { "a"=>1 }.palindrome? || true)
  end
end