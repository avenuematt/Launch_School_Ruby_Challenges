# Does a simple cipher shift based on a key for a certain # positions
class Cipher
  LETTERS = [*'a'..'z'].freeze
  MIN_ORD = 'a'.ord
  MAX_ORD = 'z'.ord
  ALPHA_LEN = LETTERS.size

  attr_reader :key

  def initialize(key = LETTERS.sample(100).join)
    raise ArgumentError unless key.match?(/\A[a-z]+\z/)
    @key = key
  end

  def encode(phrase)
    shift(phrase, '+')
  end

  def decode(phrase)
    shift(phrase, '-')
  end

  private

  def shift(phrase, method)
    phrase.chars.each_with_index.map do |char, idx|
      new_ord = char.ord.send(method, key[idx].ord - MIN_ORD)
      new_ord += ALPHA_LEN if new_ord < MIN_ORD
      new_ord -= ALPHA_LEN if new_ord > MAX_ORD
      new_ord.chr
    end.join
  end
end
