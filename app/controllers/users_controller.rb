class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save

      @user.send_activation_email

      flash[:info] = "Please check your email to activate your account."

      redirect_to root_url

    else
      render 'new'
    end
  end


  def show
    @user = User.find(params[:id])
    # @microposts = @user.microposts.paginate(page: params[:page])
    @clues = Clue.all
    redirect_to root_url and return unless @user.activated?
    @response = current_user.responses.build if @user == current_user

  end

  def edit

  end

  def update

    if @user.update_attributes(user_params)

      flash[:success] = "Profile Updated"

      redirect_to @user

    else
      render 'edit'
    end

  end
  

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
    @teams  = Team.all
    @team = Team.create

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end






  private

    def user_params
      params.require(:user).permit(:name, :email, :phone, :team_id, :password, :password_confirmation)
    end


    # def logged_in_user
    #   unless logged_in?
    #     store_location
    #     flash[:danger] = "Please log in."
    #     redirect_to login_url
    #   end
    # end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end



end
