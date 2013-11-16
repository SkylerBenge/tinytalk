Tinytalk::Application.routes.draw do



  get "headshot_demo/index"
  get "headshot_demo/show"

  post "headshot/capture" => 'headshot#capture', :as => :headshot_capture

  resources :pins
  resources :comments, only: [:create]

  devise_for :users

  root to: "home#signin"

  match "index", to: "home#index"

  put "/update", to: "home#update"

  resources :boards do
    resources :pins
    resources :text_pins
  end

end
