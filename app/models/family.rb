class Family < ApplicationRecord
  has_many :users, dependent: :restrict_with_error

  validates :name, presence: true
  validates :token, uniqueness: true, allow_nil: true

  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.hex(10)
  end
end
