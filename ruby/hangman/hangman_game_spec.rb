# OM, DBC Challenge 6.6

require_relative 'hangman_game'

describe Hangman do
  let(:hangman_test) { Hangman.new }
  let(:hangman_word) { hangman_test.get_secret_word("secret")}
  let(:hangman_letter) { hangman_test.get_secret_word("secret"); hangman_test.get_number_tries("secret"); hangman_test.make_word_array("secret");}

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
    expect(hangman_test.get_letter("e")).to eq "e"
  end

  it "Checking if letter appears in secret array" do
    expect(hangman_letter.check_answer("e")).to be true
  end

end
