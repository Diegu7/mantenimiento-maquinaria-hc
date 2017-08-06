class AddAttachmentImageToMachines < ActiveRecord::Migration[4.2]
  def self.up
    change_table :machines do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :machines, :image
  end
end
