class ApplicationController < ActionController::Base
    before_action :authenticate_account!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        added_attrs = [:remember_me, :role, :user_id, :operator_id, :specialist_id]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
