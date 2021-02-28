class Activity < ApplicationRecord
  validates :distance, presence: true
  validates :original_location, presence: true
  validates :destination_location, presence: true
end
