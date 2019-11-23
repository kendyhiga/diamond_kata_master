class Diamond
  def build(letter)
    letter = letter.upcase
    return 'Not a valid input, please use a letter from A to Z.' unless letter_valid?(letter)

    letters_array = ('A'..letter).to_a
    left_side, right_side = build_each_side(letters_array)
    join_left_and_right_side(left_side, right_side)
  end

  private

    def letter_valid?(letter)
      'A'.upto('Z').include?(letter)
    end

    def build_each_side(letters_array)
      upper_left_side = build_first_block(letters_array)
      lower_left_side = remove_first_line_and_reverse(upper_left_side)
      left_side = upper_left_side + lower_left_side
      right_side = left_side.map { |line| remove_first_line_and_reverse(line) }
      [left_side, right_side]
    end

    def build_first_block(letters_array)
      letters_array.map.with_index do |char, index|
        '_' * (letters_array.size - index - 1) + char + '_' * index
      end
    end

    def remove_first_line_and_reverse(part)
      part.reverse[1..-1]
    end

    def join_left_and_right_side(left_side, right_side)
      (0...left_side.size).map { |i| left_side[i] + right_side[i] + "\n" }.join
    end
end
