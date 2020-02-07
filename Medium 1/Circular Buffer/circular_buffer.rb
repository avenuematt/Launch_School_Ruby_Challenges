class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  attr_accessor :queue, :read_idx
  attr_reader :size

  def initialize(num)
    @read_idx = 0
    @size = num
    @queue = []
  end

  def read
    raise BufferEmptyException if queue.empty? || queue[read_idx].nil?
    self.read_idx += 1
    queue[read_idx - 1]
  end

  def write(el)
    return if el.nil?
    raise BufferFullException if queue.size == size
    queue << el
  end

  def write!(el)
    if el.nil? || queue.size < size
      write(el)
    else
      queue.shift
      self.read_idx -= 1 unless read_idx.zero?
      write(el)
    end
  end

  def clear
    self.queue = []
  end
end
