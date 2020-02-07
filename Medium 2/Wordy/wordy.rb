# Sequentially solves a basic mathematical question entered as String
class WordProblem
  INT_REGX = /-?\d+/
  OPS = { 'plus' => '+', 'minus' => '-',
          'multiplied' => '*', 'divided' => '/' }.freeze

  def initialize(question)
    @problem = parse(question)
    raise ArgumentError unless valid_question?
  end

  def answer
    problem.each_with_index.reduce(problem.first.to_i) do |tot, (val, idx)|
      idx.odd? ? tot.send(OPS[val], problem[idx + 1].to_i) : tot
    end
  end

  private

  attr_reader :problem

  def parse(question)
    question.scan(/(#{INT_REGX}|#{OPS.keys.join('|')})/).flatten
  end

  def valid_question?
    qu = problem
    qu.size > 1 && qu.size.odd? && qu.each_with_index.all? do |val, idx|
      idx.even? ? val.match?(INT_REGX) : OPS.member?(val)
    end
  end
end
