class Robot
  attr_reader :name
  @@existing_names = []

  def initialize
    reset
  end

  def reset
    potential = ([*'A'..'Z'].sample(2) + [*'0'..'9'].sample(3)).join
    if @@existing_names.include?(potential)
      reset
    else
      @@existing_names.delete(@name)
      @name = potential
      @@existing_names << @name
    end
  end
end
