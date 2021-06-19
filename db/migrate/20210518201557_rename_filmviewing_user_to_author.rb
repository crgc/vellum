class RenameFilmviewingUserToAuthor < ActiveRecord::Migration[6.1]
  def change
    change_table :film_viewings do |t|
      t.remove :user_id
      t.references :author, null: false, foreign_key: { to_table: :users }, default: 1
    end
  end
end
