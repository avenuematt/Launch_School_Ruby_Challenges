class RunLengthEncoding
  def self.encode(input)
    counter = 0
    last_char = input[0]
    (0..input.size).each_with_object('') do |idx, res|
      if input[idx] != last_char
        res << (counter == 1 ? last_char : (counter.to_s + last_char))
        counter = 0
      end
      last_char = input[idx]
      counter += 1
    end
  end

  def self.decode(input)
    array = input.scan(/(\d+|[^\d])/i).flatten
    array.each_with_index.each_with_object('') do |(val, idx), res|
      if val.match?(/\d+/)
        res << array[idx + 1] * val.to_i
      else
        array[idx - 1].match?(/\d+/) ? next : (res << val)
      end
    end
  end
end
