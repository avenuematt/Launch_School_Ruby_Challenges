def fizzbuzz(num)
  (1..num).map do |num|
    str = ((num % 3 == 0) ? "Fizz" : "") +
          ((num % 5 == 0) ? "Buzz" : "")
    str.size > 0 ? str : num
  end.join(" ")
end

puts fizzbuzz(100)
