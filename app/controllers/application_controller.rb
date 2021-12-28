class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action:set_locale

    def set_current_user
        if session[:user_id]
            Current.user =User.find_by(id: session[:user_id])
        end
    end

    def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    end 

    def default_url_options(options={})
    { locale: I18n.locale }
end
end
