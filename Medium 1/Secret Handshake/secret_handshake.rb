class SecretHandshake
  attr_reader :commands, :bin_num

  POT_COMMANDS = { 1 => 'wink', 10 => 'double blink', 100 => 'close your eyes',
                   1000 => 'jump' }.freeze
  REVERSE_TRIGGER = 10_000

  def initialize(input)
    @bin_num = input.is_a?(Integer) ? input.to_s(2) : input.to_i.to_s(2)
    @commands = []
    generate
  end

  def generate
    bin_num.chars.reverse.each_with_index do |char, idx|
      target = char.to_i * 10**idx
      commands << POT_COMMANDS.fetch(target) if POT_COMMANDS.include?(target)
      commands.reverse! if target == REVERSE_TRIGGER
    end
  end
end
