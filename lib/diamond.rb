class Diamond
  def build(letter)
    letter = letter.upcase
    return 'The input must be a valid letter' unless ('A'..'Z').include?(letter)

    letters = ('A'..letter).to_a
    diagonal_line_size = letters.size
    upper_left_quarter = letters.map.with_index do |char, index|
      '_' * (diagonal_line_size - index - 1) + char + '_' * index
    end

    lower_left_quarter = upper_left_quarter.reverse[1..-1]

    left_side = upper_left_quarter + lower_left_quarter

    right_side = left_side.map{|line| line.reverse[1..-1]}

    diamond = 0.upto(left_side.size - 1).map do |index|
      left_side[index] + right_side[index] + "\n"
    end

    diamond.join
  end
end
