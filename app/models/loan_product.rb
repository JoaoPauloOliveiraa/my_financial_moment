class LoanProduct < ApplicationRecord
  has_and_belongs_to_many :clients
end
