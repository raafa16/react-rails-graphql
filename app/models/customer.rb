class Customer < ApplicationRecord
  has_many :addresses, dependent: :destroy
  belongs_to :company
end
