# Finds saddle points within a matrix object
class Matrix
  attr_reader :rows, :columns

  def initialize(phrase)
    @rows = phrase.split("\n").map { |row| row.split(' ').map(&:to_i) }
    @columns = rows.transpose
  end

  def saddle_points
    (0...rows.size).each_with_object([]) do |row, res|
      (0...columns.size).each do |col|
        res << [row, col] if saddle_point?(row, col)
      end
    end
  end

  def saddle_point?(row, col)
    num = rows[row][col]
    num >= rows[row].max && num <= columns[col].min
  end
end
