class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

# rake db:drop db:create db:migrate
