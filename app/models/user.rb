class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :question_votes
  has_many :answer_votes

  has_secure_password

  after_initialize :init

  def init
    self.reputation ||= 0
  end

end
