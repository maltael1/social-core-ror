class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.boolean :is_active
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
