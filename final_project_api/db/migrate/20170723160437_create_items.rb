class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :brand
      t.string :super_type
      t.string :sub_type
      t.string :short_description
      t.string :price
      t.string :full_description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
