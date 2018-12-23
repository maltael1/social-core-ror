class InitSessionFields < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.boolean :active, default: true
      t.string :token
      t.integer :user_id
      t.timestamps
    end
  end
end
