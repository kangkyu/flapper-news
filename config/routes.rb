Rails.application.routes.draw do

  root 'angular#index'

  resources :posts, only: [:create, :index, :show] do
    resources :comments, only: [:show, :create] do
      put '/upvote' => 'comments#upvote', on: :member
    end
    put '/upvote' => 'posts#upvote', on: :member
  end
end
