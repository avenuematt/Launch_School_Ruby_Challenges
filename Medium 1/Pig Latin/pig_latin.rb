class PigLatin
  def self.translate(phrase)
    phrase.split(" ").map { |word| single_translate(word) }.join(" ")
  end

  def self.single_translate(word)
    if word.start_with?(/([aeiou]+|[xy][^aeiou]+)/i)
      word + 'ay'
    else
      array = word.partition(/([^aeiou]?qu|[^aeiou]+)/i)
      array.last + array[1] + 'ay'
    end
  end
end
