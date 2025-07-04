class SessionsController < BaseController
  layout false

  before_action :redirect_if_authenticated, only: :new

  def new;end

  def create
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      session[:user_id] = user.id
      p "admin? #{user.admin?}"
      redirect_to admin_root_path and return if user.admin?
      redirect_to root_path, notice: "Login successful!"
    else
      flash.now[:alert] = "Invalid credentials"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    path = current_user.admin? ? login_path : root_path
    session[:user_id] = nil

    redirect_to path, notice: "Logout successful!"
  end

  private

    def redirect_if_authenticated
      if session[:user_id]
        redirect_to admin_root_path
      end
    end
end