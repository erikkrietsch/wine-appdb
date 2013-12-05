class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :confirmable, :recoverable, :rememberable, :trackable, 
         :validatable
  def create 
    User.create(user_params)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :token)
    end
end
