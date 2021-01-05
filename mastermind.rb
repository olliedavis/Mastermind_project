class Mastermind
  $COLORS = %w[r g b y o p]

  def initialize
    @computer_choices = []
    @user_choices = []
    @correct_count = 0
    @correct_color_count = 0
    @total_rounds = 0
  end

  
  def computer_random_choice
    4.times do
      @computer_choices.push($COLORS[rand(0...5)])
    end
  end

  def user_guesses
    puts 'You can choose four following six colours: Red, Green, Blue, Yellow, Orange, or Purple'
    puts 'Please enter your selection in the following format [RGBY] without the square brackets'
    user_input = gets.strip.downcase
    @user_choices = user_input.split('')
    valid?
  end

  def valid?
    if @user_choices.length == 4
      colour_check_if_perfect
    else
      puts 'Invalid Entry, Please try again'
      user_guesses
    end
  end

  def colour_check_if_perfect
    @holding_computer_choices = @computer_choices.dup
    @holding_computer_choices.each_with_index do |computer_color, computer_idx|
      if computer_color == @user_choices[computer_idx]
        @user_choices[computer_idx] = 'x'
        @holding_computer_choices[computer_idx] = "x"
        @correct_count += 1
        next
      end
    end
    check_matches
  end
  
  def check_matches
    @holding_computer_choices.each_with_index do |computer_color, computer_idx|
      @user_choices.each_with_index do |user_color, user_idx|
        if computer_color == user_color and computer_color != "x"
          @correct_color_count += 1
          @user_choices[user_idx] = "x"
          @holding_computer_choices[computer_idx] = "x"
        end
      end
    end
    won?
  end

  def won?
    if @correct_count == 4
      puts 'Perfect! You win!'
    else
      puts "Perfect colors: #{@correct_count}"
      puts "Correct color, but incorrect positions: #{@correct_color_count}"
      puts 'Please Try Again'
      @total_rounds += 1
      puts "Total Rounds: #{@total_rounds}"
      @correct_count = 0
      @correct_color_count = 0
      @user_choices = []
      user_guesses
    end
  end

  def play
    computer_random_choice
    user_guesses
  end
end


game = Mastermind.new
game.play
