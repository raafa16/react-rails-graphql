class Customer < ApplicationRecord
  has_one :address, dependent: :destroy
  belongs_to :company
end
