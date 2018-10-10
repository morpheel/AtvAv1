class RelatorioProfessorPdf <Prawn::Document
	def initialize(listaRecebida,view, layout)
		super(top_margin: 50, :page_layout => layout)
		imprimirTexto
		@listas = listaRecebida
		@view = view
	#	imprimirTexto
		imprimirTabela
	end

	def imprimirTexto
		text "Relatório de Professores", :align => :center, :size => 24, :style => :bold
		move_down 20
	end
	
	def listar
		@listas.map do |lista|
			[lista.id, lista.nome, lista.telefone, lista.endereco, lista.email]
		end
	end
	
	def imprimirTabela
		data = [["ID", "Nome", "Telefone", "Endereço", "Email"]]
		data += listar * 30
		#move_down 50
		table(data, :header => true, :position => :center, :column_widths => [50,200,85,185,165], 
			:cell_style => {:size => 10}, :row_colors => ["EEffff","FFFFFF"]) do
			row(0).font_style = :bold
			row(0).background_color = "DDffff"
		end
		
	end
end
