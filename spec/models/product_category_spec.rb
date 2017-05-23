require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  let(:valid_product_category) { build :product_category }
  let(:product_category_without_name) { build :product_category, name: nil}

  it "is valid with name" do
    expect(valid_product_category).to be_valid
  end
  
  it "is invalid without a name" do
    product_category_without_name.valid?
    expect(product_category_without_name.errors[:name]).to include("can't be blank")
  end  
end
