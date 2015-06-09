Rails.application.routes.draw do

  resources :questions  do
    resources :question_votes
    resources :answers do
      resources :answer_votes
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  root 'questions#index'

end
