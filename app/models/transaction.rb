class Transaction < ApplicationRecord
  belongs_to :account
  scope :deposits, -> { where transaction_type: 0 }
  scope :expenses, -> { where transaction_type: 1 }
  validates :amount, presence: true

end
