class Octal
  def initialize(num)
    @num_str = num
  end

  def to_decimal
    return 0 if @num_str.match?(/[^0-7]/)
    
    total = 0
    @num_str.chars.map(&:to_i).reverse.each_with_index do |num, idx|
      total += num * 8 ** (idx)
    end
    total
  end
end
