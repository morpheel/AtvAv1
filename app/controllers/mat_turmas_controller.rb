class MatTurmasController < ApplicationController
  before_action :set_mat_turma, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!, only: [:index, :new]
  # GET /mat_turmas
  # GET /mat_turmas.json
  def index
    @mat_turmas = MatTurma.order(:turma_id).page(params[:page])
  end

  # GET /mat_turmas/1
  # GET /mat_turmas/1.json
  def show
  end

  # GET /mat_turmas/new
  def new
    @mat_turma = MatTurma.new
  end

  # GET /mat_turmas/1/edit
  def edit
  end

  # POST /mat_turmas
  # POST /mat_turmas.json
  def create
    @mat_turma = MatTurma.new(mat_turma_params)
    disciplinas = Disciplina.where("disciplinas.turma_id="+@mat_turma.turma_id.to_s)
    disciplinas.each do |disciplina|
      matriculadisc = @mat_turma.mat_discs.build
      matriculadisc.disciplina_id = disciplina.id
    end
    respond_to do |format|
      if @mat_turma.save
        format.html { redirect_to @mat_turma, notice: 'Mat turma was successfully created.' }
        format.json { render :show, status: :created, location: @mat_turma }
      else
        format.html { render :new }
        format.json { render json: @mat_turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mat_turmas/1
  # PATCH/PUT /mat_turmas/1.json
  def update
    respond_to do |format|
      if @mat_turma.update(mat_turma_params)
        format.html { redirect_to @mat_turma, notice: 'Mat turma was successfully updated.' }
        format.json { render :show, status: :ok, location: @mat_turma }
      else
        format.html { render :edit }
        format.json { render json: @mat_turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mat_turmas/1
  # DELETE /mat_turmas/1.json
  def destroy
    @mat_turma.destroy
    respond_to do |format|
      format.html { redirect_to mat_turmas_url, notice: 'Mat turma was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mat_turma
      @mat_turma = MatTurma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mat_turma_params
      params.require(:mat_turma).permit(:aluno_id, :turma_id, mat_disc_attributes: [:id, :disciplina_id, :_destroy])
    end
end
