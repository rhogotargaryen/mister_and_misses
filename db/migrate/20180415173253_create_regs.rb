class CreateRegs < ActiveRecord::Migration[5.2]
  def change
    create_table :regs do |t|
      t.string :item_name
      t.string :item_link
      t.string :couple_id
    end
  end
end
