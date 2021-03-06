class Student < ActiveRecord::Base
  attr_accessor :image
  has_attached_file :image,:styles => { medium: "300x300>"}

  	 belongs_to :teacher

  	 has_one :address, :as => :addressable, :dependent => :destroy
	accepts_nested_attributes_for :address
	accepts_nested_attributes_for :teacher

	max_paginates_per 5

    validates :mail, uniqueness: true
 	validate  :mail_regex

 	validates :name, presence: true
 	#validates :name, uniqueness: true

 	 before_save :upt_username
 	 after_save :usr_username
  
  
  def upt_username
  	if(self.username==nil)
    self.username = self.mail		
    #self.password = self.fname + "password@1234"
  end 
end

def usr_username
    User.create(:email => "#{self.mail}", :password => "#{self.fname}"+ "password@1234", :role => "#{self.class}")
end


 #validates :username, presence: true


validates :DOB, presence: true
#, date: {on_or_after: :birth_date_first, on_or_before: :birth_date_last}


 def mail_regex
    if mail.present? and mail.match(/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.(?:[A-Z]{2}|in|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$ /)
    	#\A[^@]+@[^@]+\z
      errors.add :mail, "This is not a valid email format"
  
    end
  end


end





