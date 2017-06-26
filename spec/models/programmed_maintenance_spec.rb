require 'rails_helper'

RSpec.describe ProgrammedMaintenance, type: :model do
  let(:valid_programmed_maintenance) { build :programmed_maintenance }
  let(:maintenance_without_description) { build :programmed_maintenance, description: nil }
  let(:maintenance_without_scheduled_at) { build :programmed_maintenance, scheduled_at: nil }
  let(:maintenance_without_comments) { build :programmed_maintenance, comments: nil }
  let(:maintenance_without_valid_estimated_duration) { build :programmed_maintenance, estimated_duration: -1 }
  let(:maintenance_without_done) { build :programmed_maintenance, done: nil }
  let(:maintenance_without_done_at) { build :programmed_maintenance, done_at: nil }
  let(:maintenance_without_preventive) { build :programmed_maintenance, preventive: nil }
  let(:maintenance_without_machine) { build :programmed_maintenance, machine: nil }

  it 'is valid with a description, scheduled at, estimated duration, done, done at, preventive and machine' do
    expect(valid_programmed_maintenance).to be_valid
  end

<<<<<<< HEAD
  it 'is valid without comments' do
    expect(maintenance_without_comments).to be_valid
=======
  it "is invalid without comments" do
    maintenance_without_comments.valid?
    expect(maintenance_without_comments.errors[:comments]).to include("no puede estar en blanco")
>>>>>>> 88c1f71ee015581f0f23c82c6c4f7a3df2dd98ce
  end

  it 'is invalid without a description' do
    maintenance_without_description.valid?
    expect(maintenance_without_description.errors[:description]).to include("no puede estar en blanco")
  end
<<<<<<< HEAD

  it 'is invalid without scheduled_at date' do
=======
  
  it "is invalid without scheduled_at" do
>>>>>>> 88c1f71ee015581f0f23c82c6c4f7a3df2dd98ce
    maintenance_without_scheduled_at.valid?
    expect(maintenance_without_scheduled_at.errors[:scheduled_at]).to include("no puede estar en blanco")
  end

  it 'is invalid with a value less or equal than 0 in estimated time' do
    maintenance_without_valid_estimated_duration.valid?
<<<<<<< HEAD
    expect(maintenance_without_valid_estimated_duration.errors[:estimated_duration]).to include('must be greater than 0')
  end

  it 'is invalid without done value' do
    maintenance_without_done.valid?
    expect(maintenance_without_done.errors[:done]).to include("can't be blank")
=======
    expect(maintenance_without_valid_estimated_duration.errors[:estimated_duration]).to include("debe ser mayor que o igual a 0")
  end

  it "is valid without done value" do
    expect(maintenance_without_done).to be_valid
>>>>>>> 88c1f71ee015581f0f23c82c6c4f7a3df2dd98ce
  end

  it 'is invalid without done_at date value' do
    maintenance_without_done_at.valid?
    expect(maintenance_without_done_at.errors[:done_at]).to include("no puede estar en blanco")
  end

<<<<<<< HEAD
  it 'is invalid without preventive value' do
    maintenance_without_preventive.valid?
    expect(maintenance_without_preventive.errors[:preventive]).to include("can't be blank")
  end

  it 'is invalid without a machine' do
=======
  it "is valid without preventive value" do
    expect(maintenance_without_preventive).to be_valid
  end

  it "is invalid without a machine" do
>>>>>>> 88c1f71ee015581f0f23c82c6c4f7a3df2dd98ce
    maintenance_without_machine.valid?
    expect(maintenance_without_machine.errors[:machine]).to include("debe existir")
  end
end
