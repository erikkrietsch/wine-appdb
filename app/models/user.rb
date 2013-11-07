class User < ActiveRecord::Base
  def create 
    User.create(user_params)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :token, :password)
    end
end
