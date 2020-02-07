class Prime
  @@primes = [2]

  def self.nth(num)
    raise ArgumentError unless num > 0
    generate_next_prime while @@primes.size < num
    @@primes[num - 1]
  end

  def self.generate_next_prime
    st = @@primes.size == 1 ? 3 : (@@primes.last + 2)
    st += 2 until is_prime?(st)
    @@primes << st
  end

  def self.is_prime?(num)
    3.step(to: Integer.sqrt(num), by: 2).none? { |arg| num % arg == 0 }
  end
end
