class Series
  def initialize(string)
    @num_str = string
  end

  def slices(num)
    raise ArgumentError if num > @num_str.size
    @num_str.chars.each_cons(num).map{ |arg| arg.map(&:to_i) }
  end
end
