class SoftwareProductsController < ApplicationController
  before_action :set_software_product, only: %i[ show edit update destroy ]

  # GET /software_product or /software_product.json
  def index
    if params[:search].present? 
      search_option = params[:search_option]
      if search_option == "id"
        @software_product = SoftwareProduct.find(params[:search].to_i)
      elsif search_option == "licence_number"
        @software_products = SoftwareProduct.where("#{search_option} LIKE ?", "%#{params[:search].upcase }%")
      else
        @software_products = SoftwareProduct.where("#{search_option} LIKE ?", "%#{params[:search].capitalize }%")
      end
    else
    @software_products = SoftwareProduct.all
    end
  end

  # GET /software_product/1 or /software_product/1.json
  def show
  end

  # GET /software_product/new
  def new
    @software_product = SoftwareProduct.new
  end

  # GET /software_product/1/edit
  def edit
  end

  # POST /software_product or /software_product.json
  def create
    @software_product = SoftwareProduct.new(software_product_params)

    respond_to do |format|
      if @software_product.save
        format.html { redirect_to software_product_url(@software_product), notice: "Software product was successfully created." }
        format.json { render :show, status: :created, location: @software_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @software_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /software_product/1 or /software_product/1.json
  def update
    respond_to do |format|
      if @software_product.update(software_product_params)
        format.html { redirect_to software_product_url(@software_product), notice: "Software product was successfully updated." }
        format.json { render :show, status: :ok, location: @software_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @software_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /software_product/1 or /software_product/1.json
  def destroy
    @software_product.destroy!

    respond_to do |format|
      format.html { redirect_to software_products_url, notice: "Software product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_software_product
      @software_product = SoftwareProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def software_product_params
      params.require(:software_product).permit(:status, :licence_exp_date, :name, :licence_number, :equipment_id)
    end
end
