module ApplicationHelper
  def flash_class(name)
    alert_type = case name.to_s
      when 'notice'
        'alert-success'
      when 'error'
        'alert-danger'
      when 'alert'
        'alert-danger'
      when 'info'
        'alert-info'
      when 'warning'
        'alert-warning'
    else
      "alert-#{name}"
    end
    alert_type
  end

  def post_link_path(post)
    return post.link if post.link?
    return post_path(post) if post.text?
  end

  def post_title_link(post)
    content_tag :div, class: 'title' do
      link_to(post.title, post_link_path(post))
    end
  end

  def sidebar(sidebar_content)
    content_for(:sidebar) do
      sidebar_content
    end
  end
end
