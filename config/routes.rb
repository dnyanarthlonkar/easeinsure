Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    get 'dashboard/index'
  end

  get 'home/dashboard'
  get "contact_us" => "home#contact_us"
  post "save_contact" => "home#save_contact"
  get "save_contact" => "home#contact_us"

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
    resources :insurance_companies   
    resources :insurance_types  
 end
  as :user do
      patch '/user/confirmation' => 'confirmations#update', :via => :patch, :as => :update_user_confirmation
  end
  DynamicRouter.load
end
