
class Question
  def initialize()
    @first_number = rand(11)
    @second_number =rand(11)
    @operator = [:+,:-][rand(2)]
    @question = "#{@first_number} #{@operator} #{@second_number}"
    @correct_answer = @first_number.send(@operator, @second_number)
  end 

  attr_accessor :question, :correct_answer
end