require 'rails_helper'

RSpec.describe Machine, type: :model do
  let(:valid_machine) { build :machine }
  let(:machine_without_name) { build :machine, name: nil }
  let(:machine_without_image) { build :machine, image: nil }
  let(:machine_without_section) { build :machine, machine_section: nil }

  it 'is valid with a name and section' do
    expect(valid_machine).to be_valid
  end

  it 'is invalid without a name' do
    machine_without_name.valid?
    expect(machine_without_name.errors[:name]).to include("no puede estar en blanco")
  end

  it 'is invalid without a section' do
    machine_without_section.valid?
    expect(machine_without_section.errors[:machine_section]).to include("no puede estar en blanco")
  end

  it 'is valid without an image' do
    expect(machine_without_image).to be_valid
  end
end
