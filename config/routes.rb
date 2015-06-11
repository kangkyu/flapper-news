Rails.application.routes.draw do

  root 'angular#index'

  resources :posts do
    resources :comments do
      put '/upvote' => 'comments#upvote', on: :member
    end
    put '/upvote' => 'posts#upvote', on: :member
  end
end
