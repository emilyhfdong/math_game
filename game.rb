class Player
  attr_accessor :name, :lives
  def initialize (name, lives)
    @name = name
    @lives = lives
  end

  def update_lives(update)
    @lives += update
  end
end

class Question
  attr_accessor :a, :b
  def initialize
    @a = rand(1..20)
    @b = rand(1..20)
  end

  def sum
    @a + @b
  end

  def check_answer(input)
    input == self.sum
  end

  def ask_question
    "What does #{@a} plus #{@b} equal?"
  end

end

class TurnManager
  attr_accessor :players
  def initialize(players)
    @players = players.clone
  end

  def current_player
    @players[0]
  end

  def rotate_players
    @players.rotate!
  end
end

class Turn
  attr_accessor :player, :question
  def initialize(player)
    @player = player
    @question = Question.new
  end
end

class Game
  def initialize(total_lives)
    @total_lives = total_lives
    @player_1 = Player.new("P1", total_lives)
    @player_2 = Player.new("P2", total_lives)
    @turn_manager = TurnManager.new([@player_1, @player_2])
  end

  def game_finished?
    @player_1.lives <= 0 || @player_2.lives <= 0
  end

  def current_scores
    puts "#{@player_1.name}: #{@player_1.lives}/#{@total_lives} vs #{@player_2.name}: #{@player_2.lives}/#{@total_lives}"
  end

  def ask_question
    puts "#{@current_turn.player.name}: #{@current_turn.question.ask_question}"
  end

  def check_answer
    if @current_turn.question.check_answer(@input)
      puts "YES! You are correct"
    else
      puts "Seriously? No"
      @current_turn.player.update_lives(-1)
    end
  end

  def start_turn
    puts "----- NEW TURN -----"
    @current_turn = Turn.new(@turn_manager.current_player)
    self.ask_question
    @input = gets.chomp.to_i
    self.check_answer
    self.current_scores
  end

  def play_game
    while !self.game_finished?
      self.start_turn
      @current_turn = @turn_manager.rotate_players
    end
    if @player_1.lives > 0
      puts "#{@player_1.name} wins with a score of #{@player_1.lives}/#{@total_lives}"
    else
      puts "#{@player_2.name} wins with a score of #{@player_2.lives}/#{@total_lives}"
    end
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

end

my_game = Game.new(3)

my_game.play_game













