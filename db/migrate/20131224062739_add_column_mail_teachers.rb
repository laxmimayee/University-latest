class AddColumnMailTeachers < ActiveRecord::Migration
  def change
  	add_column :teachers, :mail,:string
  end
end
