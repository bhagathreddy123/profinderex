class User < ApplicationRecord
  validates :name, :city, :country,  presence: true
  validates :email, :contact_number, presence: true, uniqueness: true
  before_save :check_state_present

  def check_state_present
    self.state = self.country if state.nil?
  end
end
