Rails.application.routes.draw do
  post "/", to: "services#index"
  root "services#index"
  get "services/:id/koniec", to: "services#koniec", as: "koniec"
  get "/file_read", to: "services#file_read"
  get "/logowanie", to: "services#logowanie"
  get "/piaskownica", to: "services#piaskownica"
  post "/week_summary_email", to: "services#week_summary_email"
  resources :services
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
