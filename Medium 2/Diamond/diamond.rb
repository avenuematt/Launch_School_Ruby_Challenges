# Prints diamond from letters given just one letter
# Refactored to increase clarity and appease rubocop
class Diamond
  ABET = ('A'..'Z').to_a.freeze

  def self.make_diamond(letter)
    diamond_array(letter).join("\n") + "\n"
  end

  def self.diamond_array(letter)
    diam_size = (ABET.index(letter) + 1) * 2 - 1
    diam_mid = diam_size / 2

    top_half = 0.upto(diam_mid).map { |idx| make_row(idx, diam_size) }
    bot_half = (diam_mid - 1).downto(0).map { |idx| make_row(idx, diam_size) }
    top_half + bot_half
  end

  def self.make_row(idx, size)
    if idx.zero?
      ABET[idx].center(size)
    else
      (ABET[idx] + ' ' * (idx * 2 - 1) + ABET[idx]).center(size)
    end
  end
end
