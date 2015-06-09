class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question_vote = QuestionVote.find_by(user_id: params[:user_id], question_id: params[:question_id])
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answer.question_id = @question.id
  end

  def new
    @question = Question.new
  end

  def create

    @question = Question.new(question_params)

    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update_attributes(question_params)
    redirect_to question
  end

  private

    def question_params
      params.require(:question).permit(:title, :content, :user_id)
    end

end
