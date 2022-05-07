# frozen_string_literal: true

module V1
  class SchoolsController < ActionController::API
    before_action :find_school, only: %i[update destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :school_not_found

    def create
      school = School.new(permitted_params)
      if school.save
        render json: school, status: 200, serializer: SchoolsSerializer
      else
        render json: { errors: school.errors }, status: 400
      end
    end

    def update
      if @school.update(permitted_params)
        render json: @school, status: 200, serializer: SchoolsSerializer
      else
        render json: { errors: @school.errors }, status: 400
      end
    end

    def destroy
      if @school.destroy
        render json: { message: I18n.t('.schools_controller.school_deleted') }, status: 200
      else
        render json: { errors: @school.errors }, status: 400
      end
    end

    private

    def find_school
      @school = School.find(params[:id])
    end

    def permitted_params
      params.permit(:name, :address)
    end

    def school_not_found
      render json: { error: I18n.t('.schools_controller.school_not_found') }, status: 400
    end
  end
end
