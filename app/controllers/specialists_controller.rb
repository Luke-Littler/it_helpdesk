class SpecialistsController < ApplicationController
  before_action :set_specialist, only: %i[ show edit update destroy ]

  # GET /specialists or /specialists.json
  def index
    
    if params[:search].present? 
      search_option = params[:search_option]
      if search_option == "id"
        @specialist = Specialist.find(params[:search].to_i)
      elsif search_option == "email"
        @specialists = Specialist.where("#{search_option} LIKE ?", "%#{params[:search]}%")
      else
        @specialists = Specialist.where("#{search_option} LIKE ?", "%#{params[:search].capitalize }%")
      end
    else
    @specialists = Specialist.all
    end
  end

  # GET /specialists/1 or /specialists/1.json
  def show
  end

  # GET /specialists/new
  def new
    @specialist = Specialist.new
  end

  # GET /specialists/1/edit
  def edit
  end

  # POST /specialists or /specialists.json
  def create
    @specialist = Specialist.new(specialist_params)

    respond_to do |format|
      if @specialist.save
        format.html { redirect_to specialist_url(@specialist), notice: "Specialist was successfully created." }
        format.json { render :show, status: :created, location: @specialist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @specialist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialists/1 or /specialists/1.json
  def update
    respond_to do |format|
      if @specialist.update(specialist_params)
        format.html { redirect_to specialist_url(@specialist), notice: "Specialist was successfully updated." }
        format.json { render :show, status: :ok, location: @specialist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @specialist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialists/1 or /specialists/1.json
  def destroy
    @specialist.destroy!

    respond_to do |format|
      format.html { redirect_to specialists_url, notice: "Specialist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialist
      @specialist = Specialist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def specialist_params
      params.require(:specialist).permit(:name, :phone, :email, :specialist_type, :specialist_sub_type, :problem_id)
    end
end
