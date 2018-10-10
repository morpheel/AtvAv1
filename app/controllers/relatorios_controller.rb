class RelatoriosController < ApplicationController
	before_action :authenticate_usuario!, only: [:index, :new]
end
