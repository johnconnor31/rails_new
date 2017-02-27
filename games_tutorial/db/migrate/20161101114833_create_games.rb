class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :from
      t.string :review

      t.timestamps null: false
    end
  end
end
