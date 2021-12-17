Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'home#index'

  resources :invites do 
    collection do
      get '/verify', to: 'invites#verify'
    end 
  end

    namespace :api, defaults: {format: :json} do
    namespace :v1 do 
      resources :users do
        collection do
          post :signin
          post :signup
          get  :signout
          get  :get_user_remember_token
          get  :line_items_by_role
          post :change_roles
          get  :by_company
          get  :roles
          post :check_email
        end
      end
     
     resources :invites do 
        collection do 
          post :referal_email
        end
      end

    end                                                                         
  end
  

end
