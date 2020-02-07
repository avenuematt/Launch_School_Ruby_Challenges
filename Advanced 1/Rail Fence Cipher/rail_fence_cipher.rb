class RailFenceCipher
  def self.encode(phrase, num)
    return phrase if num < 2 || num > phrase.size
    traverse_rails(phrase, num).map { |idx| phrase[idx] }.join
  end

  def self.decode(phrase, num)
    return phrase if num < 2 || num > phrase.size
    res = (0...phrase.size).each_with_object([]) { |_, con| con << [] }
    mixed_idxs = traverse_rails(phrase, num)
    phrase.chars.each_with_index do |char, idx|
      res[mixed_idxs[idx]] << char
    end
    res.join
  end

  def self.traverse_rails(phrase, num)
    rails = (0...num).each_with_object([]) { |_, res| res << [] }
    curr_rail = 0
    up_rails = true
    (0...phrase.size).each do |idx|
      rails[curr_rail] << idx
      up_rails ? curr_rail += 1 : curr_rail -= 1
      up_rails = !up_rails if [0, num - 1].include? curr_rail
    end
    rails.flatten
  end
end
