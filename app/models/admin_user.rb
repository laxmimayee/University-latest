class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

after_save :after_usercreate

def after_usercreate
User.create(:email => "#{self.email}", :password => "#{self.password}",  :role => "#{self.class}")
end


end
