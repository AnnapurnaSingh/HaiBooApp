class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|

      t.integer :author_id

      t.string :line_01
      t.string :line_02
      t.string :line_03

      t.timestamps null: false
    end
  end
end
