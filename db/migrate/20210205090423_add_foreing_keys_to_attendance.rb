class AddForeingKeysToAttendance < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :attendances, :events, column: :attended_event_id
    add_foreign_key :attendances, :users, column: :attendee_id
  end
end
