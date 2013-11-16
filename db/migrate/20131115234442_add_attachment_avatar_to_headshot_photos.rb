class AddAttachmentAvatarToHeadshotPhotos < ActiveRecord::Migration
  def self.up
    change_table :headshot_photos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :headshot_photos, :avatar
  end
end
