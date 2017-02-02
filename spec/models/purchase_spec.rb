require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context 'validations' do
    it 'is invalid without a letter_id' do
      purchase = Purchase.create(description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a description' do
      purchase = Purchase.create(letter_id: 1, to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a to_name' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a to_address_line' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a to_address_city' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a to_address_state' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a to_address_country' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a to_address_zip' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a from_name' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a from_address_line' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a from_address_city' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a from_address_state' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a from_address_country' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    
    it 'is invalid without a from_address_zip' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a file' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      data: "email" , payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without data' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", payment_status: "paid" , color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without payment_status' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email", color: true )

      expect(purchase).to be_invalid
    end
    it 'is invalid without a color' do
      purchase = Purchase.create(letter_id: 1, description: "a", to_name: "b", to_address_line: "c", to_address_city: "b",
                      to_address_state: "b", to_address_country: "b", to_address_zip: "b", from_name: "b", 
                      from_address_line: "b", from_address_city: "b", from_address_state: "b", 
                      from_address_country: "b", from_address_zip: "b", 
                      file: "<head></head>", data: "email" , payment_status: "paid" )

      expect(purchase).to be_invalid
    end

  end
end
