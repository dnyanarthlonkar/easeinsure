Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
  end

  get 'home/dashboard'

  resources :home
  root 'home#dashboard'
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :confirmations => "confirmations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do 
   get '/dashboard' => "dashboard#index", :as => :root
    resources :users do
     collection do 
       get :agent_list
       get :customer_list
      end
    end     
 end
  as :user do
      patch '/user/confirmation' => 'confirmations#update', :via => :patch, :as => :update_user_confirmation
  end
end
