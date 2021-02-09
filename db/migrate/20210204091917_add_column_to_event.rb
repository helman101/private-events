class AddColumnToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :creator_id, :integer
    add_foreign_key :events, :users, column: :creator_id
  end
end
