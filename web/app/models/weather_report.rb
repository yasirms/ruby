class WeatherReport < ApplicationRecord
  belongs_to :location

  def weather_control_overloaded?
    modification_count > 2
  end
end
