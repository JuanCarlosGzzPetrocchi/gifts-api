# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :v1 do
    resources :schools, except: %i[index] do
      resources :recipients
      resources :orders, param: :order_id, except: %i[destroy]
      # separate orders actions so that all actions receive an order's id as params[:order_id] instead of params[:id]
      resources :orders, only: [] do
        patch :ship
        patch :cancel
      end
    end
    resources :gifts, only: %i[index]
  end
end
