class CreateCats < ActiveRecord::Migration[5.0]
  def change
    create_table :cats do |t|
        
        t.text :CatName, null: false
        t.text :CatPhotoUrl
        t.text :CatType

    end
    rename_column :cats, :id, :CatID
  end
end
