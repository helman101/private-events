class AddIndexToAttendance < ActiveRecord::Migration[6.1]
  def change
    add_index :attendances, :attendee_id
    add_index :attendances, :attended_event_id
  end
end
