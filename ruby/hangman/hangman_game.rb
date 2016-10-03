# OM, DBC Challenge 6.6

class Hangman
  attr_reader :game_over, :secret_word_array, :gameboard_array, :guesses_array, :guessed_letter, :already_tried, :stop_asking, :letter_match
  attr_accessor :secret_word; :number_tries; :game_over

  def initialize()
    puts "Starting new game..."
    i = 0
    until i == 20
      title = " HANGMAN!!!BEGIN!!!!"
      puts ("*"*i + title[i])
      i += 1
    end
    @game_over = false  # Either getting word right, or by running out of guesses will end the game.
    @secret_word_array = []
    @gameboard_array = []
    @guesses_array = []
    @already_tried = false
    @stop_asking = false
    @letter_match = false
    @taunt = 0
    # @number_tries = 10 # rspec seems to like a default value here...?
  end

  # Gathering a string from the user's input.
  def get_secret_word(secret_word)
    @secret_word = secret_word.to_s.downcase
    puts (("* " +  "\n")*50 + "X_X \n")
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
      # @already_tried = true
    else
      # @already_tried = false
      @guesses_array << @guessed_letter
      @number_tries = (@number_tries - 1)
    end
    @guessed_letter
  end

  def check_letter(letter_guess)
    if @stop_asking == false
      @secret_word_array.map {|letter| if letter == @guessed_letter then @letter_match = true; else end} # keep this last one as "="
    else
    end
    @letter_match
  end

  def swap_letter(letter_guess)
    index_holder = [] # Part I: finding indexes of the secret array
    @secret_word_array.each.with_index {|letter, index| if (letter == @guessed_letter) == true then index_holder << index end}
    # Part II: assigning index from secret array to game board (find quicker way to do this...)
    if @letter_match == true
      index_holder.each {|index| @gameboard_array[index] = @guessed_letter}
      @already_tried = true
    else
      @number_tries -= (@number_tries - 1)
    end
    @already_tried
    @gameboard_array
  end

  def show_gameboard
    puts @gameboard_array.join(" ")
    puts "Tries left: #{@number_tries}"
  end

  def check_status
    if @number_tries == 0
      @game_over == true
      puts "Game over!"
      exit
    elsif @gameboard_array == @secret_word_array
      @game_over == true
      puts "Nice job! Game over!"
      exit
    end
    @game_over
  end

  def taunt_user
    if @secret_word_array.include?(@guessed_letter)
      puts "Nicely done.\n"
    else
      puts "Getting warmer...\n"
    end
  end
  # def run_letters(letter_guess) <-- Find a way to chain these functions into one series...
  #   runner.get_letter(letter_guess)
  #   runner.check_letter(letter_guess)
  #   runner.swap_letter(letter_guess)
  #   runner.show_gameboard
  # end
end

# Test driver code below (Comment out all the below when running rspec):

# TESTING
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
# p game1.check_letter("Z")
# game1.swap_letter("z")
# p game1.gameboard_array
# game1.show_gameboard
# puts "Now let the other person try to guess a letter."
# game1.run_letters("a")

Making loops for user interface:

my_game = Hangman.new
puts "Hi, what is your secret word?"
my_word = gets.chomp
my_game.get_secret_word(my_word)
my_game.get_number_tries(my_word)
puts "Let's play!"
my_game.make_word_array(my_word)
my_game.make_gameboard(my_word)

puts "Please let the other player guess a letter:\n"
my_game.show_gameboard

until @game_over == true
  puts "Which letter would you like to try? \n \n"
  # my_game.show_gameboard
  my_guess = gets.chomp
  my_game.get_letter(my_guess)
  my_game.check_letter(my_guess)
  my_game.swap_letter(my_guess)
  my_game.taunt_user
  my_game.show_gameboard
  my_game.check_status
end

#END
