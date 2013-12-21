class AddColumnDobExpTeachers < ActiveRecord::Migration
  def change
  	add_column :teachers, :DOB, :Date
  	add_column :teachers, :exp, :integer
  end
end
