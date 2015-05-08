class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_tokens
  def generate_api_token
   token = SecureRandom.hex(32)
   5.times do
     user_token = UserToken.find_by_auth_token(token)
     break if user_token.blank?
   end
   user_tokens.create(:auth_token => token)

   token
 end 
end
