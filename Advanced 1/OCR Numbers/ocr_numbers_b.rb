# Converts an OCR number for a String input into its equivalent digit (String)
class OCR
  NUMBERS = { [' _ ', '| |', '|_|'] => '0', ['   ', '  |', '  |'] => '1',
              [' _ ', ' _|', '|_ '] => '2', [' _ ', ' _|', ' _|'] => '3',
              ['   ', '|_|', '  |'] => '4', [' _ ', '|_ ', ' _|'] => '5',
              [' _ ', '|_ ', '|_|'] => '6', [' _ ', '  |', '  |'] => '7',
              [' _ ', '|_|', '|_|'] => '8', [' _ ', '|_|', ' _|'] => '9' }
            .freeze

  def initialize(text)
    @text = text
  end

  def convert
    @text.split("\n\n").map { |row| convert_row(row) }.join(',')
  end

  def convert_row(row)
    rows = row.split("\n")
    width = rows.max_by(&:size).size
    arr = rows.map { |line| line.ljust(width).scan(/.{3}/) }
    arr.transpose.map { |num| NUMBERS.fetch(num, '?') }.join
  end
end
