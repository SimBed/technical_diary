class ItemDecorator < BaseDecorator
  def date
    super.strftime("%d %b %y")
  end

  def first_sentence
    # strip_tags(content.to_plain_text.split('.').first).html_safe
    # line_by_fullstop = content.to_plain_text.split('.').first
    line_by_fullstop = content.to_plain_text
    line_by_newline = content.to_plain_text.split("\n").first
    content = line_by_fullstop.length > line_by_newline.length ? line_by_newline : line_by_fullstop
    link_to content, item_path(self), class: "like_button_alt"
  end

  def delete(_authorised, item)
    if item.deletable?
      confirm_message = I18n.t(".delete_item")
      link = link_to image_tag("dustbin.webp", class: "table_icon", alt: "Bin item"), item_path(self), data: { 'turbo-method': :delete, turbo_confirm: confirm_message }
    else
      link = link_to image_tag("dustbin.webp", class: %w[table_icon greyed-out], alt: "Bin item"), "#", class: "disabled"
    end
    content_tag(:div, link, class: %w[column nomobile])
  end

  def edit(_authorised, item)
    if item.editable?
      link = link_to image_tag("edit.png", class: "table_icon", alt: "Edit item"), edit_item_path(self)
    else
      link = link_to image_tag("edit.png", class: %w[table_icon greyed-out], alt: "Edit item"), "#", class: "disabled"
    end
    content_tag(:div, link, class: %w[column nomobile])
  end

  def header
  end
end
