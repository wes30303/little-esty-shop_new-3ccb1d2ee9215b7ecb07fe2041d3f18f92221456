class InvoiceItem < ApplicationRecord
    enum status:[:pending, :packaged, :shipped]

    belongs_to :invoice
    belongs_to :item

    has_one :merchant, through: :item
    has_many :transactions, through: :invoice
    has_many :discounts, through: :merchant

    validates_presence_of :quantity
    validates_presence_of :unit_price
    validates_presence_of :status

    def top_discount
    discounts.where("#{quantity} >= amount")
    .select('discounts.*')
    .group('discounts.id, merchants.id, items.id')
    .order(precent: :desc)
    .first
  end

  def dis_revenue
    if top_discount
      (1 - top_discount.precent.to_f / 100) * (quantity * unit_price)
    else
      total_revenue
    end
  end

  def total_revenue
    (quantity * unit_price)
  end
end
