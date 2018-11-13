class ApplicationController < ActionController::Base
    helper_method :usuario_actual

    def usuario_actual
        if session[:usuario_id]
            @usuario_actual ||= Usuario.find(session[:usuario_id])
        else
            @usuario_actual = nil
        end
    end
end
