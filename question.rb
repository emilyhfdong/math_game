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