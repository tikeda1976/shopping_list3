class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.find(params[:id])
    # => GET app/views/users/show.html.erb
  end

  # GET /users/new
  def new
    @user = User.new
    # render 'new'
    # => GET app/views/users/new.html.erb
  end

  # POST /users
  def create
    # params => user => user.save => if ... else ... end
    @user = User.new(user_params)    # 実装は終わっていないことに注意!
    if @user.save
      # => Success
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # => GET /users/:id
    else
      # => Failure
      render 'new', status: :unprocessable_entity
    end
  end

  private

    # Strong parameters
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end
end
