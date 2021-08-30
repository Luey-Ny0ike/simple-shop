module Api::V1
  class RegionsController < ApplicationController
    before_action :set_region, only: %i[ show update destroy ]
    protect_from_forgery with: :null_session

    # GET /regions
    # GET /regions.json
    def index
      @regions = Region.all
    end

    # GET /regions/1
    # GET /regions/1.json
    def show
    end

    # POST /regions
    # POST /regions.json
    def create
      @region = Region.new(region_params)

      if @region.save
        render :show, status: :created
      else
        render json: @region.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /regions/1
    # PATCH/PUT /regions/1.json
    def update
      if @region.update(region_params)
        render :show, status: :ok
      else
        render json: @region.errors, status: :unprocessable_entity
      end
    end

    # DELETE /regions/1
    # DELETE /regions/1.json
    def destroy
      @region.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_region
        @region = Region.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def region_params
        params.require(:region).permit(:title, :country_details, :tax_details, :currency_details)
      end
  end
end
