class Teacher < ActiveRecord::Base
	
	has_many :students, :dependent => :destroy
	attr_accessor :picture
  has_attached_file :picture,:styles => { medium: "300x300>"}

  has_one :address, :as => :addressable, :dependent => :destroy
	accepts_nested_attributes_for :address
	accepts_nested_attributes_for :students
    

	max_paginates_per 5
validates :name, presence: true
validates :mail, uniqueness: true
 validate  :mail_regex

 def mail_regex

 	 if mail.present? and mail.match(/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.(?:[A-Z]{2}|in|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$ /)
    	#\A[^@]+@[^@]+\z
      errors.add :mail, "This is not a valid email format"
  
    end
 end
	before_save :bsave

	def bsave
  	if(self.username==nil)
    self.username = self.mail		
    #self.password = self.fname + "password@1234"
  end 
end

	after_save :asave

	def asave
    User.create(:email => "#{self.mail}", :password => "#{self.fname}" + "password@1234", :role => "#{self.class}")
	end


end
