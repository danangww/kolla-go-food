require 'rails_helper'

describe Food do
  it "is valid with a name and description" do
    food = Food.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 10000.0
      )
    expect(food).to be_valid
  end
  it "is invalid without a name" do
    food = Food.new(
      name: nil,
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 10000.0
      )
    expect(food.errors[:name]).to include('can\'t be blank')
  end
  it "is invalid without a description"
  it "is invalid with a duplicate name"
  it "is valid with a name and description"
end