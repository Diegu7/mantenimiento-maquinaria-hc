require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:valid_product) { build :product }
  let(:product_without_name) { build :product, name: nil }
  let(:product_without_valid_initial_stock) { build :product, initial_stock: -1 }
  let(:product_without_valid_current_stock) { build :product, current_stock: -5 }
  let(:product_without_image) { build :product, image: nil }
  let(:product_without_product_brand) { build :product, product_brand: nil }
  let(:product_without_product_category) { build :product, product_category: nil }
  let(:product_without_valid_maximum) { build :product, maximum: -1 }
  let(:product_without_valid_minimum) { build :product, minimum: -5 }

  it "is valid with a name, initial stock, current stock, product brand, product category minimum and maximum" do  
    expect(valid_product).to be_valid
  end

  it "is valid without a name" do
    product_without_name.valid?
    expect(product_without_name.errors[:name]).to include("no puede estar en blanco")
  end

  it "is invalid without a valid initial stock" do
    product_without_valid_initial_stock.valid?
    expect(product_without_valid_initial_stock.errors[:initial_stock]).to include("must be greater than or equal to 0")
  end

  it "is invalid without a valid current stock" do
    product_without_valid_current_stock.valid?
    expect(product_without_valid_current_stock.errors[:current_stock]).to include("must be greater than or equal to 0")
  end

  it "is valid without an image" do
    expect(product_without_image).to be_valid
  end

  it "is invalid without a brand" do
    product_without_product_brand.valid?
    expect(product_without_product_brand.errors[:product_brand]).to include("no puede estar en blanco")
  end

  it "is invalid without a category" do
    product_without_product_category.valid?
    expect(product_without_product_category.errors[:product_category]).to include("no puede estar en blanco")
  end

  it "is invalid without a valid minimum" do
    product_without_valid_minimum.valid?
    expect(product_without_valid_minimum.errors[:minimum]).to include("must be greater than or equal to 0")
  end

  it "is invalid without a valid maximum" do
    product_without_valid_maximum.valid?
    expect(product_without_valid_maximum.errors[:maximum]).to include("must be greater than or equal to 0")
  end

  # it "should validate only integer  values for initial stock" do
  #    expect(valid_product).to validate_numericality_of(:initial_stock).only_integer
  # end

  # it "is invalid with an initial stock value less or equal than 0" do
  #    expect(valid_product).to validate_numericality_of(:initial_stock).is_greater_than(0)
  # end
end
