class CreateProjectposts < ActiveRecord::Migration
  def change
    create_table :projectposts do |t|
      t.text :belief
      t.string :name
      t.string :link
      t.integer :user_id

      t.timestamps
    end
    add_index :projectposts, [:user_id, :created_at]
  end
end
