Rails.application.routes.draw do
  resources :avaliacaos
  resources :mat_turmas
  resources :turmas
  resources :horas
  resources :salas
  resources :alunos
  resources :disciplinas
  resources :professors, :path=>"professors" do
    collection do
      get "/relatorioExcel" => "professors#relatorioExcel", :as => "relatorioExcel"
      get "/relatorioPDF" => "professors#relatorioPDF", :as => "relatorioPDF"
    end
  end
  resources :relatorios
  root :to => 'professors#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
