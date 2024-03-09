class DetailsController < ApplicationController
  before_action :set_person
  before_action :set_detail, only: [:show, :update, :destroy]

  # GET /people/:person_id/details
  def index
    @details = @person.details
    render json: @details
  end

  # GET /people/:person_id/details/1
  def show
    render json: @detail
  end

  # POST /people/:person_id/details
  def create
    @detail = @person.details.new(detail_params)

    if @detail.save
      render json: @detail, status: :created, location: person_detail_url(@person, @detail)
    else
      render json: @detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/:person_id/details/1
  def update
    if @detail.update(detail_params)
      render json: @detail
    else
      render json: @detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/:person_id/details/1
  def destroy
    @detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:person_id])
    end

    def set_detail
      @detail = @person.details.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def detail_params
      params.require(:detail).permit!
    end
end
