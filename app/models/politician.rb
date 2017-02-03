class Politician < ApplicationRecord

  def donald_trump
    {
      name: "Mr. President",
      address_line: "The White House, 1600 Pennsylvania Avenue NW",
      address_state: "DC",
      address_city: "Washington",
      address_country: "US",
      address_zip: 20500
    }
  end
end
