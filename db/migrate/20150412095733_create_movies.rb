class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :director
      t.text :description
      t.integer :year
      t.decimal :length
      t.string :format

      t.timestamps
    end
  end
end
