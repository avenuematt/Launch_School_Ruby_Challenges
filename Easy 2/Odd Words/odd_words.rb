# character set = letters, a space, & a point
# words consist of 1-20 letters
# input text is 1+ words separated by 1+ spaces and terminated by 0+ spaces with point
# input from first index to last is read
# output does two things
  # first, it returns the words in the order presented in input
    # words are spearated by single space with termination at single point
  # second, odd words (by 0 index) are reversed. even words are presented as is
# bonus, characters are read and printed one at a time

class OddWords
  def initialize(phrase)
    valid?(phrase)
    @input = phrase
  end

  def separate
    @input.split(/[ ]+/)
  end

  def output
    array = separate
    res = []
    array.each_with_index do |value, index|
      if index.odd?
        res << value.reverse
      else
        res << value
      end
    end
    if res[-1] == "."
      res = res[0...-1].join(" ") + res[-1]
    else
      res = res.join(" ")
    end
    res
  end

  def valid?(input)
    unless input.match? /\A[a-z][a-z ]+\.\z/i
      raise ArgumentError
    end
  end
end
