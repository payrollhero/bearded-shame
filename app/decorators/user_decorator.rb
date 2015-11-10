class UserDecorator < Draper::Decorator

  delegate_all
  decorates_finders

  def full_name
    [object.first_name, object.last_name].join(" ")
  end

  def link_to_trim
    h.link_to(h.new_user_trim_path(object), class: 'trim') do |link|
      h.content_tag(:i, "", class:'fa fa-2x fa-cut')
    end
  end

  def link_to_massage_trim
    h.link_to(h.new_user_massage_trim_path(object), class: 'massage-trim') do |link|
      h.content_tag(:i, "", class:'fa fa-2x fa-bed')
    end
  end

  def link_to_shave
    h.link_to(h.user_trims_path(object, treatment: {trim_type_id: 1}), class: 'shave', method: :create) do |link|
      h.content_tag(:i, "", class:'fa fa-2x fa-smile-o')
    end
  end

  def link_to_delete_user
    h.link_to(h.user_path(object), class: 'delete-user', data: { confirm: "Delete user #{object.decorate.full_name}?" }, method: :delete) do
      h.content_tag(:i, "", class:'fa fa-2x fa-trash-o')
    end
  end
end
