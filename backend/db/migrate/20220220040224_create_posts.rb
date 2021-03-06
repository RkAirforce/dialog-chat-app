class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false
      t.text :content, null: false, :limit => 500
      t.timestamps
    end
  end
end
