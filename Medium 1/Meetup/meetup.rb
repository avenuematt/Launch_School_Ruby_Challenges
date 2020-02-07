require 'date'

class Meetup
  def initialize(month, year)
    @st_date = Date.new(year, month)
  end

  def day(day, criteria)
    array = generate_days(day)
    case criteria
    when :teenth then array.select { |day| (13..19).cover? day.mday }.first
    when :first  then array.first
    when :second then array[1]
    when :third  then array[2]
    when :fourth then array[3]
    when :last   then array.last
    end
  end

  def generate_days(day)
    curr_date = @st_date
    res = []
    while curr_date.mon == @st_date.mon
      res << curr_date if curr_date.strftime("%A").downcase == day.to_s
      curr_date += 1
    end
    res
  end
end
