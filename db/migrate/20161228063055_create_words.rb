class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :japanese
      t.string :thai
      t.string :english
      t.integer :part_of_speech
      t.integer :verbal_system
      t.text :remarks
      t.integer :favorits

      t.timestamps null: false
    end
  end
end
