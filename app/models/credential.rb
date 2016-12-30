# This class is responsible
# for
class Credential < ApplicationRecord
  belongs_to :session

  validates :session_id, presence: true
  validates :password, presence: true, format: { with:
    /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,20}\z/ }

  def ==(other)
    password == other.password
  end
end
