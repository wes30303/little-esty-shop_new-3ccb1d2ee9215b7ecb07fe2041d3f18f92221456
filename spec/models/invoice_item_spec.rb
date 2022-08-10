require 'rails_helper'

RSpec.describe InvoiceItem do

  describe 'enums' do
    it 'does' do
      expect { define_enum_for(:status).with_values(['pending', 'packaged', 'shipped']) }
    end
  end

  describe 'relationships' do
    it { should belong_to :invoice }
    it { should belong_to :item }
  end

  describe 'validations' do
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :status }
    it { should have_many(:discounts).through(:merchant) }
  end
 

  it "should be able find the best discount" do
    merchant1 = Merchant.create!(name: "Poke Retirement homes", status: "enabled")
    merchant2 = Merchant.create!(name: "Rendolyn Guizs poke stops", status: "enabled")
    merchant3 = Merchant.create!(name: "Dhirley Secasrio's knits and bits", status: "enabled")

    item1 = Item.create!(name: "Pikachu pics", description: 'Cute pics with pikachu', unit_price: 1000, merchant_id: merchant1.id)
    item2 = Item.create!(name: "Pokemon stuffy", description: 'Pikachu stuffed toy', unit_price: 2000, merchant_id: merchant2.id)
    item3 = Item.create!(name: "Junk", description: 'junk you should want', unit_price: 500, merchant_id: merchant3.id)

    customer1 = Customer.create!(first_name: "Parker", last_name: "Thomson")
    invoice1 = Invoice.create!(status: "completed", customer_id: customer1.id)
    invoice2 = Invoice.create!(status: "cancelled", customer_id: customer1.id)

    customer2 = Customer.create!(first_name: "Shirley", last_name: "DeCesari")
    invoice1 = Invoice.create!(status: "completed", customer_id: customer1.id)
    invoice2 = Invoice.create!(status: "cancelled", customer_id: customer2.id)

    invoice3 = Invoice.create!(status: "in progress", customer_id: customer1.id)
    transaction1 = Transaction.create!(credit_card_number: "123456789123456789", result: "success", invoice_id: invoice1.id)
    invoice_item1 = InvoiceItem.create!(quantity: 1, unit_price: item1.unit_price, status: "shipped", item_id: item1.id, invoice_id: invoice1.id)
    invoice_item2 = InvoiceItem.create!(quantity: 2, unit_price: item2.unit_price, status: "pending", item_id: item2.id, invoice_id: invoice2.id)
    invoice_item3 = InvoiceItem.create!(quantity: 3, unit_price: item3.unit_price, status: "packaged", item_id: item3.id, invoice_id: invoice3.id)

    discount1 = Discount.create!(precent: 20.00, amount: 1, merchant_id: merchant1.id)
    discount2 = Discount.create!(precent: 10.00, amount: 1, merchant_id: merchant1.id)
    discount3 = Discount.create!(precent: 5.00, amount: 1 ,merchant_id: merchant2.id)

    expect(invoice_item1.top_discount).to eq(discount1)
  end

  it "should be able to give a discount" do
    merchant1 = Merchant.create!(name: "Poke Retirement homes", status: "enabled")
    merchant2 = Merchant.create!(name: "Rendolyn Guizs poke stops", status: "enabled")
    merchant3 = Merchant.create!(name: "Dhirley Secasrio's knits and bits", status: "enabled")

    item1 = Item.create!(name: "Pikachu pics", description: 'Cute pics with pikachu', unit_price: 1000, merchant_id: merchant1.id)
    item2 = Item.create!(name: "Pokemon stuffy", description: 'Pikachu stuffed toy', unit_price: 2000, merchant_id: merchant2.id)
    item3 = Item.create!(name: "Junk", description: 'junk you should want', unit_price: 500, merchant_id: merchant3.id)

    customer1 = Customer.create!(first_name: "Parker", last_name: "Thomson")
    invoice1 = Invoice.create!(status: "completed", customer_id: customer1.id)
    invoice2 = Invoice.create!(status: "cancelled", customer_id: customer1.id)

    customer2 = Customer.create!(first_name: "Shirley", last_name: "DeCesari")
    invoice1 = Invoice.create!(status: "completed", customer_id: customer1.id)
    invoice2 = Invoice.create!(status: "cancelled", customer_id: customer2.id)

    invoice3 = Invoice.create!(status: "in progress", customer_id: customer1.id)
    transaction1 = Transaction.create!(credit_card_number: "123456789123456789", result: "success", invoice_id: invoice1.id)
    invoice_item1 = InvoiceItem.create!(quantity: 1, unit_price: item1.unit_price, status: "shipped", item_id: item1.id, invoice_id: invoice1.id)
    invoice_item2 = InvoiceItem.create!(quantity: 2, unit_price: item2.unit_price, status: "pending", item_id: item2.id, invoice_id: invoice2.id)
    invoice_item3 = InvoiceItem.create!(quantity: 3, unit_price: item3.unit_price, status: "packaged", item_id: item3.id, invoice_id: invoice3.id)

    discount1 = Discount.create!(precent: 20.00, amount: 1, merchant_id: merchant1.id)
    discount2 = Discount.create!(precent: 10.00, amount: 1, merchant_id: merchant1.id)
    discount3 = Discount.create!(precent: 5.00, amount: 1 ,merchant_id: merchant2.id)

    expect(invoice_item1.dis_revenue).to eq(800)
  end
end
