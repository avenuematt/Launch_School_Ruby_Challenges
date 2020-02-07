def gcd(a, b)
  [a, b].min.downto(1).each do |num|
    return num if a % num == 0 && b % num == 0
  end
end
