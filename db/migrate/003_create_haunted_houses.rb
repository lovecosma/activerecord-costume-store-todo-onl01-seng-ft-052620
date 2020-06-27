class CreateHauntedHouse < ActiveRecord::Migration[5.2]

  def change
    create_table haunted_houses do |t|
      t.name
      t.location
      t.theme
    end
  end

end
