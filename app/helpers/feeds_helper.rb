module FeedsHelper
  def create_publish_date(date)
    DateTime.parse(date).strftime('%d/%m/%Y %H:%M')
  end
end
