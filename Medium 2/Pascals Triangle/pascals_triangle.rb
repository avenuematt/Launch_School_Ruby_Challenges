class Triangle
  attr_reader :rows

  def initialize(int)
    @rows = generate_rows(int)
  end

  def generate_rows(int)
    (1...int).each_with_object([[1]]) do |row, res|
      curr = []
      (0..row).each { |idx| curr << res[row - 1][[idx - 1, 0].max..idx].sum }
      res << curr
    end
  end
end
