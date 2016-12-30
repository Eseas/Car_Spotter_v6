class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.references :session, foreign_key: true
      t.float :bill
      t.integer :credit
      t.integer :max_photo
    end
  end
end
