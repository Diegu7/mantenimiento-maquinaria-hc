require 'rails_helper'

RSpec.describe Machine, type: :model do 
  let(:valid_machine) { create :machine }
  let(:machine_without_name) { create :machine, name: nil }
  let(:machine_without_section) { create :machine, machine_section: nil }

  it "is valid with a name and section" do  
    expect(valid_machine).to be_valid
  end

  it "is invalid without a name" do
    machine_without_name.valid?
    expect(machine_without_name.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a section" do
    machine_without_section.valid?
    expect(machine_without_section.errors[:machine_section]).to include("can't be blank")
  end

end
