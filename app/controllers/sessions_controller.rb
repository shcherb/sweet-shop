class SessionsController < ApplicationController
#  def new
#  end

  def create
    user = User.find_by_email(params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      flash[:success] = "Welcome to the Sample App!"
    else
      # Create an error message and re-render the signin form.
      flash[:error] = 'Invalid email/password combination' # Not quite right!
    end
    redirect_to services_path
  end

  def destroy
    sign_out
    redirect_to services_path
  end

  private

  def session_params
    params[:sessions]
  end
end
