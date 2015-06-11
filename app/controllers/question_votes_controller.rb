class QuestionVotesController < ApplicationController
  def create
    user_upvote = QuestionVote.find_by(user_id: current_user.id, question_id: params[:question_id], vote: true)
    user_downvote = QuestionVote.find_by(user_id: current_user.id, question_id: params[:question_id], vote: false)

    if user_upvote
      user_upvote.destroy
      score = user_upvote.question.question_votes.where(vote: true).count - user_upvote.question.question_votes.where(vote: false).count
      render json: {user_upvote: user_upvote, score: score}
    elsif user_downvote
      user_downvote.destroy
      score = user_downvote.question.question_votes.where(vote: true).count - user_downvote.question.question_votes.where(vote: false).count
      render json: {user_downvote: user_downvote, score: score}
    else
      question_vote = QuestionVote.new(user_id: current_user.id, question_id: params[:question_id], vote: params[:vote])
      if !question_vote.save
        p "You fucked up something! Check it out!"
      end
      score = question_vote.question.question_votes.where(vote: true).count - question_vote.question.question_votes.where(vote: false).count
      render json: {question_vote: question_vote, score: score}
    end
  end
end
