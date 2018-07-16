class Turn
  attr_accessor :player, :question
  def initialize(player)
    @player = player
    @question = Question.new
  end
end