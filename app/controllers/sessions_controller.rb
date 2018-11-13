class SessionsController < ApplicationController
  def new
  end

  def create
    u = Usuario.find_by_email(params[:email])
    if u && u.authenticate(params[:password])
      session[:usuario_id] = u.id
      redirect_to root_url, notice: "Logeado!"
    else
      flash.now[:alert] = "Correo o contraseña incorrecto@"
      render "new"
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_url, notice: "Desconectado!"
  end
end
