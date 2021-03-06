Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show, :update]
  
 resources :topics do
  resources :bookmarks do
    resources :likes, only: [:create, :destroy]
end
end


  post :incoming, to: 'incoming#create' 
  # post :incoming, to: 'incoming#index' 
  # post "incoming/index"
  # get 'incoming/index'


  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

#   devise_scope :user do
#   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end

end
