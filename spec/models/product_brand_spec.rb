require 'rails_helper'

RSpec.describe ProductBrand, type: :model do
  let(:valid_product_brand) { build :product_brand }
  let(:product_brand_without_name) { build :product_brand, name: nil}

  it "is valid with name" do
    expect(valid_product_brand).to be_valid
  end
  
  it "is invalid without a name" do
    product_brand_without_name.valid?
    expect(product_brand_without_name.errors[:name]).to include("can't be blank")
  end  
end
