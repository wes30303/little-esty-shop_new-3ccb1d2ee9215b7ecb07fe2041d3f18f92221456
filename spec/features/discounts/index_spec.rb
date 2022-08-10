require 'rails_helper'

RSpec.describe 'Discounts index Index' do

  it "will show a link to view all discounts when i click the link" do
    merchant1 = Merchant.create!(name: "Poke Retirement homes")
    merchant2 = Merchant.create!(name: "Happy Place ")

    customer1 = Customer.create!(first_name: 'Beannah', last_name: 'Durke')

    item1 = Item.create!(name: "Pikachu pics", description: 'Cute pics with pikachu', unit_price: 1000, merchant_id: merchant1.id)
    item2 = Item.create!(name: "Pokemon stuffy", description: 'Pikachu stuffed toy', unit_price: 2000, merchant_id: merchant1.id)
    item3 = Item.create!(name: "Junk", description: 'junk you should want', unit_price: 500, merchant_id: merchant1.id)
    item4 = Item.create!(name: "macrame runner", description: 'handmade macrame runner', unit_price: 2500, merchant_id: merchant1.id)
    item5 = Item.create!(name: "hotdog", description: 'handmade hotdog', unit_price: 500, merchant_id: merchant1.id)

    invoice1 = Invoice.create!(status: 'completed', customer_id: customer1.id, created_at: "2022-07-01 20:00:00 UTC -05:00")
    invoice2 = Invoice.create!(status: 'completed', customer_id: customer1.id, created_at: "2022-07-02 20:00:00 UTC")
    invoice3 = Invoice.create!(status: 'completed', customer_id: customer1.id, created_at: "2022-07-03 20:00:00 UTC")
    invoice4 = Invoice.create!(status: 'completed', customer_id: customer1.id, created_at: "2022-06-01 20:00:00 UTC")
    invoice5 = Invoice.create!(status: 'completed', customer_id: customer1.id, created_at: "2022-06-05 20:00:00 UTC")

    invoice_item1 = InvoiceItem.create!(quantity: 100, unit_price: 1000, status: 'pending', item_id: item1.id, invoice_id: invoice1.id)
    invoice_item2 = InvoiceItem.create!(quantity: 100, unit_price: 1000, status: 'pending', item_id: item2.id, invoice_id: invoice2.id)
    invoice_item3 = InvoiceItem.create!(quantity: 100, unit_price: 1000, status: 'pending', item_id: item3.id, invoice_id: invoice3.id)
    invoice_item4 = InvoiceItem.create!(quantity: 100, unit_price: 1000, status: 'pending', item_id: item4.id, invoice_id: invoice4.id)
    invoice_item5 = InvoiceItem.create!(quantity: 100, unit_price: 1000, status: 'shipped', item_id: item5.id, invoice_id: invoice5.id)

    discount1 = Discount.create!(precent: 20.00, amount: 10, merchant_id: merchant1.id)
    discount2 = Discount.create!(precent: 10.00, amount: 5, merchant_id: merchant1.id)
    discount3 = Discount.create!(precent: 5.00, amount: 3 ,merchant_id: merchant2.id)

    visit "/merchants/#{merchant1.id}/discounts"

    click_link 'Create A New Discount'

    fill_in('precent', with: '25')
    fill_in('amount', with: '15')

    click_button 'Create Discount'

    expect(page).to have_content(25)
    expect(page).to have_content(15)

    click_link 'Create A New Discount'

    fill_in('precent', with: '40')
    fill_in('amount', with: '55')

    click_button 'Create Discount'

    expect(page).to have_content(40)
    expect(page).to have_content(55)
  end

  it "is able to Delete discount" do
    merchant1 = Merchant.create!(name: "Poke Retirement homes")
    merchant2 = Merchant.create!(name: "Happy Place ")

    discount1 = Discount.create!(precent: 23.00, amount: 10, merchant_id: merchant1.id)
    discount2 = Discount.create!(precent: 10.00, amount: 5, merchant_id: merchant1.id)
    discount3 = Discount.create!(precent: 5.00, amount: 3 ,merchant_id: merchant2.id)

    visit "/merchants/#{merchant1.id}/discounts"

      expect(page).to have_content(23.0)
      expect(page).to have_content(10)
    within "#discount-#{discount1.id}" do
      click_link 'Delete Discount'
    end
      expect(page).to_not have_content(23)
  end
end
