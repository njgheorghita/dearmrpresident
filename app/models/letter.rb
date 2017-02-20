class Letter < ApplicationRecord
  validates :letter_body, length: { maximum: 450 }
  has_one :purchase
end
