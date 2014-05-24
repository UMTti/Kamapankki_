class AddStuffToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :stuff_id, :integer
  end
end
