# cleans phone number for presentation. checks for valid numbers
class PhoneNumber
  def initialize(string)
    @number = string
  end

  def number
    return INVALID if invalid_number?
    res = @number.delete('^0-9')
    res.size == 10 ? res : res.delete_prefix!('1')
  end

  def area_code
    number[0, 3]
  end

  def to_s
    "(#{area_code}) #{number[3, 3]}-#{number[6, 4]}"
  end

  private

  INVALID = '0' * 10

  def invalid_number?
    @number.count('a-zA-Z') > 0   ||
      @number.count('0-9') < 10   ||
      @number.count('0-9') > 11   ||
      @number.count('0-9') == 11 && @number.delete('^0-9')[0] != '1'
  end
end
