class EightQueens
  BOARD_COLS = 8

  def calculate_boards
    generate_pot_boards.select { |board| valid?(board) }.size
  end

  def generate_pot_boards
    (0...BOARD_COLS).to_a.permutation(BOARD_COLS)
  end

  def valid?(board)
    board.combination(2).all? do |q1, q2|
      ((board.index(q1) - board.index(q2)).to_f / (q1 - q2)).abs != 1
    end
  end
end
