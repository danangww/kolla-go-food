require 'rails_helper'

describe Food do
  it 'has a valid factory' do
    # expect(FactoryGirl.build(:food)).to be_valid
    expect(build(:food)).to be_valid
  end
  it "is valid with a name and description" do
    # food = Food.new(
    #   name: 'Nasi Uduk',
    #   description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
    #   price: 10000.0
    #   )
    # expect(food).to be_valid
    expect(build(:food)).to be_valid
  end
  it "is invalid without a name" do
    # food = Food.new(
    #   name: nil,
    #   description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
    #   price: 10000.0
    #   )
    # food.valid?
    # expect(food.errors[:name]).to include('can\'t be blank')
    food = build(:food, name: nil)
    food.valid?
    expect(food.errors[:name]).to include('can\'t be blank')
  end
  it "is invalid without a description" do
    # food = Food.new(
    #   name: 'Nasi Uduk',
    #   description: nil,
    #   price: 10000.0
    #   )
    # food.valid?
    # expect(food.errors[:description]).to include('can\'t be blank')
    food = build(:food, description: nil)
    food.valid?
    expect(food.errors[:description]).to include('can\'t be blank')
  end
  it "is invalid with a duplicate name" do
    # food1 = Food.create(
    #   name: 'Nasi Uduk',
    #   description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
    #   price: 10000.0
    #   )
    # food2 = Food.create(
    #   name: 'Nasi Uduk',
    #   description: 'Just with a different description',
    #   price: 10000.0
    #   )
    # food2.valid?
    # expect(food2.errors[:name]).to include("has already been taken")
    food1 = create(:food, name: 'Nasi Uduk')
    food2 = build(:food, name: 'Nasi Uduk')
    food2.valid?
    expect(food2.errors[:name]).to include("has already been taken")
  end
  it "returns a sorted array of results that match" do
    food1 = Food.create(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 10000.0
      )
    food2 = Food.create(
      name: 'Kerak Telor',
      description: 'Betawi traditional spicy omelette made from glutinous rice',
      price: 8000.0
      )
    food3 = Food.create(
      name: 'Nasi Semur Jengkol',
      description: 'Based on dongfruit, this menu promises a unique and delicious',
      price: 8000.0
      )

    expect(Food.by_letter('N')).to eq([food3, food1])
  end
  it "omits results that do not match" do
    food1 = Food.create(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 10000.0
      )
    food2 = Food.create(
      name: 'Kerak Telor',
      description: 'Betawi traditional spicy omelette made from glutinous rice',
      price: 8000.0
      )
    food3 = Food.create(
      name: 'Nasi Semur Jengkol',
      description: 'Based on dongfruit, this menu promises a unique and delicious',
      price: 8000.0
      )

    expect(Food.by_letter('N')).not_to eq(food2)
  end

  describe 'filter name by letter' do
    before :each do
      # @food1 = Food.create(
      #   name: 'Nasi Uduk',
      #   description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      #   price: 10000.0
      #   )
      # @food2 = Food.create(
      #   name: 'Kerak Telor',
      #   description: 'Betawi traditional spicy omelette made from glutinous rice',
      #   price: 8000.0
      #   )
      # @food3 = Food.create(
      #   name: 'Nasi Semur Jengkol',
      #   description: 'Based on dongfruit, this menu promises a unique and delicious',
      #   price: 8000.0
      #   )
      @food1 = create(:food, name: 'Nasi Uduk')
      @food2 = create(:food, name: 'Kerak Telor')
      @food3 = create(:food, name: 'Nasi Semur Jengkol')
    end
    context 'with matching letters' do
      it "returns a sorted array of results that match" do
        expect(Food.by_letter('N')).to eq([@food3, @food1])
      end
    end
    context 'with non-matching letters' do
      it 'omits results that do not match' do
        expect(Food.by_letter('N')).not_to eq(@food2)
      end
    end
  end

  describe 'validate price' do
    before :each do
      # @food1 = Food.create(
      #   name: 'Nasi Uduk',
      #   description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      #   price: 'price'
      #   )
      # @food2 = Food.create(
      #   name: 'Nasi Uduk',
      #   description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      #   price: 0.0
      #   )
      # @food3 = Food.create(
      #   name: 'Nasi Uduk',
      #   description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      #   price: 10000.0
      #   )
      @food1 = build(:food, price: 0.01)
      @food2 = build(:food, price: 0.0)
      @food3 = build(:food, price: 'price')
    end
    context 'with non-numeric values for price' do
      it 'will not accept non numeric values' do
        @food3.valid?
        expect(@food3.errors[:price]).to include('is not a number')
      end
    end
    context 'with numeric values for price' do
      it 'will accept numeric values greater than or equal 0.01' do |variable|
        @food1.valid?
        expect(@food1).to be_valid
      end
      it 'will not accept price less than 0.01' do
        @food2.valid?
        expect(@food2.errors[:price]).to include('must be greater than or equal to 0.01')
      end
    end
  end

  describe 'validate url' do
    before :each do
      # @food1 = Food.create(
      #   name: 'Nasi Uduk',
      #   description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      #   price: 10000.0,
      #   image_url: 'http://url.com/photo.doc'
      #   )
      # @food2 = Food.create(
      #   name: 'Nasi Uduk',
      #   description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      #   price: 10000.0,
      #   image_url: 'http://url.com/photo.jpg'
      #   )
      @food1 = build(:food, image_url: 'food.jpg')
      @food2 = build(:food, image_url: 'food.csv')
    end
    context 'with extension for image_url' do
      it 'will accept if image_url ends with .gif, .jpg, and .png' do
        expect(@food1).to be_valid
      end
      it 'will not accept if image_url ends with anything other than .gif, .jpg, and .png' do
        @food2.valid?
        expect(@food2.errors[:image_url]).to include('must be a URL for GIF, JPG, or PNG image.')
      end
    end
  end
end