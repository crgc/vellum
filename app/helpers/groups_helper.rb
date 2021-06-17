module GroupsHelper
  def group_detail_hr_tag(group)
    return unless group.film_viewings.any?

    render html: '<hr>'.html_safe
  end
end
