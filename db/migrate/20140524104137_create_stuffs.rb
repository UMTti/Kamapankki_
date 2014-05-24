class CreateStuffs < ActiveRecord::Migration
  def change
    create_table :stuffs do |t|
      t.string :name
      t.integer :user_id
      t.boolean :borrowed

      t.timestamps
    end
  end
end
