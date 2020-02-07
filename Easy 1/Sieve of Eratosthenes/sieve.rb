# Implements finding primes with Sieve of Eratosthenes
class Sieve
  def initialize(num)
    @num = num
  end

  def primes
    prime_nums = []
    not_primes = []

    (2..@num).each do |curr|
      next if not_primes.include?(curr)
      prime_nums << curr
      curr.step(to: @num, by: curr).each { |el| not_primes << el }
    end

    prime_nums
  end
end

Sieve.new(10).primes
