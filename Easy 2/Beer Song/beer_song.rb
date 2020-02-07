class BeerSong
  REF_BOTTLES = 100
  BOTTLES = { 0 => 'No more bottles', 1 => '1 bottle' }.freeze
  TAKE = { 0 => 'Go to the store and buy some more',
           1 => 'Take it down and pass it around' }.freeze

  def verse(num)
    bottles = get_bottles(num)
    next_bottle = get_bottles((num - 1) % REF_BOTTLES)
    take = TAKE.fetch(num, 'Take one down and pass it around')

    "#{bottles} of beer on the wall, #{bottles.downcase} of beer.\n"\
    "#{take}, #{next_bottle.downcase} of beer on the wall.\n"
  end

  def verses(st, ed)
    [*ed..st].reverse.map { |arg| verse(arg) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  def get_bottles(num)
    BOTTLES.fetch(num, "#{num} bottles")
  end
end
