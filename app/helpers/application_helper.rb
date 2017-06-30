module ApplicationHelper
  def fa_icon(icon_class)
    content_tag 'i', '', class: "fa fa-#{icon_class}"
  end
end
