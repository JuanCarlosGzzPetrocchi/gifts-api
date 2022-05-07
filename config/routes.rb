Rails.application.routes.draw do
  namespace :v1 do 
    resources :schools, except: %i[index] do
      resources :recipients
      resources :orders do
        put :ship
      end
    end
  end
end
