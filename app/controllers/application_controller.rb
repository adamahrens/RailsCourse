class ApplicationController < ActionController::Base
    include PublicActivity::StoreController
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    before_action :set_global_variables, if: :user_signed_in?

    def set_global_variables
        @ransack_courses = Track.ransack(params[:courses_search], search_key: :courses_search)
    end

    private

        def user_not_authorized
            flash[:alert] = "You are not authorized to perform this action."
            redirect_to(request.referrer || root_path)
        end
end
