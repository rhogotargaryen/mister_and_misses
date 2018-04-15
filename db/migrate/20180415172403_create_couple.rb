class CreateCouple < ActiveRecord::Migration[5.2]
  def change
    create_table :couples do |t|
      t.string :story
      t.string :user_id
    end
  end
end
