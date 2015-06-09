class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to @question
    else
      p "The data did not save properly"
      redirect_to @question
    end
  end

  private

    def answer_params
      answer = {question_id: params[:question_id], content: params[:answer][:answer][:content], title: params[:answer][:answer][:title]}
    end
end
