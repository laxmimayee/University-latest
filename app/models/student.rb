class Student < ActiveRecord::Base
  attr_accessor :image
  has_attached_file :image,:styles => { medium: "300x300>"}


  	 has_one :address, :as => :addressable, :dependent => :destroy
	accepts_nested_attributes_for :address

	max_paginates_per 5

    validates :mail, uniqueness: true
 	 validate  :mail_regex

 	validates :name, presence: true

 	# after_save :asave
  
  # def asave
  #   redirect_to "/admin/students/new"
  # end 



 def mail_regex
    if mail.present? and mail.match(/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.(?:[A-Z]{2}|in|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$ /)
    	#\A[^@]+@[^@]+\z
      errors.add :mail, "This is not a valid email format"
    end
  end


end





