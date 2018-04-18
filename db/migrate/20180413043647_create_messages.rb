require './config/environment'

class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :recipient
      t.string :content
      t.integer :user_id
    end
  end
end