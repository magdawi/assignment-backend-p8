class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.integer :no_stars, default: 0, null: false

      t.timestamps null: false
    end
  end
end
