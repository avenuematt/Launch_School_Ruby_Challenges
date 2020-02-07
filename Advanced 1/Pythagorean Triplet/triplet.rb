class Triplet
  attr_reader :values

  def initialize(*args)
    @values = args.sort
  end

  def sum
    values.sum
  end

  def product
    values.reduce(:*)
  end

  def pythagorean?
    values.first**2 + values[1]**2 == values.last**2
  end

  def self.where(min_factor: 1, max_factor: 1, sum: nil)
    [*min_factor..max_factor].combination(3).each_with_object([]) do |args, res|
      triplet = Triplet.new(*args)
      res << triplet if triplet.pythagorean? && (triplet.sum == sum || sum.nil?)
    end
  end
end
