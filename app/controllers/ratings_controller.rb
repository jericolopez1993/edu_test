class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  def create
    @rating = Rating.new(rating_params)
    @professor = Professor.find(@rating.professor_id)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @professor, notice: 'Rating was successfully submitted.' }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rating
    @rating = Rating.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rating_params
    params.require(:rating).permit(:professor_id, :rating)
  end
end