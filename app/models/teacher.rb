class Teacher < ActiveRecord::Base
	
	has_many :students, :dependent => :destroy
	attr_accessor :picture
  has_attached_file :picture,:styles => { medium: "300x300>"}

  has_one :address, :as => :addressable, :dependent => :destroy
	accepts_nested_attributes_for :address
	accepts_nested_attributes_for :students
validates :name, presence: true
	

end
