class CreateSensitiveKeywords < ActiveRecord::Migration
  def change
    create_table :sensitive_keywords do |t|
      t.string :keyword
      t.integer :score

      t.timestamps
    end
  end
end
