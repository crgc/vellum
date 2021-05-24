class CreateFilmViewings < ActiveRecord::Migration[6.1]
  def change
    create_table :film_viewings do |t|
      t.string :name
      t.float :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
