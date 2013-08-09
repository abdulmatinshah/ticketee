class Admin::UsersController < Admin::BaseController
  before_filter :find_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all(order: 'email')
  end
  def show
  end
  def new
    @user = User.new
  end
  def create
    respond_to do |format|
      @user = User.new(user_params)
      if @user.save
        format.html { redirect_to [:admin, @user], notice: 'User added successfully.'}
      else
        format.html { render :new , notice: 'User could not be added.'}
      end
    end
  end
  def edit
  end
  def update
    respond_to do |format|
      
      
      if @user.update(user_params)
        format.html { redirect_to [:admin, @user], notice: 'User added successfully.'}
      else
        format.html { render :new , notice: 'User could not be added.'}
      end
    end
  end
  def destroy
    if @user.id == current_user
      redirect_to admin_users_path, alert: "Can't delete you by yourself."
    else
      redirect_to admin_users_path, alert: "user deleted successfully."
    end 
  end
  private #---------------------------------------------------
  def find_user
    @user = User.find(params[:id])
  end
  def user_params
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    params[:user][:admin].blank? ? false : true
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
end
