class AddAttachmentPictureToTeachers < ActiveRecord::Migration
  def self.up
    change_table :teachers do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :teachers, :picture
  end
end
