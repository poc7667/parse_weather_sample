class WeatherLog < ActiveRecord::Base

  default_scope  do
    exclude_columns = %w(created_at updated_at dew_point_temperature visibility_distance precipitation_hour sea_level_pressure precipitation_depth_in_mm)
    filtered_cols = (column_names - exclude_columns.map(&:to_s)).map{|i| "weather_logs."+i}
    self.select(filtered_cols)
  end

  GEOG_FACTORY ||= RGeo::Geographic.spherical_factory(:srid => 4326)
  set_rgeo_factory_for_column(:lonlat, GEOG_FACTORY)
  # RGeo::ActiveRecord::GeometryMixin.set_json_generator(:geojson)
  scope :nearby, lambda { |radius_in_km, lng, lat|
    point = GEOG_FACTORY.point(lng, lat)
    where("ST_DWithin(lonlat, ST_GeomFromText('#{point}'), #{radius_in_km.to_f*1000} )").limit(30)
  }
end
