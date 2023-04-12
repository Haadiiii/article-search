class SearchQuery < ApplicationRecord
  belongs_to :user

  validates :query, presence: true, uniqueness: true
  validates :count, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id query updated_at count]
  end
end
