class CreateCarDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :car_details do |t|
      t.references :car, foreign_key: true
      t.string :make
      t.string :model
      t.string :year
      t.string :lic

      t.timestamps
    end
  end
end
