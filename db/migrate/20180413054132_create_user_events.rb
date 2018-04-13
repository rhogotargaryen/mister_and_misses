class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_eventsdo do |t|
      t.integer :user_id
      t.integer :event_id
    end
  end
end
