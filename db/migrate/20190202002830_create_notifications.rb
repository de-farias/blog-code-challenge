class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :type
      t.text :event
      t.datetime :acknowledged_at
      t.datetime :opened_at
      t.references :target, polymorphic: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :notifications, %i[id type]
  end
end
