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
