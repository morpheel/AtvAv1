class DisciplinasController < ApplicationController
  before_action :set_disciplina, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!, only: [:index, :new]
  # GET /disciplinas
  # GET /disciplinas.json
  def index
    @disciplinas  = if params[:nome]
      Disciplina.where('nome LIKE ?', "%#{params[:nome]}%").order(:nome).page(params[:page])
    else
      Disciplina.order(:nome).page(params[:page])
    end
  end

  def relatorioExcel
    @disciplinas = Disciplina.all
      respond_to do |form|
        form.html
        form.xlsx {
          response.headers["Content-Disposition"] = "attachment; filename=\"relatorioDisciplinas.xlsx\""
        }
      end
  end
    def relatorioPDF
    @disciplinas = Disciplina.all
    respond_to do |format|
      format.pdf do
        pdf = RelatorioDisciplinaPdf.new(@disciplinas, view_context, :landscape)
        send_data pdf.render, filename: "relatorioDisciplinas.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /disciplinas/1
  # GET /disciplinas/1.json
  def show
  end

  # GET /disciplinas/new
  def new
    @disciplina = Disciplina.new
  end

  # GET /disciplinas/1/edit
  def edit
  end

  # POST /disciplinas
  # POST /disciplinas.json
  def create
    @disciplina = Disciplina.new(disciplina_params)

    respond_to do |format|
      if @disciplina.save
        format.html { redirect_to @disciplina, notice: 'Disciplina was successfully created.' }
        format.json { render :show, status: :created, location: @disciplina }
      else
        format.html { render :new }
        format.json { render json: @disciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplinas/1
  # PATCH/PUT /disciplinas/1.json
  def update
    respond_to do |format|
      if @disciplina.update(disciplina_params)
        format.html { redirect_to @disciplina, notice: 'Disciplina was successfully updated.' }
        format.json { render :show, status: :ok, location: @disciplina }
      else
        format.html { render :edit }
        format.json { render json: @disciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplinas/1
  # DELETE /disciplinas/1.json
  def destroy
    @disciplina.destroy
    respond_to do |format|
      format.html { redirect_to disciplinas_url, notice: 'Disciplina was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disciplina
      @disciplina = Disciplina.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disciplina_params
      params.require(:disciplina).permit(:nome, :cargaHoraria, :professor_id, :turma_id)
    end
end
