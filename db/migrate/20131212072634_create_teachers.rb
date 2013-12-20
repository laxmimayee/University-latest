class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :fname
            t.string :phone
      t.boolean :gender
      t.string :expereince

      t.timestamps
    end
  end
end
