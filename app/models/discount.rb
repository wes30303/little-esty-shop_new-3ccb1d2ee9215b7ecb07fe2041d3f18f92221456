class Discount < ApplicationRecord
  belongs_to :merchant
  validates_numericality_of :precent
  validates_numericality_of :precent, less_than_or_equal_to: 100
  validates_numericality_of :precent, greater_than_or_equal_to: 1
  validates_presence_of :amount
  validates_presence_of :merchant_id
  has_many :invoice_items, through: :merchant
end
