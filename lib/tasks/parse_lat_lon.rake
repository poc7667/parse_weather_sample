desc "Import Sample Weather"
namespace :parse do
  task :lat_lon => :environment do
    lat_lon_file = File.expand_path("../lat_lon.txt", __FILE__)
    city_name_file = File.expand_path("../city_name.txt", __FILE__)
    f = open(city_name_file,'w')
    open(lat_lon_file).each do |pair|
      begin
        values = pair.strip.split
        lat = values.first
        lon = values.last
        res = Geocoder.search("#{lat},#{lon}")
        addr = res.first.data["address_components"].collect do |data|
          data["long_name"] if data.has_key? "long_name"
        end
        f.puts("latitude:#{lat} longitude:#{lon} city_name:#{addr}")
      rescue Exception => e
      end
    end
  end
end