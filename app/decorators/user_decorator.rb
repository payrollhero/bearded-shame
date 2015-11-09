class UserDecorator < Draper::Decorator

  delegate_all
  decorates_finders

  def full_name
    [object.first_name, object.last_name].join(" ")
  end

  def link_to_trim
    h.link_to(h.trim_user_path(object)) do |link|
      h.content_tag(:i, "", class:'fa fa-2x fa-cut')
    end
  end

  def link_to_massage_trim
    h.link_to(h.massage_and_trim_user_path(object)) do |link|
      h.content_tag(:i, "", class:'fa fa-2x fa-bed')
    end
  end

  def link_to_shave
    h.link_to(h.shave_user_path(object)) do |link|
      h.content_tag(:i, "", class:'fa fa-2x fa-smile-o')
    end
  end

  def link_to_delete_user
    h.link_to(h.user_path(object)) do |link|
      h.content_tag(:i, "", class:'fa fa-2x fa-trash-o')
    end
  end
end
