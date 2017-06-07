require 'rails_helper'

RSpec.describe MachineSection, type: :model do
  let(:valid_machine_section) { build :machine_section }
  let(:machine_section_without_name) { build :machine_section, name: nil}

  it "is valid with name" do
    expect(valid_machine_section).to be_valid
  end
  
  it "is invalid without a name" do
    machine_section_without_name.valid?
    expect(machine_section_without_name.errors[:name]).to include("no puede estar en blanco")
  end  
end
