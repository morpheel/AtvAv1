Rails.application.routes.draw do
  resources :mat_turmas
  resources :turmas
  resources :horas
  resources :salas
  resources :alunos
  resources :disciplinas
  resources :professors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
