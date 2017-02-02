class Politician < ApplicationRecord

  def donald_trump
    {
      name: "Mr. President",
      address_line: "1600 Penn. Ave",
      address_state: "DC",
      address_city: "Washington",
      address_country: "US",
      address_zip: 43434
    }
  end
end
