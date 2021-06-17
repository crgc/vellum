module GroupsHelper
  def group_detail_hr_tag(group)
    return unless group.film_viewings.any?

    render html: '<hr>'.html_safe
  end

  def render_delete_group(group)
    render 'delete_group' if group.user.id == current_user.id
  end
end
