class AnagramChecker
  def self.combine_anagrams(words)
    anagram_groups = {}

    words.each do |word|
      add_to_anagram_group(anagram_groups, word)
    end

    anagram_groups.values
  end

  private

  def self.add_to_anagram_group(anagram_groups, word)
    anagram_symbol = get_word_anagram_symbol(word)

    unless anagram_groups.has_key?(anagram_symbol)
      anagram_groups[anagram_symbol] = []
    end

    anagram_groups[anagram_symbol].append(word)
  end

  def self.get_word_anagram_symbol(word)
    word.downcase.chars.sort.join.to_sym
  end
end
