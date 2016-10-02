# OM, DBC Challenge 6.6

class Hangman
  attr_reader :game_over, :secret_word_array, :gameboard_array, :guesses_array, :guessed_letter, :already_tried, :number_tries, :stop_asking, :letter_match
  attr_accessor :secret_word;

  def initialize()
    puts "Starting new game..."
    i = 0
    until i == 20
      title = " HANGMAN!!!BEGIN!!!!"
      puts ("*"*i + title[i])
      i += 1
    end
    # @secret_word = secret_word # Either this or nil OK...
    @game_over = false  # Either getting word right, or by running out of guesses will end the game.
    # @number_tries = number_tries
    @secret_word_array = []
    @gameboard_array = []
    @guesses_array = []
    @already_tried = false
    @stop_asking = false
    @letter_match = false
    @number_tries = 10 # rspec seems to like a default value here...?
  end

  # Gathering a string from the user's input.
  def get_secret_word(secret_word)
    # @game_over = secret_word.length
    @secret_word = secret_word.to_s.downcase
    puts (("* " +  "\n")*50 + "X_X \n")
    # @number_tries = @secret_word.length # FIX!!!
    @secret_word
  end

  # Extracting the length of the given user string and: 1) set that as the total allowed guesses for the game, and 2) make it into an array.
  def get_number_tries(secret_word)
    @secret_word
    @number_tries = secret_word.length
    @number_tries
  end

  def make_word_array(secret_word)
    @secret_word_array = @secret_word.split('')
    @secret_word_array
  end

  # The word class also needs to make an empty array or string of "_" for however long the user's word is.
  def make_gameboard(secret_word)
    gameboard = @secret_word_array.dup
    gameboard.each {|i| @gameboard_array.push("_")}
    @gameboard_array
  end

  def get_letter(letter_guess)
    @guessed_letter = letter_guess.downcase
    if @guesses_array.include?(@guessed_letter)
      @already_tried = true
    else
      @already_tried = false
      @guesses_array << @guessed_letter
      @number_tries = (@number_tries-1)
    end
    @guessed_letter
  end

  def check_letter(letter_guess)

    if @already_tried = false && @stop_asking = false
      @secret_word_array.map {|letter| if letter == @guessed_letter then @letter_match = true; else end}
    end
    @letter_match
  end

  #
  #
  #   location = @secret_word_array.find_index(@guessed_letter)
  #   if location != nil
  #     @letter_match = true
  #     @gameboard_array[location] = @secret_word_array[location]
  #   else
  #     puts "No answer."
  #     @letter_match = false
  #   end
  #   @number_tries = (@number_tries-1)
  #   @letter_match
  # end

end

# Driver code goes here (Be sure to comment out when running rspec)
# # #
# game1 = Hangman.new
# puts "Hi, what is your secret word?"
# users_word = gets.chomp
# game1.get_secret_word(users_word)
# puts "You typed in a word. Shhhh."
# game1.get_number_tries(users_word)
# game1.make_word_array(users_word)
# game1.make_gameboard(users_word)
# p game1.secret_word_array
# p game1.gameboard_array
# p game1.number_tries
# game1.get_letter("z")
# p game1.guesses_array
# p game1.check_answer("Z")
# p game1.gameboard_array
# puts "Now let the other person try to guess a letter."

# game2 = Hangman.new
# game2.get_secret_word("secret")
# p game2.secret_word
