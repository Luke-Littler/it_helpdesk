class ProblemsController < ApplicationController
  before_action :set_problem, only: %i[ show edit update destroy ]

  # GET /problems or /problems.json
  def index
    if params[:search] == "computer" && params[:search_option] == "problem_type"
      @problems = Problem.where(problem_type: "computer")
    elsif params[:search] == "network" && params[:search_option] == "problem_type"
      @problems = Problem.where(problem_type: "network")
    elsif params[:search] == "general" && params[:search_option] == "problem_type"
      @problems = Problem.where(problem_type: "general")
    elsif params[:search] == "mobile" && params[:search_option] == "problem_type"
      @problems = Problem.where(problem_type: "mobile")

    elsif params[:search].present? && params[:search_option] == "id" 
      search_option = params[:search_option]
        @problem = Problem.find(params[:search].to_i)
        if @problem.nil?
          flash[:notice] = "Problem not found"
        end
    else
    @problems = Problem.all
    end
  end

  # GET /problems/1 or /problems/1.json
  def show
    @problem = Problem.find(params[:id])
    @specialist = Specialist.find(@problem.specialist_id)
  end

  # GET /problems/new
  def new
    @problem = Problem.new
    @users = User.all
    @equipment = Equipment.all 
  end

  # GET /problems/1/edit
  def edit
    @users = User.all
  end

  # POST /problems or /problems.json
  def create
    @problem = Problem.new(problem_params)

    respond_to do |format|
      if @problem.save
        format.html { redirect_to problem_url(@problem), notice: "Problem was successfully created." }
        format.json { render :show, status: :created, location: @problem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  def resolve_problem
    @problem = Problem.find(params[:id])
    @problem.update!(status: 1)  

    redirect_to problem_path(@problem)
    flash[:success] = "Problem resolved!"
  end

  def assign_specialist
    @problem = Problem.find(params[:id])
    @specialist = Specialist.find(params[:specialist_id]) 
    @problem.update!(specialist_id: @specialist.id, status: 2)

    redirect_to problem_url(@problem)
    flash[:notice] = "Specialist assigned!"
  end

  # PATCH/PUT /problems/1 or /problems/1.json
  def update
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to problem_url(@problem), notice: "Problem was successfully updated." }
        format.json { render :show, status: :ok, location: @problem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1 or /problems/1.json
  def destroy
    @problem.destroy!

    respond_to do |format|
      format.html { redirect_to problems_url, notice: "Problem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = Problem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def problem_params
      params.require(:problem).permit(:problem_type, :problem_sub_type, :status, :user_id, :equipment_id, :operator_id, :notes_id, :specialist_id)
    end
end
