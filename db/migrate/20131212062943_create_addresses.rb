class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :Dist
      t.string :City
      t.integer :Pincode
      t.text :Descrption

      t.timestamps
    end
  end
end
