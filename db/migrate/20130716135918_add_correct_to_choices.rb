class AddCorrectToChoices < ActiveRecord::Migration
  def change
    add_column :choices, :correct, :boolean
  end
end
