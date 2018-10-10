class RelatorioDisciplinaPdf <Prawn::Document
	def initialize(listaRecebida,view, layout)
		super(top_margin: 50, :page_layout => layout)
		imprimirTexto
		@listas = listaRecebida
		@view = view
	#	imprimirTexto
		imprimirTabela
	end

	def imprimirTexto
		text "Relatório de Disciplinas", :align => :center, :size => 24, :style => :bold
		move_down 20
	end
	
	def listar
		@listas.map do |lista|
			[lista.id, lista.nome, lista.ch, lista.professor.nome, lista.turma.nome]
		end
	end
	
	def imprimirTabela
		data = [["ID", "Nome", "Carga Horária", "Professor", "Turma"]]
		data += listar * 30
		#move_down 50
		table(data, :header => true, :position => :center, :column_widths => [50,170,100,200,100], 
			:cell_style => {:size => 10}, :row_colors => ["EEffff","FFFFFF"]) do
			row(0).font_style = :bold
			row(0).background_color = "DDffff"
		end
		
	end
end
