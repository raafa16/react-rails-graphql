class Customer < ApplicationRecord
  has_many :addresses
  belongs_to :company
end
