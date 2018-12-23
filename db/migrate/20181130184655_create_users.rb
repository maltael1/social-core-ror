class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.boolean :is_admin, default: false
      t.string :email
      t.string :password
      t.timestamps
    end
  end
end
