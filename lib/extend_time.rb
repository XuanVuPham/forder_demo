module ExtendTime
  def is_between_short_time? start_time, end_time
    if start_time.present? && end_time.present?
      time = I18n.l self, format: :short_time
      time < I18n.l(start_time, format: :short_time) ||
        time > I18n.l(end_time, format: :short_time)
    else
      false
    end
  end
end
Time.include ExtendTime
