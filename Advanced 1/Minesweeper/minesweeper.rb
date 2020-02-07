class ValueError < StandardError; end

class Board
  BOUNDARY_ROW = /\A\+\-+\+\z/
  PLAY_ROW = /\A\|[\* ]+\|\z/

  def self.transform(input)
    raise ValueError unless valid_input?(input)

    output = input.each_with_object([]) { |row, res| res << row.clone }
    input.each_with_index do |row, row_index|
      (0...row.size).each do |col_index|
        if input[row_index][col_index] == ' '
          total = count(row_index, col_index, input)
          output[row_index][col_index] = total.zero? ? ' ' : total.to_s
        end
      end
    end
    output
  end

  def self.count(row_index, col_index, input)
    (row_index - 1..row_index + 1).reduce(0) do |total, idx|
      total + input[idx][col_index - 1..col_index + 1].count('*')
    end
  end

  def self.valid_input?(input)
    input.all? { |row| row.size == input.first.size } &&
      input.first.match?(BOUNDARY_ROW) &&
      input[1...-1].all? { |row| row.match?(PLAY_ROW) } &&
      input.last.match?(BOUNDARY_ROW)
  end
end
