class Statistics
  class << self
    def category_statistic
      [
        [I18n.t("current_week"), :current_week],
        [I18n.t("current_month"), :current_month],
        [I18n.t("current_year"), :current_year],
        [I18n.t("year"), :year]
      ]
    end
  end
end
