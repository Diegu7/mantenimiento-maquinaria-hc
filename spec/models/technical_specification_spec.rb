require 'rails_helper'

RSpec.describe TechnicalSpecification, type: :model do
  let(:valid_technical_specification) { build :technical_specification }
  let(:specification_without_key) { build :technical_specification, key: nil }
  let(:specification_without_value) { build :technical_specification, value: nil }
  let(:specification_without_machine) { build :technical_specification, machine: nil }

  it "is valid with key, value and machine" do
    expect(:valid_technical_specification).to be_valid
  end

end
