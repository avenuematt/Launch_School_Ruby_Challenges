# Converts trinary to decimal
class Trinary
  def initialize(str_num)
    @input = str_num
  end

  def to_decimal
    return 0 unless valid?
    array = @input.reverse.chars.map(&:to_i)
    array.each_with_index.map { |val, idx| val * 3**idx }.sum
  end

  private

  def valid?
    @input.match?(/\A[0-2]+\z/)
  end
end
