class FetchWeatherReportsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    OpenWeatherService.new.fetch_reports!
  end
end
