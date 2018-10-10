class TurmasController < ApplicationController
  before_action :set_turma, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!, only: [:index, :new]
  # GET /turmas
  # GET /turmas.json
  def index
    @turmas = if params[:nome]
      Turma.where('nome LIKE ?', "%#{params[:nome]}%").order(:nome).page(params[:page])
    else
      Turma.order(:nome).page(params[:page])
    end
  end

  # GET /turmas/1
  # GET /turmas/1.json
  def show
    
  end

  # GET /turmas/new
  def new
    @turma = Turma.new
    @disciplina = @turma.disciplinas.build
  end

  # GET /turmas/1/edit
  def edit
  end

  # POST /turmas
  # POST /turmas.json
  def create
    @turma = Turma.new(turma_params)

    respond_to do |format|
      if @turma.save
        format.html { redirect_to @turma, notice: 'Turma foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @turma }
      else
        format.html { render :new }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turmas/1
  # PATCH/PUT /turmas/1.json
  def update
    respond_to do |format|
      if @turma.update(turma_params)
        format.html { redirect_to @turma, notice: 'Turma foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @turma }
      else
        format.html { render :edit }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turmas/1
  # DELETE /turmas/1.json
  def destroy
    @turma.destroy
    respond_to do |format|
      format.html { redirect_to turmas_url, notice: 'Turma foi removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turma
      @turma = Turma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turma_params
      params.require(:turma).permit(:sala_id,:hora_id, :nome, disciplina_attributes:[:disciplina_id, :disciplina_nome, :_destroy])
    end
end
