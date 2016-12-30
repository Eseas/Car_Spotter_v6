class CreateCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table :credentials do |t|
      t.references :session, foreign_key: true
      t.string :password
    end
  end
end
