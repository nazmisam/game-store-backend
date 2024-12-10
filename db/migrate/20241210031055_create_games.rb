class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :authors
      t.date :release_date
      t.text :description

      t.timestamps
    end
  end
end
