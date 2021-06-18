class AddRunningTimeToFilmViewings < ActiveRecord::Migration[6.1]
  def change
    add_column :film_viewings, :running_time, :integer
  end
end
