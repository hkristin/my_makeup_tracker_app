class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :palettes
      t.integer :age
      t.boolean :clean
    end
  end
end