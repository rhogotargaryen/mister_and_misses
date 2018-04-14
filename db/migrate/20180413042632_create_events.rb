require './config/environment'

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :desc
      t.string :start_time
      t.string :end_time
      t.string :location
    end
  end
end
