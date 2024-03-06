# frozen_string_literal: true

# :nodoc:
module ArticlesHelper
  def article_date_and_author(article)
    date = I18n.l(article.created_at.to_date, format: :template_date)
    "#{date} | By #{article.author}"
  end
end
