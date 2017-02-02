class Purchase < ApplicationRecord

  def self.order_letter
    lob.letters.create(
      description: description, 
      to: {
        name: to_name, 
        address_line1: to_address_line, 
        address_state: to_address_state,
        address_city: to_address_city,
        address_country: to_address_country,
        address_zip: to_address_zip
      }, 
      from: {
        name: from_name,
        address_line1: from_address_line,
        address_state: from_address_state,
        address_city: from_address_city,
        address_country: from_address_country,
        address_zip: from_address_zip
      },
      file: file ,
      data: {
        email: data
      },
      color: color 
    )
  end

end
