Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

 resources :topics do
  resources :bookmarks do
    resources :likes, only: [:create, :destroy]
end
end


  post :incoming, to: 'incoming#create' 
  get 'incoming/index'

  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

#   devise_scope :user do
#   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end

end
