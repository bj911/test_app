class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :message
      t.string :message_type
      t.timestamps
    end
  end
end
