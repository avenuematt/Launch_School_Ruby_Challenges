class Anagram
  def initialize(word)
    @key = word.downcase
  end

  def match(array)
    array.select do |arg|
      arg.downcase.chars.sort == @key.chars.sort && arg.downcase != @key
    end
  end
end
