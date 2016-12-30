class CreateCustomerDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_details do |t|
      t.references :session, foreign_key: true
      t.string :email
      t.string :name
      t.string :surname
    end
  end
end
