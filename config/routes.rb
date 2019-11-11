Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks, only: %i[create destroy update]
      post '/tasks/:id', to: 'tasks#complete', as: 'complete'
      resources :lists, only: %i[index create destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
