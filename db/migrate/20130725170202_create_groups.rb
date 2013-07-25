class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :instructor
      t.string :code

      t.timestamps
    end
  end
end
