class AvaliacaosController < ApplicationController
  before_action :set_avaliacao, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!, only: [:index, :new]
  # GET /avaliacaos
  # GET /avaliacaos.json
  def index
    @avaliacaos = Avaliacao.all
  end

  # GET /avaliacaos/1
  # GET /avaliacaos/1.json
  def show
    listaMatriculas = MatDisc.select("*")
    .joins("LEFT JOIN mat_turmas on mat_turmas.id = mat_discs.mat_turma_id")
    .joins("LEFT JOIN alunos on alunos.id = mat_turmas.aluno_id")
    .where("mat_discs.disciplina_id="+@avaliacao.disciplina_id.to_s)
    listaMatriculas.each do |matricula| #lista todos os alunos matriculados na disciplina e turma
      @avaliacao.provas.each do |prova| #todo que fizeram a prova
        if prova.mat_disc_id == matricula.id
          prova.aluno_nome = matricula.nome
        end
      end
    end
  end

  def relatorioExcel
    @avaliacao = Avaliacao.find(params[:ids])

    @listaMatriculas = MatDisc.select("*")
    .joins("LEFT JOIN mat_turmas on mat_turmas.id = mat_discs.mat_turma_id")
    .joins("LEFT JOIN alunos on alunos.id = mat_turmas.aluno_id")
    .where("mat_discs.disciplina_id="+@avaliacao.disciplina_id.to_s)
    @listaMatriculas.each do |matricula| 
      @avaliacao.provas.each do |prova|
        if prova.mat_disc_id == matricula.id
          prova.aluno_nome = matricula.nome
        end
      end
    end
    respond_to do |form|
      form.xlsx{
        response.headers['Content-Disposition'] = "attachmant; filename=\"relatorioNota.xlsx\""
      }
    end
  end

  # GET /avaliacaos/new
  def new
    @avaliacao = Avaliacao.new
  end

  def provas
    @avaliacao = Avaliacao.find(params[:id])
    listaMatriculas = MatDisc.select("*")
    .joins("LEFT JOIN mat_turmas on mat_turmas.id = mat_discs.mat_turma_id")
    .joins("LEFT JOIN alunos on alunos.id = mat_turmas.aluno_id")
    .where("mat_discs.disciplina_id="+@avaliacao.disciplina_id.to_s)
    listaMatriculas.each do |matricula| #lista todos os alunos matriculados na disciplina e turma
      matriculadoNaoProva = false #nao fez a prova
      @avaliacao.provas.each do |prova| #todo que fizeram a prova
        if prova.mat_disc_id == matricula.id
          matriculadoNaoProva = true #fez a prova
          prova.aluno_nome = matricula.nome
        end
      end
      if !matriculadoNaoProva #se nao fez entao lanca nota
        prova = @avaliacao.provas.build
        prova.mat_disc_id = matricula.id
        prova.aluno_nome = matricula.nome
        prova.nota = 0  
      end
    end  
  end

  # GET /avaliacaos/1/edit
  def edit
  end



  # POST /avaliacaos
  # POST /avaliacaos.json
  def create
    @avaliacao = Avaliacao.new(avaliacao_params)

    respond_to do |format|
      if @avaliacao.save
        format.html { redirect_to @avaliacao, notice: 'Avaliacao was successfully created.' }
        format.json { render :show, status: :created, location: @avaliacao }
      else
        format.html { render :new }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avaliacaos/1
  # PATCH/PUT /avaliacaos/1.json
  def update
    respond_to do |format|
      if @avaliacao.update(avaliacao_params)
        format.html { redirect_to @avaliacao, notice: 'Avaliacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @avaliacao }
      else
        format.html { render :edit }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliacaos/1
  # DELETE /avaliacaos/1.json
  def destroy
    @avaliacao.destroy
    respond_to do |format|
      format.html { redirect_to avaliacaos_url, notice: 'Avaliacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliacao
      @avaliacao = Avaliacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaliacao_params
      params.require(:avaliacao).permit(:descricao, :data, :disciplina_id, provas_attributes:[:id, :mat_disc_id, :nota, :_destroy])
    end
end
