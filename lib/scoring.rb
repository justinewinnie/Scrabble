require_relative '../scrabble'

class Scrabble::Scoring

  SCORE_CHART = {
"A" => 1,
"E" => 1,
"I" => 1,
"O" => 1,
"U" => 1,
"L" => 1,
"N" => 1,
"R" => 1,
"S" => 1,
"T" => 1,
"D" => 2,
"G" => 2,
"B" => 3,
"C" => 3,
"M" => 3,
"P" => 3,
"F" => 4,
"H" => 4,
"V" => 4,
"W" => 4,
"Y" => 4,
"K" => 5,
"J" => 8,
"X" => 8,
"Q" => 10,
"Z" => 10
}

  # Take a word, upcase it, and return an array of its letters
  def self.word_letters(word)
     word.upcase.split(//)
  end

  # Finds the point value of each letter given
  def self.letter_points(letter)
    SCORE_CHART.fetch(letter)
  end

  # Finds point value of each letter in a word
  # Creates an array of points for each letter
  def self.word_points(word)
    word_letters(word).map { |i| letter_points(i) }
  end

  # Sums the points from the word_points array
  def self.score(word)
    total = 0
    # Adds a bonus for 7-letter words.
    if word_points(word).length == 7 then total = 50 end
    total += word_points(word).reduce(:+)
    total
  end


  # Returns the highest-valued word in a word_array.
  def self.highest_score_from(array_of_words)
    # word_pt_array stores the points of each word in the array_of_words
    word_pt_array = array_of_words.map { |word| score(word) }

    # zipped_words stores a sorted array of the words and the points, each in an array
    zipped_words = (array_of_words.zip(word_pt_array)).sort_by { |pair| pair[1]}

    # Returns the highest-scoring word.
    return zipped_words[-1][0]
  end

end
