class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :desc
      t.string :state
      t.references :user

      t.timestamps
    end
    add_index :books, :user_id
  end
end
