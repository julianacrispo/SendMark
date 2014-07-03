Rails.application.routes.draw do
  

  get 'topics/index'

  get 'bookmarks/index'

  post :incoming, to: 'incoming#create'
  get 'incoming/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

#   devise_scope :user do
#   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end

end
