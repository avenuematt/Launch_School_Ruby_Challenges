class Queens
  attr_reader :white, :black
  WHITE_MARKER = 'W'.freeze
  BLACK_MARKER = 'B'.freeze

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = white
    @black = black
  end

  def to_s
    board = (0...8).each_with_object([]) { |_, res| res << ('_ '*8).rstrip }
    board[white.first][white.last * 2] = WHITE_MARKER
    board[black.first][black.last * 2] = BLACK_MARKER
    board.join("\n")
  end

  def attack?
    white.first == black.first ||
      white.last == black.last ||
      ((white.first.to_f - black.first) / (white.last - black.last)).abs == 1
  end
end
