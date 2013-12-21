class ChangeGenderFormatTeachers < ActiveRecord::Migration
  def change
  	change_column :teachers, :gender,:string
  end
end
