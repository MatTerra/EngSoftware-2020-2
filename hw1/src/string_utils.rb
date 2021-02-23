class StringUtils
  def self.remove_non_word_chars_and_spaces(word)
    word.downcase.gsub(/[^\w]+/, '')
  end

  def remove_non_word_chars(word)
    word.downcase.gsub(/[^\w\s]+/, '')
  end
end
