class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.references :car, foreign_key: true
      t.string :filename
    end
  end
end
