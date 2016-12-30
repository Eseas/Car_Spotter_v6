class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.references :session, foreign_key: true
      t.text :comment
    end
  end
end
