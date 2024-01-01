class User < ApplicationRecord
  validates :name, :city, :country,  presence: true
  validates :email, :contact_number, presence: true, uniqueness: true
end
