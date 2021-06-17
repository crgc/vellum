module FilmViewingsHelper
  def total_viewing_time(film_viewings)
    running_time_str(film_viewings.inject(0) { |sum, film_viewing| sum + film_viewing.running_time })
  end

  def running_time_str(running_time)
    return '0h 0m' unless running_time > 0

    hours, minutes = 0
    running_time_str = ''

    hours = (running_time / 60) if running_time >= 60
    running_time_str = "#{hours}h " if hours > 0

    minutes = (running_time - (hours * 60))
    running_time_str += "#{minutes}m"
  end

  def group_avatar(group, film_viewing)
    if film_viewing.groups.any?
      image_tag group.avatar
    else
      image_tag 'popcorn.png'
    end
  end

  def render_delete_film_viewing(film_viewing)
    render 'delete_film_viewing' if film_viewing.author.id == current_user.id
  end
end
