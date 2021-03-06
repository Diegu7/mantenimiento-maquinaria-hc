require 'rails_helper'

RSpec.describe MaterialsForMaintenance, type: :model do
  let(:valid_material_for_maintenance) { build :materials_for_maintenance }
  let(:material_for_maintenance_without_valid_quantity) { build :materials_for_maintenance, used_quantity: -1  }
  let(:material_for_maintenance_without_programmed_maintenance) { build :materials_for_maintenance, programmed_maintenance: nil }
  let(:material_for_maintenance_without_product) { build :materials_for_maintenance, product: nil }

  it 'is valid with quantity, programamed maintenance and product' do
    expect(valid_material_for_maintenance).to be_valid
  end

  it 'is invalid with a quantity less than 0' do
    material_for_maintenance_without_valid_quantity.valid?
    expect(material_for_maintenance_without_valid_quantity.errors[:used_quantity]).to include("debe ser mayor que o igual a 0")
  end

  it 'is invalid without a programmed maintenance' do
    material_for_maintenance_without_programmed_maintenance.valid?
    expect(material_for_maintenance_without_programmed_maintenance.errors[:programmed_maintenance]).to include("debe existir")
  end

  it 'is invalid without a product' do
    material_for_maintenance_without_product.valid?
    expect(material_for_maintenance_without_product.errors[:product]).to include("debe existir")
  end
end
