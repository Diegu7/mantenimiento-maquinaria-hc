class AddImageToMachines < ActiveRecord::Migration[5.1]
  def change
     add_column :machines, :image_url, :string
  end
end