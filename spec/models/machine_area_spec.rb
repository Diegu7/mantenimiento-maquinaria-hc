require 'rails_helper'

RSpec.describe MachineArea, type: :model do
  let(:valid_machine_area) { build :machine_area }
  let(:machine_area_without_name) { build :machine_area, name: nil}

  it "is valid with name" do
    expect(valid_machine_area).to be_valid
  end
  
  it "is invalid without a name" do
    machine_area_without_name.valid?
    expect(machine_area_without_name.errors[:name]).to include("can't be blank")
  end  
end
