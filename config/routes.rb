require 'resque/server'

Rails.application.routes.draw do

  mount Resque::Server.new, at: "/resque"

	namespace :api do
		namespace :v1 do
			get 'home' , to: 'posts#home'
			post 'users/sign_in' , to: 'users#sign_in'
      post 'posts/create', to: 'posts#create'
		end
		namespace :v2 do
			get 'home' , to: 'posts#home'
		end
	end

  resources :friendships

  get 'users/profile/:id', to: 'users#profile'
  post 'users/upload_avatar/:id', to: 'users#upload_avatar', as: :user_avatar_upload

  post 'likes/toggle/:post_id', to: 'likes#toggle', as: 'toggle_like'
  post 'likes/togglec/:comment_id', to: 'likes#togglec', as: 'togglec_like'

  post 'comments/create', as: 'comments'
  delete 'comments/:id', to: 'comments#destroy', as: 'destroy_comment'

  root 'posts#home'
  get 'posts/home' , to: 'posts#home'
  post 'posts/create', as: 'posts'
  delete 'posts/:id', to: 'posts#destroy', as:'destroy_post'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
