class AddUserRefToSearchQuery < ActiveRecord::Migration[7.0]
  def change
    add_reference :search_queries, :user, foreign_key: true
  end
end
