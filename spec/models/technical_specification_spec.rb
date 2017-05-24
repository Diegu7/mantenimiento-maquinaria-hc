require 'rails_helper'

RSpec.describe TechnicalSpecification, type: :model do
  let(:valid_technical_specification) { build :technical_specification }
  let(:specification_without_key) { build :technical_specification, key: nil }
  let(:specification_without_value) { build :technical_specification, value: nil }
  let(:specification_without_machine) { build :technical_specification, machine: nil }

  it "is valid with key, value and machine" do
    expect(:valid_technical_specification).to be_valid
  end

  it "is invalid without a key" do
    specification_without_key.valid?
    expect(specification_without_key.errors[:key]).to include("can't be blank")
  end
  
  it "is invalid without a value" do
    specification_without_value.valid?
    expect(specification_without_value.errors[:value]).to include("can't be blank")
  end
  
  it "is invalid without a machine" do
    specification_without_machine.valid?
    expect(specification_without_machine.errors[:machine]).to include("can't be blank")
  end
end
