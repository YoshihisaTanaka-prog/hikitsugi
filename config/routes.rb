Rails.application.routes.draw do
  resources :chats, except: [:edit, :update]
  resources :testbooks
  resources :mains
  resources :prefectures
  resources :aria
  resources :schools
  resources :students
  devise_for :teachers

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'teachers', to: 'teachers#index'
  get 'teachers/:id', to: 'teachers#show'
  patch "teacher/:id", to: "teachers#authentication", as: "teacher"
  post "search_teacher", to: "tops#search_teacher"
  post "ask_approve", to: "tops#ask_approve"
  get "update_grade", to: "tops#update_grade"
  get "chats/new/:teacher_id", to: "chats#new"

  # Defines the root path route ("/")
  # root "articles#index"
  root 'tops#index'
end
