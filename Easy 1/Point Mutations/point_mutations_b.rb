# Determines the hamming distance of DNA strand from self
class DNA
  def initialize(string)
    @first = string
  end

  def hamming_distance(second)
    short = @first.slice(0, [second.size, @first.size].min)
    short.chars.zip(second.chars).count { |el| el.first != el.last }
  end
end
