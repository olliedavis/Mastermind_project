class Mastermind
  COLORS = ["r", "g", "b", "y", "o", "p"]

  def initialize
    @computer_choices = []
    user_choices = []
    correct_count = 0
    correct_color_count = 0
    total_rounds = 0
  end

  def computer_random_choice
    4.times do
      @computer_choices.push(COLORS[rand(0...5)])
    end
    puts @computer_choices
  end

  def user_guesses
    puts "You can choose four following six colours: Red, Green, Blue, Yellow, Orange, or Purple"
    puts "Please enter your selection in the following format [RGBY] without the square brackets"
    user_input = gets.strip.downcase
    user_choices = user_input.split("")
  end

  def valid?
    if user_choices.length == 4 and (user_choices - COLORS).empty?
    end
  end

end

game = Mastermind.new

