class CreateSensitivekeywords < ActiveRecord::Migration
  def change
    create_table :sensitivekeywords do |t|
      t.string :keyword
      t.integer :score

      t.timestamps
    end
  end
end
