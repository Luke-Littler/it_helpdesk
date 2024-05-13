class EquipmentController < ApplicationController
  before_action :set_equipment, only: %i[ show edit update destroy ]

  # GET /equipment or /equipment.json
  def index
    if params[:search].present? 
      search_option = params[:search_option]
      if search_option == "id"
        @equipment = Equipment.find(params[:search].to_i)
      elsif search_option == "serial_number"
        @equipments = Equipment.where("#{search_option} LIKE ?", "%#{params[:search].upcase }%")
      elsif search_option == "model"
        @equipments = Equipment.where("#{search_option} LIKE ?", "%#{params[:search]}%")
      else
        @equipments = Equipment.where("#{search_option} LIKE ?", "%#{params[:search].capitalize }%")
      end
    else
    @equipments = Equipment.all
    end
  end

  # GET /equipment/1 or /equipment/1.json
  def show
  end

  # GET /equipment/new
  def new
    @equipment = Equipment.new
  end

  # GET /equipment/1/edit
  def edit
  end

  # POST /equipment or /equipment.json
  def create
    @equipment = Equipment.new(equipment_params)

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to equipment_url(@equipment), notice: "Equipment was successfully created." }
        format.json { render :show, status: :created, location: @equipment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment/1 or /equipment/1.json
  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to equipment_url(@equipment), notice: "Equipment was successfully updated." }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1 or /equipment/1.json
  def destroy
    @equipment.destroy!

    respond_to do |format|
      format.html { redirect_to equipment_index_url, notice: "Equipment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def new_equipment_software_product
    @equipment = Equipment.find(params[:id])
    @software_products = SoftwareProduct.all
  end

  def equipment_software_product
    @equipment = Equipment.find(params[:id])

    EquipmentSoftwareProduct.create(equipment_id: @equipment.id, software_product_id: params[:software_product_id])

    redirect_to equipment_url(@equipment)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipment_params
      params.require(:equipment).permit(:serial_number, :make, :model, :problem_id, :software_product_id)
    end
end
