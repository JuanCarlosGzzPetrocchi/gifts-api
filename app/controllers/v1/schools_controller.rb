module V1
  class SchoolsController < ActionController::API
    before_action :find_school, only: %i[update destroy]
    rescue_from ActiveRecord::RecordNotFound, :with => :school_not_found

    def create
      school = School.new(permitted_params)
      if school.save
        render json: school, status: 200
      else
        render json: school.errors, status: 400
      end
    end

    def update  
      if @school.update(permitted_params)
        render json: { message: 'School updated'}, status: 200
      else
        render json: @school.errors, status: 400
      end
    end

    def destroy
      if @school.destroy
        render json: { message: 'School deleted'}, status: 200
      else
        render json: @school.errors, status: 400
      end
    end

    private

    def find_school
      @school = School.find(params[:id])
    end

    def permitted_params
      params.require(:school).permit(:name, :address)
    end

    def school_not_found
      render json: { error: "School not found"}, status: 400
    end
  end
end