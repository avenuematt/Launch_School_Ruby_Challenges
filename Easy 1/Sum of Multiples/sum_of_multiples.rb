class SumOfMultiples
  def initialize(*multiples)
    @factors = multiples.empty? ? [3, 5] : multiples
  end

  def self.to(num)
    new.to(num)
  end

  def to(num)
    (1...num).select { |arg| @factors.any? { |f| arg % f == 0 } }.sum
  end
end
