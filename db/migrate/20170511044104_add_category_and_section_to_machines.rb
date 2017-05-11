class AddCategoryAndSectionToMachines < ActiveRecord::Migration[5.1]
  def change
    add_reference :machines, :machine_category, foreign_key: true
    add_reference :machines, :machine_section, foreign_key: true
  end
end
