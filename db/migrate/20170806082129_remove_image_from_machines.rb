class RemoveImageFromMachines < ActiveRecord::Migration[5.1]
  def change
    remove_column :machines, :image, :string
  end
end
