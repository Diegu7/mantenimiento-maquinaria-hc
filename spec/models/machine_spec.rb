require 'rails_helper'

RSpec.describe Machine, type: :model do
  it "is valid with a name, category and section" do
    machine = Machine.new(
      name: Faker::Name.name,
      machine_category: Faker::Team.name,
      machine_section: Faker::Team.sport)
    expect(machine).to be_valid
  end

  it "is invalid without a name" do
    machine = Machine.new(name: nil)
    machine.valid?
    expect(machine.errors[:name]).to include("can't be blank")
  end
  
  it "is invalid without a category" do
    machine = Machine.new(machine_category: nil)
    machine.valid?
    expect(machine.errors[:machine_category]).to include("can't be blank")
  end

  it "is invalid without a section" do
    machine = Machine.new(machine_section: nil)
    machine.valid?
    expect(machine.errors[:machine_section]).to include("can't be blank")
  end

end
