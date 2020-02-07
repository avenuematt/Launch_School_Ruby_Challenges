class House
  def recite
    last_idx = pieces.size - 1
    last_idx.step(to: 0, by: -1).map { |st_idx| make_verse(st_idx) }.join("\n")
  end

  def make_verse(st_idx)
    verse = pieces[st_idx..-1].map { |piece| piece.join("\n") }.join(' ')
    "This is #{verse}.\n"
  end

  def self.recite
    new.recite
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
