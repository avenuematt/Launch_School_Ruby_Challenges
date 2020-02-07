class Clock
  attr_accessor :hour, :mins
  MINS_IN_HOUR = 60
  HOURS_IN_DAY = 24

  def initialize(hour, mins)
    @hour = hour
    @mins = mins
    normalize
  end

  def self.at(hour, mins = 0)
    new(hour, mins)
  end

  def to_s
    format("%02d:%02d", hour, mins)
  end

  def +(num)
    Clock.new(hour, mins + num)
  end

  def -(num)
    Clock.new(hour, mins - num)
  end

  def ==(other)
    to_s == other.to_s
  end

  def normalize
    total_mins = hour * MINS_IN_HOUR + mins
    self.hour = total_mins / MINS_IN_HOUR % HOURS_IN_DAY
    self.mins = total_mins % MINS_IN_HOUR
  end
end
