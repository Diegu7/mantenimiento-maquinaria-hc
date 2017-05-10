require 'rails_helper'

RSpec.describe Machine, type: :model do
  it "is valid with a name, tipe and brand" do
    machine = Machine.new(
      name: Faker::Name.name,
      tipe: Faker::Team.name,
      brand: Faker::Team.sport)
    expect(machine).to be_valid
  end

  it "is invalid without a name" do
    machine = Machine.new(name: nil)
    machine.valid?
    expect(machine.errors[:name]).to include("can't be blank")
  end
  
  it "is invalid without a type" do
    machine = Machine.new(tipe: nil)
    machine.valid?
    expect(machine.errors[:tipe]).to include("can't be blank")
  end

  it "is invalid without a brand" do
    machine = Machine.new(brand: nil)
    machine.valid?
    expect(machine.errors[:brand]).to include("can't be blank")
  end

end
