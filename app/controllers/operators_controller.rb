class OperatorsController < ApplicationController
  before_action :set_operator, only: %i[ show edit update destroy ]

  # GET /operators or /operators.json
  def index
    if params[:search].present? 
      search_option = params[:search_option]
      if search_option == "id"
        @operator = Operator.find(params[:search].to_i)
      elsif search_option == "email"
        @operators = Operator.where("#{search_option} LIKE ?", "%#{params[:search]}%")
      else
        @operators = Operator.where("#{search_option} LIKE ?", "%#{params[:search].capitalize }%")
      end
    else
    @operators = Operator.all
    end
  end

  # GET /operators/1 or /operators/1.json
  def show
  end

  # GET /operators/new
  def new
    @operator = Operator.new
  end

  # GET /operators/1/edit
  def edit
  end

  # POST /operators or /operators.json
  def create
    @operator = Operator.new(operator_params)

    respond_to do |format|
      if @operator.save
        format.html { redirect_to operator_url(@operator), notice: "Operator was successfully created." }
        format.json { render :show, status: :created, location: @operator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operators/1 or /operators/1.json
  def update
    respond_to do |format|
      if @operator.update(operator_params)
        format.html { redirect_to operator_url(@operator), notice: "Operator was successfully updated." }
        format.json { render :show, status: :ok, location: @operator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operators/1 or /operators/1.json
  def destroy
    @operator.destroy!

    respond_to do |format|
      format.html { redirect_to operators_url, notice: "Operator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operator
      @operator = Operator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def operator_params
      params.require(:operator).permit(:name, :phone, :email, :problem_id)
    end
end
