class RelatorioAlunoPdf <Prawn::Document
	def initialize(listaRecebida,view, layout)
		super(top_margin: 50, :page_layout => layout)
		imprimirTexto
		@listas = listaRecebida
		@view = view
	#	imprimirTexto
		imprimirTabela
	end

	def imprimirTexto
		text "Relatório de Alunos", :align => :center, :size => 24, :style => :bold
		move_down 20
	end
	
	def listar
		@listas.map do |lista|
			[lista.id, lista.nome, lista.dataNasc, lista.endereco]
		end
	end
	
	def imprimirTabela
		data = [["ID", "Nome", "Data de Nascimento", "Endereço"]]
		data += listar * 30
		#move_down 50
		table(data, :header => true, :position => :center, :column_widths => [50,200,100,200], 
			:cell_style => {:size => 10}, :row_colors => ["EEffff","FFFFFF"]) do
			row(0).font_style = :bold
			row(0).background_color = "DDffff"
		end
		
	end
end
