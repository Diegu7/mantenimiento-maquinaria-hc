require 'rails_helper'

RSpec.describe RequiredMaintenance, type: :model do
  let(:valid_required_maintenance) { build :required_maintenance }
  let(:maintenance_without_description) { build :required_maintenance, description: nil }
  let(:maintenance_without_valid_estimated_duration) { build :required_maintenance, estimated_duration: -1 }
  let(:maintenance_without_valid_estimated_duration_0) { build :required_maintenance, estimated_duration: 0 }
  let(:maintenance_without_machine) {build :required_maintenance, machine: nil }
  let(:maintenance_without_machine_area) { build :required_maintenance, machine_area: nil }
  let(:maintenance_without_valid_frequency_in_hours) { build :required_maintenance, frequency_in_hours: -1}
  let(:maintenance_without_valid_frequency_in_hours_0) { build :required_maintenance, frequency_in_hours: 0}
  let(:maintenance_without_valid_frequency_in_days) { build :required_maintenance, frequency_in_days: -1 }
  let(:maintenance_without_valid_frequency_in_days_0) { build :required_maintenance, frequency_in_days: 1 }

  it "is valid wiht a description, estimated duration, machine, machine area, frequency in hours and frequency in days" do
    expect(valid_required_maintenance).to be_valid
  end

  it "is invalid without a description" do
    maintenance_without_description.valid?
    expect(maintenance_without_description.errors[:description]).to include("no puede estar en blanco")
  end

  it "is invalid when estimated duration is less than 0" do
    maintenance_without_valid_estimated_duration.valid?
    expect(maintenance_without_valid_estimated_duration.errors[:estimated_duration]).to include("must be greater than 0")
  end
  
  it "is invalid when estimated duration is equal to 0" do
    maintenance_without_valid_estimated_duration_0.valid?
    expect(maintenance_without_valid_estimated_duration_0.errors[:estimated_duration]).to include("must be greater than 0")
  end

  it "is invalid without a machine area" do
    maintenance_without_machine_area.valid?
    expect(maintenance_without_machine_area.errors[:machine_area]).to include("no puede estar en blanco")
  end
  
  it "is invalid without a machine" do
    maintenance_without_machine.valid?
    expect(maintenance_without_machine.errors[:machine]).to include("no puede estar en blanco")
  end
  
  it "is invalid when frequency in hours is less than 0" do
    maintenance_without_valid_frequency_in_hours.valid?
    expect(maintenance_without_valid_frequency_in_hours.errors[:frequency_in_hours]).to include("must be greater than 0")
  end
  
  it "is invalid when frequency in hours is equal to 0" do
    maintenance_without_valid_frequency_in_hours_0.valid?
    expect(maintenance_without_valid_frequency_in_hours_0.errors[:frequency_in_hours]).to include("must be greater than 0")
  end

  it "is invalid when frequency in days is less than 0" do
    maintenance_without_valid_frequency_in_days.valid?
    expect(maintenance_without_valid_frequency_in_days.errors[:frequency_in_days]).to include("must be greater than 0")
  end
  
  it "is invalid when frequency in days is equal to 0" do
    maintenance_without_valid_frequency_in_days_0.valid?
    expect(maintenance_without_valid_frequency_in_days_0.errors[:frequency_in_days]).to include("must be greater than 0")
  end

end
