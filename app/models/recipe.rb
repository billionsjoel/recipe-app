class Recipe < ApplicationRecord
  belongs_to :user
  validates :name, :preparation_time, :description, presence: true

end
