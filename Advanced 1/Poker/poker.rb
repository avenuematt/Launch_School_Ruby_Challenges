# Plays a game of poker with hands given as strings
class Poker
  attr_reader :hands

  def initialize(hands)
    @hands = *hands.map { |hand| Hand.new(hand) }
  end

  def best_hand
    top_score = hands.map(&:rank_tiers).max
    hands.select { |hand| hand.rank_tiers == top_score }.map(&:cards)
  end
end

# Lays out poker hands and ranks
class Hand
  ACE_LOW_STRAIGHT = [2, 3, 4, 5, 14].freeze
  FACE_NUMS = { 'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14 }.freeze
  HAND_SIZE = 5
  SCORES = [:high_card, :one_pair, :two_pair, :three_of_a_kind, :straight,
            :flush, :full_house, :four_of_a_kind, :straight_flush].freeze
  SUITS = %(S H C D).freeze

  attr_reader :cards

  def initialize(cards)
    @cards = *cards
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metric/PerceivedComplexity
  def rank
    if straight_flush?     then :straight_flush
    elsif four_of_a_kind?  then :four_of_a_kind
    elsif full_house?      then :full_house
    elsif flush?           then :flush
    elsif straight?        then :straight
    elsif three_of_a_kind? then :three_of_a_kind
    elsif two_pair?        then :two_pair
    elsif one_pair?        then :one_pair
    else                        :high_card
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metric/PerceivedComplexity

  def rank_tiers
    [SCORES.index(rank), high_match, high_card]
  end

  def high_card
    card_scores.max
  end

  def high_match
    if four_of_a_kind?           then max_card_with_matches_of(4)
    elsif three_of_a_kind?       then max_card_with_matches_of(3)
    elsif one_pair? || two_pair? then max_card_with_matches_of(2)
    else                              0
    end
  end

  def card_scores
    (block_given? ? yield : cards).map do |c|
      card_num(c).to_i.zero? ? FACE_NUMS[card_num(c)] : card_num(c).to_i
    end
  end

  def max_card_with_matches_of(num)
    card_scores do
      cards.select do |card|
        cards.join.count(card_num(card)) == num
      end
    end.max
  end

  def one_pair?
    count_matches(2)
  end

  def two_pair?
    count_matches(2, 2)
  end

  def three_of_a_kind?
    count_matches(3)
  end

  def straight?
    [*card_scores.min..card_scores.max] == card_scores.sort ||
      card_scores.sort == ACE_LOW_STRAIGHT
  end

  def flush?
    cards.join.count(card_suit(cards.first)) == HAND_SIZE
  end

  def full_house?
    one_pair? && three_of_a_kind?
  end

  def four_of_a_kind?
    count_matches(4)
  end

  def straight_flush?
    straight? && flush?
  end

  def count_matches(num_same, num_of_matches = 1)
    string = cards.join
    cards.map { |card| string.count(card_num(card)) }.count(num_same) ==
      num_same * num_of_matches
  end

  def card_num(card)
    card[0]
  end

  def card_suit(card)
    card[-1]
  end
end
