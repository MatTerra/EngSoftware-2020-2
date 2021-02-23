require_relative './string_utils'

class PalindromeChecker

  def self.is_palindrome(word)
    word = StringUtils.remove_non_word_chars_and_spaces(word)

    if PalindromeChecker.is_single_letter_or_less(word)
      return true
    end

    return word == word.reverse
  end

  private

  def self.is_single_letter_or_less(word)
    word.length <= 1
  end
end

class String
  def palindrome?
    PalindromeChecker.is_palindrome(self)
  end
end

module Enumerable
  def palindrome?
    if self.class == Hash
      return false
    end
    self == self.reverse
  end
end