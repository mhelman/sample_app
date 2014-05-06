class CreateAdvertisingKeywords < ActiveRecord::Migration
  def change
    create_table :advertising_keywords do |t|
      t.string :keyword
      t.integer :score

      t.timestamps
    end
  end
end
