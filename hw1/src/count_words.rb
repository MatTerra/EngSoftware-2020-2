require_relative './string_utils'

class WordCounter
  def initialize
    @string_utils = StringUtils.new()
  end

  def split_words(phrase)
    phrase = @string_utils.remove_non_word_chars(phrase)
    return phrase.split(/[\s]+/)
  end

  def count_words(phrase)
    words = self.split_words(phrase)

    word_count = {}

    words.each do |word|
      increase_word_count(word, word_count)
    end

    return word_count
  end

  private

  def increase_word_count(word, word_count)
    if word_count.has_key?(word)
      word_count[word] += 1
    else
      word_count[word] = 1
    end
  end

end