class Admin::UsersController < Admin::BaseController
  before_filter :find_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all(order: 'email')
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
      @user.update(user_params)
      if @user.save
        format.html { redirect_to [:admin, @user], notice: 'User added successfully.'}
      else
        format.html { render :new , notice: 'User could not be added.'}
      end
    end
  end

  private #---------------------------------------------------
  def find_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end
