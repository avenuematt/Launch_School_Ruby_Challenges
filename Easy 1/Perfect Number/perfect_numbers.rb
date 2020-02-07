class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 0
    sum_factors = (1...num).select { |arg| num % arg == 0 }.sum
    if    num == sum_factors then 'perfect'
    elsif sum_factors > num  then 'abundant'
    else                          'deficient'
    end
  end
end
