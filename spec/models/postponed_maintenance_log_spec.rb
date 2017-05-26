require 'rails_helper'

RSpec.describe PostponedMaintenanceLog, type: :model do
  let(:valid_postṕoned_maintenance) { build :postponed_maintenance_log }
  let(:postponed_without_reason) { build :postponed_maintenance_log, reason: nil }
  let(:postponed_without_previous_date) { build :postponed_maintenance_log, previous_date: nil }
  let(:postponed_without_new_date) { build :postponed_maintenance_log, new_date: nil }
  let(:postponed_without_programmed_maintenance) { build :postponed_maintenance_log, programmed_maintenance: nil }

  it "is valid wiht reason, previous date, new date and programmed maintenance" do
    expect(valid_postṕoned_maintenance).to be_valid
  end
  
  it "is invalid without a reason" do
    postponed_without_reason.valid?
    expect(postponed_without_reason.errors[:reason]).to include ("no puede estar en blanco")
  end
  
  it "is invalid wihtout a previous date" do
    postponed_without_previous_date.valid?
    expect(postponed_without_previous_date.errors[:previous_date]).to include ("no puede estar en blanco")
  end
  
  it "is invalid without new date" do
    postponed_without_new_date.valid?
    expect(postponed_without_new_date.errors[:new_date]).to include ("no puede estar en blanco")
  end
  
  it "is invalid without programmed maintenance" do
    postponed_without_programmed_maintenance.valid?
    expect(postponed_without_programmed_maintenance.errors[:programmed_maintenance]).to include ("debe existir")
  end
end
