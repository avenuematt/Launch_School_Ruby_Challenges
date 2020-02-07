class OCR
  NUMBERS = { "0" => [" _", "| |", "|_|"],
              "1" => ["", "  |", "  |"],
              "2" => [" _", " _|", "|_"],
              "3" => [" _", " _|", " _|"],
              "4" => ["", "|_|", "  |"],
              "5" => [" _", "|_", " _|"],
              "6" => [" _", "|_", "|_|"],
              "7" => [" _", "  |", "  |"],
              "8" => [" _", "|_|", "|_|"],
              "9" => [" _", "|_|", " _|"] }
  NUM_SIZE = 3
  COMMA = ["", nil, nil]

  def initialize(text)
    @text = text
  end

  def convert
    text_chars = split_mult_nums

    if text_chars.include? COMMA
      res = []
      a = []
      text_chars.each do |col|
        if col == COMMA
          res << convert_without_comma(a)
          a = []
        else
          a << col
        end
      end
      res.push(convert_without_comma(a)).join(",")
    else
      convert_without_comma(text_chars)
    end
  end

  private

  def split_mult_nums
    nums = []
    rows = @text.split("\n")
    row_size = rows.last.size
    rows.each do |row|
      res = []
      0.step(to: row_size - 1, by: NUM_SIZE) do |idx|
        res << row[idx...idx + NUM_SIZE]
      end
      nums << res
    end
    nums
  end

  def convert_single(letter)
    return "?" unless NUMBERS.value?(letter)
    NUMBERS.key(letter)
  end

  def convert_without_comma(text_chars)
    res = ""
    col_size = text_chars.size
    row_size = text_chars.last.size

    (0...row_size).each do |row_num|
      letter = []

      (0...col_size).each do |col_num|
        char = text_chars[col_num][row_num]
        letter << char.rstrip if char
      end

      actual = convert_single(letter)
      res += actual
    end
    res
  end
end
