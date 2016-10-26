Rails.application.routes.draw do

  root  'items#index'
  get   '/items' => 'items#index', as: :items
  get   '/items/new' => 'items#new', as: :new_item
  post  '/items' => 'items#create'
  get   '/items/:id' => 'items#show', as: :item
  get   '/items/:id/edit' => 'items#edit', as: :edit_item
  patch '/items/:id' => 'items#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
