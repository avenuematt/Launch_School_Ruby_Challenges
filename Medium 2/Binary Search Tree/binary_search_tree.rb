class Bst
  attr_reader :left, :right, :data

  def initialize(num)
    @data = num
  end

  def insert(num)
    if num > data
      right.nil? ? @right = Bst.new(num) : @right.insert(num)
    else
      left.nil? ? @left = Bst.new(num) : @left.insert(num)
    end
  end

  def each
    return enum_for(:each) unless block_given?

    left&.each(&Proc.new)
    yield(data)
    right&.each(&Proc.new)
  end
end
