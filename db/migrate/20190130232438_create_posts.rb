class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false, unique: true
      t.string :slug, null: false, unique: true
      t.text :raw_content
      t.text :html_content
      t.references :author, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :posts, :title, unique: true
    add_index :posts, :slug, unique: true
  end
end
