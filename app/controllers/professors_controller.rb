class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!, only: [:index, :new]
  # GET /professors
  # GET /professors.json
  def index
    @professors = if params[:nome]
      Professor.where('nome LIKE ?', "%#{params[:nome]}%").order(:nome).page(params[:page])
    else
      Professor.order(:nome).page(params[:page])
    end
  end
  def relatorioExcel
    @professors = Professor.all
      respond_to do |form|
        form.html
        form.xlsx {
          response.headers["Content-Disposition"] = "attachment; filename=\"relatorioProfessores.xlsx\""
        }
      end
  end
    def relatorioPDF
    @professors = Professor.all
    respond_to do |format|
      format.pdf do
        pdf = RelatorioProfessorPdf.new(@professors, view_context, :landscape)
        send_data pdf.render, filename: "relatorioProfessores.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end
  # GET /professors/1
  # GET /professors/1.json
  def show
  end

  # GET /professors/new
  def new
    @professor = Professor.new
  end

  # GET /professors/1/edit
  def edit
  end

  # POST /professors
  # POST /professors.json
  def create
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'Professor was successfully created.' }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professors/1
  # PATCH/PUT /professors/1.json
  def update
    respond_to do |format|
      if @professor.update(professor_params)
        format.html { redirect_to @professor, notice: 'Professor was successfully updated.' }
        format.json { render :show, status: :ok, location: @professor }
      else
        format.html { render :edit }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.json
  def destroy
    @professor.destroy
    respond_to do |format|
      format.html { redirect_to professors_url, notice: 'Professor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:nome, :email, :telefone, :endereco)
    end
end
