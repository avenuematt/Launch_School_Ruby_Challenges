# Counts words in a phrase, case insensitive
class Phrase
  def initialize(saying)
    @value = saying
  end

  def word_count
    @value.scan(/\b[\w']+\b/).each_with_object(Hash.new(0)) do |word, res|
      res[word.downcase] += 1
    end
  end
end
