# Implements finding primes with Sieve of Eratosthenes
class Sieve
  START = 2

  def initialize(num)
    @max = num
  end

  def primes
    arr = (START..@max).to_a
    arr.each do |num|
      (num * START).step(to: @max, by: num).each { |mult| arr.delete(mult) }
    end
  end
end
