class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logueado Correctamente"
    else
      flash.now[:notice] = 'E-mail o Password inválido'
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
