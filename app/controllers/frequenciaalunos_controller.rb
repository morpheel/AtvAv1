class FrequenciaalunosController < ApplicationController
  before_action :set_frequenciaaluno, only: [:show, :edit, :update, :destroy]

  # GET /frequenciaalunos
  # GET /frequenciaalunos.json
  def index
    @frequenciaalunos = Frequenciaaluno.order(:disciplina_id).page(params[:page])
  end

  # GET /frequenciaalunos/1
  # GET /frequenciaalunos/1.json
  def show
    listaAlunoDisciplina = MatDisc.select("*")
    .joins("LEFT JOIN mat_turmas on mat_turmas.id = mat_discs.mat_turma_id")
    .joins("LEFT JOIN alunos on alunos.id = mat_turmas.aluno_id")
    .where("mat_discs.disciplina_id="+@frequenciaaluno.disciplina_id.to_s)
    listaAlunoDisciplina.each do |matricula| 
      @frequenciaaluno.presencas.each do |presenca|
        if presenca.mat_disc_id == matricula.id
          presenca.aluno_nome = matricula.nome
        end
      end
    end
  end

  def relatorioExcel
    @frequenciaaluno = Frequenciaaluno.find(params[:ids])

    @listaAlunoDisciplina = MatDisc.select("*")
    .joins("LEFT JOIN mat_turmas on mat_turmas.id = mat_discs.mat_turma_id")
    .joins("LEFT JOIN alunos on alunos.id = mat_turmas.aluno_id")
    .where("mat_discs.disciplina_id="+@frequenciaaluno.disciplina_id.to_s)
    @listaAlunoDisciplina.each do |matricula| 
      @frequenciaaluno.presencas.each do |presenca|
        if presenca.mat_disc_id == matricula.id
          presenca.aluno_nome = matricula.nome
        end
      end
    end
    respond_to do |form|
      form.xlsx{
        response.headers['Content-Disposition'] = "attachmant; filename=\"relatorioPresenca.xlsx\""
      }
    end
  end

  # GET /frequenciaalunos/new
  def new
    @frequenciaaluno = Frequenciaaluno.new
  end

  # GET /frequenciaalunos/1/edit
  def edit
  end

  def presencas
    @frequenciaaluno = Frequenciaaluno.find(params[:id])
     puts "eae"
    listaAlunosDisciplina = MatDisc.select("*")
    .joins("LEFT JOIN mat_turmas on mat_turmas.id = mat_discs.mat_turma_id")
    .joins("LEFT JOIN alunos on alunos.id = mat_turmas.aluno_id")
    .where("mat_discs.disciplina_id="+@frequenciaaluno.disciplina_id.to_s)
    listaAlunosDisciplina.each do |matricula| 
      matriculadoNaoPresente = false 
      @frequenciaaluno.presencas.each do |presenca| 
        if presenca.mat_disc_id == matricula.id
          matriculadoNaoPresente = true 
          presenca.aluno_nome = matricula.nome
        end
      end
      if !matriculadoNaoPresente
        presenca = @frequenciaaluno.presencas.build
        presenca.mat_disc_id = matricula.id
        presenca.aluno_nome = matricula.nome
        presenca.presenca = false 
      end
    end
  end  

  # POST /frequenciaalunos
  # POST /frequenciaalunos.json
  def create
    @frequenciaaluno = Frequenciaaluno.new(frequenciaaluno_params)

    respond_to do |format|
      if @frequenciaaluno.save
        format.html { redirect_to @frequenciaaluno, notice: 'Frequenciaaluno was successfully created.' }
        format.json { render :show, status: :created, location: @frequenciaaluno }
      else
        format.html { render :new }
        format.json { render json: @frequenciaaluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frequenciaalunos/1
  # PATCH/PUT /frequenciaalunos/1.json
  def update
    respond_to do |format|
      if @frequenciaaluno.update(frequenciaaluno_params)
        format.html { redirect_to @frequenciaaluno, notice: 'Frequenciaaluno was successfully updated.' }
        format.json { render :show, status: :ok, location: @frequenciaaluno }
      else
        format.html { render :edit }
        format.json { render json: @frequenciaaluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frequenciaalunos/1
  # DELETE /frequenciaalunos/1.json
  def destroy
    @frequenciaaluno.destroy
    respond_to do |format|
      format.html { redirect_to frequenciaalunos_url, notice: 'Frequenciaaluno was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frequenciaaluno
      @frequenciaaluno = Frequenciaaluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def frequenciaaluno_params
      params.require(:frequenciaaluno).permit(:data, :disciplina_id, presencas_attributes: [:id, :mat_disc_id, :presenca, :_destroy])
    end
end
