require 'rails_helper'

RSpec.describe MileageLog, type: :model do
  let(:valid_mileage_log) { build :mileage_log }
  let(:mileage_without_date) { build :mileage_log, date: nil}
  let(:mileage_without_valid_hours) { build :mileage_log, hours: -1 }
  let(:mileage_without_valid_hours_0) { build :mileage_log, hours: 0 }
  let(:mileage_without_machine) { build :mileage_log, machine: nil}

  it "is valid with a date, hours and a machine" do
    expect(valid_mileage_log).to be_valid
  end
  
  it "is invalid without a date" do
    mileage_without_date.valid?
    expect(mileage_without_date.errors[:date]).to include("no puede estar en blanco")
  end
  
  it "is invalid with an hours value less than 0" do
    mileage_without_valid_hours.valid?
    expect(mileage_without_valid_hours.errors[:hours]).to include("must be greater than 0")
  end

  it "is invalid with an hours value equal to 0" do
    mileage_without_valid_hours_0.valid?
    expect(mileage_without_valid_hours_0.errors[:hours]).to include("must be greater than 0")
  end

  it "is invalid without a machine" do
    mileage_without_machine.valid?
    expect(mileage_without_machine.errors[:machine]).to include("no puede estar en blanco")
  end  
    
end
