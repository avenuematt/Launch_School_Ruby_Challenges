require 'minitest/autorun'

require_relative 'odd_words'

class TestOddWords < Minitest::Test
  def test_new_odd_words_instance
    assert_raises ArgumentError do
      OddWords.new('123')
    end
    assert_raises ArgumentError do
      OddWords.new('')
    end
    assert_raises ArgumentError do
      OddWords.new('a12 45')
    end
    assert_raises ArgumentError do
      OddWords.new(' ')
    end
  end

  def test_output
    orig = "whats the matter with kansas."
    exp = "whats eht matter htiw kansas."
    assert_equal(exp, OddWords.new(orig).output)
  end
end
