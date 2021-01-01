class Mastermind
  def initialize
    @computer_choices = []
    user_choices = []
    correct_count = 0
    correct_color_count = 0
    total_rounds = 0
  end

  COLORS = ["red", "green", "blue", "yellow", "orange", "purple"]

  def computer_random_choice
    4.times do
      @computer_choices.push(COLORS[rand(0...5)])
    end
    puts @computer_choices
  end

end

game = Mastermind.new

game.computer_random_choice
