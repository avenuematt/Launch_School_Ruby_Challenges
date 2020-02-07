class Scrabble
  TILES = { 1 => %w(A E I O U L N R S T),
            2 => %w(D G),
            3 => %w(B C M P),
            4 => %w(F H V W Y),
            5 => %w(K),
            8 => %w(J X),
            10 => %w(Q Z) }.freeze

  attr_reader :score

  def initialize(phrase)
    @score = Scrabble.score(phrase || '')
  end

  def self.score(phrase)
    phrase.upcase.chars.reduce(0) do |total, char|
      total + TILES.key(TILES.values.select { |v| v.include?(char) }[0]).to_i
    end
  end
end
