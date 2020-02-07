# Gives decimal equivalent of a hex number
class Hex
  HEX_NUMS = ('0'..'9').to_a + ('a'..'f').to_a
  attr_reader :value

  def initialize(str_num)
    @value = str_num.downcase
  end

  def to_decimal
    return 0 if value.match?(/[^a-f\d]+/)
    arr = value.chars.reverse.map { |char| HEX_NUMS.index(char) }
    arr.each_with_index.map { |num, idx| num * 16**idx }.reduce(:+)
  end
end

puts Hex.new('162FC').to_decimal
puts Hex.new('8CBCCC').to_decimal
puts Hex.new('carrot').to_decimal
