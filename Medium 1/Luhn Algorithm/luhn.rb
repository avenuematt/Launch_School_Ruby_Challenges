class Luhn
  def initialize(num)
    @num = num
  end

  def addends
    @num.digits.each_with_index.map do |dig, idx|
      if idx.odd? then (dig * 2 > 9) ? (dig * 2 - 9) : (dig * 2)
      else             dig
      end
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    new_num = num * 10
    new_num + (10 - new(new_num).checksum.digits.first) % 10
  end
end
