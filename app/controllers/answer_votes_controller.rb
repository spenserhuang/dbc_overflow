class AnswerVotesController < ApplicationController
  def create
    user_upvote = AnswerVote.find_by(user_id: current_user.id, answer_id: params[:answer_id], vote: true)
    user_downvote = AnswerVote.find_by(user_id: current_user.id, answer_id: params[:answer_id], vote: false)

    if user_upvote
      user_upvote.destroy
      redirect_to "/questions/#{params[:question_id]}"
    elsif user_downvote
      user_downvote.destroy
      redirect_to "/questions/#{params[:question_id]}"
    else
      @answer_vote = AnswerVote.new(user_id: current_user.id, answer_id: params[:answer_id], vote: params[:vote])
      if !@answer_vote.save
        p "You fucked up something! Check it out!"
      end
      redirect_to "/questions/#{params[:question_id]}"
    end
  end

  def destroy
    @answer_vote = AnswerVote.find_by(user_id: current_user.id, answer_id: params[:answer_id])
    @answer_vote.destroy
    redirect_to "/questions/#{params[:question_id]}"
  end
end
