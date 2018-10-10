Rails.application.routes.draw do
  get 'pages/index'
  devise_for :usuarios
  devise_scope :usuarios do
    get "login", :to => "devise/sessions#new"
    get "register", :to => "devise/registrations#new"
    get "settings", :to => "devise/registrations#edit"
    get "logout",   :to => "devise/sessions#destroy"

  end
  resources :funcionarios, :path=>"funcionarios" do
    collection do
      get "/relatorioExcel" => "funcionarios#relatorioExcel", :as => "relatorioExcel"
      get "/relatorioPDF" => "funcionarios#relatorioPDF", :as => "relatorioPDF"
    end
  end
  resources :avaliacaos
  resources :mat_turmas
  resources :turmas
  resources :horas
  resources :salas
  resources :alunos, :path=>"alunos" do
    collection do
      get "/relatorioExcel" => "alunos#relatorioExcel", :as => "relatorioExcel"
      get "/relatorioPDF" => "alunos#relatorioPDF", :as => "relatorioPDF"
    end
  end
  resources :disciplinas, :path=>"disciplinas" do
    collection do
      get "/relatorioExcel" => "disciplinas#relatorioExcel", :as => "relatorioExcel"
      get "/relatorioPDF" => "disciplinas#relatorioPDF", :as => "relatorioPDF"
    end
  end
  resources :professors, :path=>"professors" do
    collection do
      get "/relatorioExcel" => "professors#relatorioExcel", :as => "relatorioExcel"
      get "/relatorioPDF" => "professors#relatorioPDF", :as => "relatorioPDF"
    end
  end
  resources :relatorios
  root :to => 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
