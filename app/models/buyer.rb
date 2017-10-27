class Buyer < ApplicationRecord
  validates :email, :name, :phone, :address, presence: true
  validates :email, uniqueness:true, format: {
    with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
    message: 'email format is not valid.'
  }
  validates :phone, uniqueness: true, format: {
    with: /\A[-+]?[0-9]*\.?[0-9]+\Z/,
    message: 'phone format must be in number'
  }, length: { maximum: 12 }
end
