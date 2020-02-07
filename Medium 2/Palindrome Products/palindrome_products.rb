# Class generates palindromes given a certain value range
class Palindromes
  def initialize(args)
    @max = args.fetch(:max_factor)
    @min = args.fetch(:min_factor, 1)
    @pals = Hash.new { |h, k| h[k] = [] }
  end

  def generate
    (min..max).to_a.repeated_combination(2) do |a, b|
      pals[a * b] << [a, b] if valid?(a * b)
    end
  end

  def valid?(num)
    num.to_s == num.to_s.reverse
  end

  def largest
    single(:max)
  end

  def smallest
    single(:min)
  end

  private

  attr_reader :max, :min
  attr_accessor :pals

  def single(method)
    Struct
      .new(:value, :factors)
      .new(pals.keys.send(method), pals[pals.keys.send(method)])
  end
end
