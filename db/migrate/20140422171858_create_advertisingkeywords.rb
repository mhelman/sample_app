class CreateAdvertisingkeywords < ActiveRecord::Migration
  def change
    create_table :advertisingkeywords do |t|
      t.string :keyword
      t.integer :score

      t.timestamps
    end
  end
end
