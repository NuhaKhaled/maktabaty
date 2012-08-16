class AddAttachmentPhotoToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :books, :photo
  end
end
