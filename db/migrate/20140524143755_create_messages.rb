class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :sender_id

      t.timestamps
    end
  end
end
