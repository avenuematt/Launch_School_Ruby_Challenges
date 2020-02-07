Element = Struct.new(:datum, :next) do
  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def size
    to_a.size
  end

  def empty?
    head.nil?
  end

  def push(num)
    self.head = (head.nil? ? Element.new(num) : Element.new(num, head))
  end

  def peek
    head.nil? ? head : head.datum
  end

  def pop
    val = head.datum
    self.head = head.next
    val
  end

  def self.from_a(array)
    array&.reverse&.each_with_object(new) { |arg, res| res.push(arg) } || new
  end

  def to_a
    res = []
    curr = head
    while !curr.nil?
      res << curr.datum
      curr = curr.next
    end
    res
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end
end
