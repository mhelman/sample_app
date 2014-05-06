class CreateAdvkeywords < ActiveRecord::Migration
  def change
    create_table :advkeywords do |t|
      t.string :keyword
      t.integer :score

      t.timestamps
    end
  end
end
