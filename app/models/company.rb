class Company < ApplicationRecord
  has_many :customers, dependent: :destroy
end
