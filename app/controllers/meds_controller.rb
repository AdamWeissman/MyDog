class MedsController < ApplicationController
  before_action :set_med, only: [:show, :edit, :update, :destroy]

  # GET /meds
  def index
    @meds = Med.all
  end

  # GET /meds/1
  def show
  end

  # GET /meds/new
  def new
    @med = Med.new
  end

  # GET /meds/1/edit
  def edit
  end

  # POST /meds
  def create
    @med = Med.new(med_params)

    if @med.save
      redirect_to @med, notice: 'Med was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /meds/1
  def update
    if @med.update(med_params)
      redirect_to @med, notice: 'Med was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /meds/1
  def destroy
    @med.destroy
    redirect_to meds_url, notice: 'Med was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_med
      @med = Med.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def med_params
      params.require(:med).permit(:name, :dose, :instructions, :pet_id)
    end
end