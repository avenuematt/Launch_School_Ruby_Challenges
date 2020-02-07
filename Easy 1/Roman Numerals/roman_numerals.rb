module RomanNumerals
  def to_roman
    num_str = self.to_s
    num_len = num_str.size
    array = []

    num_str.chars.each do |char|
      array << char.to_i * 10 ** (num_len - 1)
      num_len -= 1
    end

    array.map { |el| numeral_conversion(el) }.join
  end

  private
  
  SINGLES = ['I', 'V', 'X']
  TENS = ['X', 'L', 'C']
  HUNDREDS = ['C', 'D', 'M']
  THOUSANDS = ['M']
  DIRECTORIES = [SINGLES, TENS, HUNDREDS, THOUSANDS]

  def numeral_conversion(num)
    steps = 0
    while num >= 10
      steps += 1
      num = num / 10
    end
    directory = DIRECTORIES[steps]

    case num
    when (1..3)     then directory.first * num
    when 4          then directory.first + directory[1]
    when 5          then directory[1]
    when (6..8)     then directory[1] + directory.first * (num - 5)
    when 9          then directory.first + directory.last
    end
  end
end

Integer.include RomanNumerals
