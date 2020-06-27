class CreateHauntedHouse < ActiveRecord::Migration[5.2]

  def change
    create_table haunted_houses do |t|
      t.string :name
      t.string :location
      t.string :theme
      t.float :price
      t.boolean :family_friendly
      t.opening_date
      t.closing_date
      t.description
    end
  end

end
