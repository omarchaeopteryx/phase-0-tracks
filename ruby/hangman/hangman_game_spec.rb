# OM, DBC Challenge 6.6

require_relative 'hangman_game'

describe Hangman do
  let(:hangman_test) { Hangman.new }
  let(:hangman_word) { hangman_test.get_secret_word("secret")}
  let(:hangman_letter) { hangman_test.get_secret_word("secret"); hangman_test.get_number_tries("secret"); hangman_test.make_word_array("secret");
  hangman_test.get_letter("e"); hangman_test.make_gameboard("secret")
  hangman_test.check_letter("e"); hangman_test.guessed_letter}

  it "Getting the secret word; should show a string" do
    expect(hangman_test.get_secret_word("secret")).to eq "secret"
  end

  it "Getting the number of tries for the game" do
    expect(hangman_test.get_number_tries(hangman_word)).to eq 6
  end

  it "Creating secret word array" do
    expect(hangman_test.make_word_array(hangman_word)).to be_kind_of Array
  end

  it "Creating secret word-based gameboard of blank letters" do
    expect(hangman_test.make_gameboard(hangman_word)).to be_kind_of Array
  end

  # it "Checking on the guessed letter - is it a string, length 1?" do
  # expect(hangman_word.get_letter("e")).to have_attributes(length:1, class:String)
  # end

  it "Checking if letter has been guessed already" do
    expect(hangman_test.get_letter("E")).to eq "e"
  end

  it "Checking if letter appears in secret array" do
    expect(hangman_test.check_letter("e")).to be false
  end

  it "Checking gameboard return" do
    expect(hangman_test.swap_letter("e")).to be true
  end

  it "Check if the game is over yet (stop asking for input)" do
    expect(hangman_test.check_status).to be false
  end

  it "Checking taunting of user" do
    expect(hangman_test.taunt_user("e")).to eq "Nicely done.\n"
  end
end
