Rails.application.routes.draw do

  resources :questions  do
    resources :question_votes
    resources :answers do
      resources :answer_votes
    end
  end

  root 'questions#index'

end
