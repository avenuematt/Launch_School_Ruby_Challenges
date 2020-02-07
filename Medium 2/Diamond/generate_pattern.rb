def generate_pattern(num)
  diam_num = [*1..num].join.size
  (1..num).map { |el| [*1..el].join.ljust(diam_num, "*") }.join("\n")
end
