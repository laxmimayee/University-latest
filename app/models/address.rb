class Address < ActiveRecord::Base
	belongs_to	:addressable, :polymorphic => true
	validates  :Pincode, length:{maximum: 6}

	#validates :bio, length: { maximum: 500 }
end
