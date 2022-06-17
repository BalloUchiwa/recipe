class CreateRecipis < ActiveRecord::Migration[7.0]
  def change
    create_table :recipis do |t|
      t.string :title 
      t.integer :cook_time
      t.integer :prep_time
      t.text :ingredients, array: true, default: []
      t.float :ratings
      t.string :cuisine
      t.string :category
      t.string :author
      t.string :image

      t.timestamps
    end
  end
end
