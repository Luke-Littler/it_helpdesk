class PolyNotesController < ApplicationController
  before_action :set_poly_note, only: %i[ show edit update destroy ]

  # GET /polynotes or /polynotes.json
  def index
    @poly_notes = PolyNote.all
  end

  # GET /polynotes/1 or /polynotes/1.json
  def show
    @poly_notes = PolyNote.all
    @notable_type = params[:notable_type]
    @notable_id = params[:notable_id]
  end

  # GET /polynotes/new
  def new
    @poly_note = PolyNote.new
  end

  # GET /polynotes/1/edit
  def edit
  end

  # POST /polynotes or /polynotes.json
  def create
    @poly_note = PolyNote.new(poly_note_params)

    respond_to do |format|
      if @poly_note.save
        format.html { redirect_to problem_path(@poly_note.notable_id), notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @poly_note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poly_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polynotes/1 or /polynotes/1.json
  def update
    respond_to do |format|
      if @poly_note.update(poly_note_params)
        format.html { redirect_to problem_path(@poly_note.notable_id), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @poly_note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poly_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polynotes/1 or /polynotes/1.json
  def destroy
    @poly_note.destroy!

    respond_to do |format|
      format.html { redirect_to poly_notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poly_note
      @poly_note = PolyNote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def poly_note_params
      params.require(:poly_note).permit(:note, :notable_id, :notable_type, :user_id, :operator_id, :specialist_id)
    end
end
