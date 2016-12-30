# This class is responsible
# for
class Car < ApplicationRecord
  belongs_to :session
  has_one :car_detail
  has_many :photos

  validates :comment, length: { maximum: 140 }

  def change_comment(comment)
    self.comment = comment
  end
end
