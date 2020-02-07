class Crypto
  def initialize(phrase)
    @phrase = phrase
  end

  def normalize_plaintext
    @phrase.downcase.delete("^a-z0-9")
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext(dlmtr = "")
    sce = plaintext_segments
    (0...sce.first.size).map do |idx|
      sce.map { |word| word[idx] }.join("")
    end.join(dlmtr)
  end

  def normalize_ciphertext
    ciphertext(" ")
  end
end
