class CreateWeatherReports < ActiveRecord::Migration[6.0]
  def change
    create_table :weather_reports do |t|
      t.date :day
      t.integer :hour
      t.references :location
      t.float :temperature
      t.string :description
      t.integer :modification_count, default: 0

      t.timestamps
    end
  end
end
