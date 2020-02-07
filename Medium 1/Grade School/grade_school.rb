class School
  attr_accessor :grades

  def initialize
    @grades = Hash.new { |h,k| h[k] = [] }
  end

  def to_h
    grades.sort_by { |k, _| k }.to_h.each { |_, v| v.sort! }
  end

  def add(name, grade)
    grades[grade] << name
  end

  def grade(num)
    to_h.fetch(num, [])
  end
end
