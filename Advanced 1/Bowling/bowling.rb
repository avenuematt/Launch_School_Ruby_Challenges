# Allows user to play bowling game and score it
class Game
  attr_accessor :curr_frame, :frames

  def initialize
    @curr_frame = 1
    @frames = Hash.new { |h, v| h[v] = [] }
  end

  def roll(pins)
    valid_roll?(pins)
    self.curr_frame += 1 if advance_frame?
    frames[curr_frame] << pins
  end

  def valid_roll?(pins)
    pin_count = advance_frame? ? 0 : frame_sum(curr_frame)

    raise RuntimeError unless (0..10).cover?(pins)
    raise RuntimeError if pin_count + pins > 10
    raise RuntimeError if game_over?
    true
  end

  def advance_frame?
    frames[curr_frame].size == 2 || strike?(curr_frame)
  end

  def score
    raise RuntimeError unless game_over?
    frames.each_key.reduce(0) do |total, frame|
      if    frame > 10     then total
      elsif strike?(frame) then total + strike_score(frame)
      elsif spare?(frame)  then total + spare_score(frame)
      else                      total + frame_sum(frame)
      end
    end
  end

  def game_over?
    fk_size = frames.keys.size
    case fk_size
    when 10 then valid_ten_frame?
    when 11 then valid_eleven_frame?
    when 12 then valid_twelve_frame?
    end
  end

  def valid_ten_frame?
    frames[10].size == 2 && !strike?(10) && !spare?(10)
  end

  def valid_eleven_frame?
    strike?(10) && !strike?(11) && frames[11].size == 2 ||
      spare?(10) && frames[11].size == 1
  end

  def valid_twelve_frame?
    strike?(10) && strike?(11)
  end

  def strike?(frame)
    frames[frame].first == 10
  end

  def spare?(frame)
    frames[frame].sum == 10 && frames[frame].size == 2
  end

  def strike_score(f)
    frms = frames
    added = if strike?(f + 1)
              frms[f + 1].first + frms[f + 2].first
            else
              frame_sum(f + 1)
            end
    frame_sum(f) + added
  end

  def spare_score(f)
    frames[f].sum + frames[f + 1].first
  end

  def frame_sum(f)
    frames[f].sum
  end
end
