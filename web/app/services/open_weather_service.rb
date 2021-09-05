class OpenWeatherService

  def fetch_reports!
    Location.find_each do |location|
      response = HTTParty.get("https://api.openweathermap.org/data/2.5/forecast?q=#{location.name}&appid=#{ENV['OPEN_WEATHER_API_KEY']}")

      response["list"].each do |report_hash|
        params = weather_report_params(location, report_hash)
        weather_report = WeatherReport.find_or_initialize_by(
          params.slice(:day, :hour).merge(location_id: location.id)
        )
        next if weather_report.modification_count > 0
        weather_report.update(params)
      end
    end
  end

  private

  def weather_report_params(location, report_hash)
    datetime = DateTime.parse(report_hash["dt_txt"])

    {
      day: datetime.to_date,
      hour: datetime.hour,
      location: location,
      temperature: report_hash["main"]["temp"] - 273.0,
      description: report_hash["weather"].first["description"]
    }
  end
end
