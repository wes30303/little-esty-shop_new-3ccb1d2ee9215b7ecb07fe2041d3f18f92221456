class Discount < ApplicationRecord
  belongs_to :merchant
  validates_presence_of :precent
  validates_presence_of :amount
  validates_presence_of :merchant_id
  has_many :invoice_items, through: :merchant
end
