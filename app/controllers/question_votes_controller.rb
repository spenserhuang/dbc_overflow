class QuestionVotesController < ApplicationController
  def create
    user_upvote = QuestionVote.find_by(user_id: current_user.id, question_id: params[:question_id], vote: true)
    user_downvote = QuestionVote.find_by(user_id: current_user.id, question_id: params[:question_id], vote: false)

    if user_upvote
      user_upvote.destroy
      redirect_to root_path
    elsif user_downvote
      user_downvote.destroy
      redirect_to root_path
    else
      @question_vote = QuestionVote.new(user_id: current_user.id, question_id: params[:question_id], vote: params[:vote])
      if !@question_vote.save
        p "You fucked up something! Check it out!"
      end
      redirect_to '/'
    end
  end
end
