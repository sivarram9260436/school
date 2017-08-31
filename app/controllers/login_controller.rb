class LoginController < ApplicationController
  layout false


  def login
    redirect_to :action => "index", :controller => "home"  if session[:user_id]
  end

  def check
    @user=Staff.where(:email_id => params[:email], :password => params[:password])
    if !(@user.blank?)
      session[:user_id] = @user.last.id
      session[:division_id] = @user.last.division_id
      redirect_to :action => "index", :controller => "home"
    else
      redirect_to root_path
    end
  end

  def sign_out
    session[:user_id] = nil
    session[:division_id] = nil
    reset_session
    redirect_to root_path
  end

end