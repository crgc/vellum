class CreateGroupsFilmViewings < ActiveRecord::Migration[6.1]
  def change
    create_table :groups_film_viewings do |t|
      t.references :group, null: false, foreign_key: true
      t.references :film_viewing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
