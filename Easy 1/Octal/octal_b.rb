class Octal
  BASE = 8
  VALID_REG = /\A[0-7]+\z/

  def initialize(num_s)
    @value = num_s
  end

  def to_decimal
    self.class.valid?(@value) ? calculate : 0
  end

  def self.valid?(num_s)
    num_s.match? VALID_REG
  end

  private

  def calculate
    @value
      .reverse
      .each_char
      .with_index
      .map { |digit, index| digit.to_i * BASE**index }
      .reduce(:+)
  end
end
