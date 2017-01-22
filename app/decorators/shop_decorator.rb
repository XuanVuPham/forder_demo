class ShopDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def status_text
    case self.status.to_sym
    when :active
      I18n.t "status.shops.active"
    when :closed
      I18n.t "status.shops.closed"
    when :rejected
      I18n.t "status.shops.rejected"
    when :blocked
      I18n.t "status.shops.blocked"
    else
      I18n.t "status.shops.pending"
    end
  end

  def status_label
    case self.status.to_sym
    when :active
      "success"
    when :closed
      "warning"
    when :rejected
      "info"
    when :blocked
      "danger"
    else
      "primary"
    end
  end
end
