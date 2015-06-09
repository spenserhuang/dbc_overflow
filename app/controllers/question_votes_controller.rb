class QuestionVotesController < ApplicationController
  def create
    @question_vote = QuestionVote.new(user_id: current_user.id, question_id: params[:question_id], vote: params[:vote])
    if !@question_vote.save
      p "You fucked up something! Check it out!"
    end
      redirect_to '/'
  end

  def destroy
    @question_vote = QuestionVote.find_by(user_id: current_user.id, question_id: params[:question_id])
    @question_vote.destroy
    redirect_to '/'
  end
end
