class WeatherReportsController < ApplicationController
  def index
    location = Location.find_by!(name: params[:location])
    render json: location.weather_reports.order(day: :asc).as_json
  end

  def update
    weather_report = WeatherReport.find(params[:id])

    weather_report.update!(
      weather_report_params.merge(
        modification_count: weather_report.modification_count + 1
      )
    )

    if weather_report.weather_control_overloaded?
      render json: weather_report.as_json
        .merge(warning: "High weather control load! Modifications: #{weather_report.modification_count}")
    else
      render json: weather_report.as_json
    end
  end

  private

  def weather_report_params
    params.require(:weather_report).permit(:temperature, :description)
  end
end
