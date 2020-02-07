module Roman
  def to_roman
    num_arr = self.to_s.chars.map(&:to_i)
    curr_len = num_arr.size - 1
    num_arr.each_with_object("") do |num, res|
      res << single_char(num, curr_len)
      curr_len -= 1
    end
  end

  private

  TENS = ['I', 'X', 'C', 'M']
  FIVES = ['V', 'L', 'D']

  def single_char(num, tens_f)
    if [4, 9].include?(num)
      trailing_char = (num == 4) ? FIVES[tens_f] : TENS[tens_f + 1]
      TENS[tens_f] + trailing_char
    else
      leading_char = (5..8).include?(num) ? FIVES[tens_f] : ""
      leading_char + (TENS[tens_f] * (num % 5))
    end
  end
end

Integer.include Roman
