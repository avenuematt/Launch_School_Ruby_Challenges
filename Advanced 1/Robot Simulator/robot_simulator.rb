# Establishes a robots positions and orientation, with commands
class Robot
  DIRECTIONS = [:north, :east, :south, :west].freeze

  attr_accessor :bearing, :coordinates

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)
    self.bearing = direction
  end

  def at(x, y)
    self.coordinates = [x, y]
  end

  def advance
    case bearing
    when :north then coordinates[1] += 1
    when :south then coordinates[1] -= 1
    when :east  then coordinates[0] += 1
    when :west  then coordinates[0] -= 1
    end
  end

  def turn_right
    turn('+')
  end

  def turn_left
    turn('-')
  end

  private

  def turn(method)
    new_index = DIRECTIONS.index(bearing).send(method, 1) % DIRECTIONS.size
    self.bearing = DIRECTIONS.fetch(new_index)
  end
end

# Conveys commands through a simulated instruction list to collaborator Robot
class Simulator
  INSTRUCTIONS = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }
                 .freeze

  def instructions(phrase)
    phrase.each_char.map { |char| INSTRUCTIONS.fetch(char) }
  end

  def place(bot, hash)
    bot.at(hash.fetch(:x), hash.fetch(:y))
    bot.orient(hash.fetch(:direction))
  end

  def evaluate(bot, phrase)
    instructions(phrase).each { |command| bot.send(command) }
  end
end
