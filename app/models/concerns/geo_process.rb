require 'active_support/concern'

module GeoProcess
  include ActiveSupport::Concern
  def get_longitude_and_latitude(params)
    locations = params["location"].split(',')
    if locations.length == 2 and locations.first.to_f.is_a? Float and  locations.last.to_f.is_a? Float
      return locations.first, locations.last
    else
      begin
        geo = Geocoder.search(params["location"]).first
        ap([geo.longitude, geo.latitude])
        return geo.longitude, geo.latitude
      rescue Exception => e
        return false, false # wrong location
      end
    end
  end

  def get_start_time_and_end_time(params)
      start_time = Date.parse(params["start_time"])   if params.has_key?"start_time"
      end_time = Date.parse(params["end_time"])  if params.has_key?"end_time"
      return start_time, end_time
  end

  def get_fields(params)
      if params.has_key? "fields"
        fields =  params["fields"].split ','
        fields << "datetime"
        return fields
      else
        return nil
      end
  end

  def get_all_valid_fields
    [:datetime,
    :air_temperature,
    :report_type,
    :wban,
    :weather_station,
    :sea_level_pressure,
    :dew_point_temperature,
    :elevation,
    :visibility_distance,
    :precipitation_hour,
    :precipitation_depth_in_mm,
    :latitude,
    :longitude]
  end

end

# module RemoteFocus
#   include ActiveSupport::Concern

#   def setup_cgi(camera_param)
#     cgi_suffix={
#       status: "/cgi-bin/admin/remotefocus.cgi?function=getstatus",
#       zoom: "/cgi-bin/admin/remotefocus.cgi?function=zoom&direction=direct&position=",
#       snapshot: "/cgi-bin/viewer/video.jpg",
#       full_scan: "/cgi-bin/admin/remotefocus.cgi?function=scan",
#       local_scan: "/cgi-bin/admin/remotefocus.cgi?function=auto",
#       focus_value: "/cgi-bin/admin/remotefocus.cgi?function=getparam&position=",
#       model_name:"/cgi-bin/admin/remotefocus.cgi?function=getparam&system_info_modelname"
#     }
#     cgi = cgi_suffix.inject({}) do |h, (k, v)|
#       h[k.to_sym] = "http://#{camera_param[:ip]}#{v}"; h
#     end
#     cgi[:snapshot] += "?streamid=#{camera_param[:stream_no]}" if @camera[:stream_no] < 999
#     return cgi
#   end


#   def get_cgi_value(camera, cgi, search_key)
#     cgi_request(camera, cgi).body.each_line do |line|
#       key, value = line.split('=').first, line.match(/(\')(.*)(\')/).captures[1]
#       return value if search_key == key
#     end
#   end

#   def wait_task_done(camera, cgi, wait_key, expect_value, sleep_time=0.5)
#     get_value=nil
#     get_status={}
#     min_retry = 10
#     end_time = Time.now
#     counter = 0

#     until (expect_value==get_value) and (counter > min_retry) # busy waiting for focus stop
#       cgi_request(camera, cgi[:status]).body.each_line do |line|
#         key, value = line.split('=').first, line.match(/(\')(.*)(\')/).captures[1]
#         get_status[key.to_sym] = value.to_i
#         if wait_key == key
#           if expect_value==get_value
#             counter += 1
#           else
#             counter = 0
#             end_time = Time.now + sleep_time
#           end
#           get_value = value.to_i
#         end
#       end
#       sleep(sleep_time)
#     end
#     camera[:focus_motor_pos]=get_status[:remote_focus_focus_motor]
#     return end_time
#   end

#   def cgi_request(camera, cgi)
#     begin
#       Timeout::timeout(3) do
#         uri = URI(cgi)
#         req = Net::HTTP::Get.new(uri.request_uri)
#         req.basic_auth(camera[:username], camera[:password]) if camera[:auth]
#         return Net::HTTP.start(uri.host) {|http| http.request(req) }
#       end
#     rescue Timeout::Error
#       return false
#     end
#   end

#   def move_zoom_motor(camera, cgi)
#     cgi_request(camera, "#{cgi[:zoom]}#{camera[:zoom_motor_pos]}")
#     zoom_motor_enable=1
#     wait_task_done(camera, cgi, "remote_focus_zoom_enable", 0)
#   end
# end

# # Template Method
# class LocalScan
#   include RemoteFocus
#   def focus(context)
#     cgi_request(context.camera, context.cgi[:local_scan])
#     wait_task_done(context.camera, context.cgi, "remote_focus_focus_enable", 0)
#   end
# end

# class FullScan
#   include RemoteFocus
#   def focus(context)
#     # http://stackoverflow.com/questions/3159797/is-it-possible-to-call-a-module-function-from-inside-a-class-that-is-also-in-tha
#     cgi_request(context.camera, context.cgi[:full_scan])
#     wait_task_done(context.camera, context.cgi, "remote_focus_focus_enable", 0)
#   end
# end
# class AfTask
#   include RemoteFocus
#   attr_accessor :method, :camera, :cgi

#   def initialize(camera, cgi, method)
#     @camera = camera
#     @cgi = cgi
#     @method = method # Delegate pattern
#   end

#   def getsnapshot
#     started_at = Time.now
#     end_at = @method.focus(self) # Pass Context Class to delegate class
#     @camera[:time_elpased] = (end_at - started_at).to_f
#     return cgi_request(@camera, @cgi[:snapshot]).body # getsnapshot
#   end

#   def get_focus_values
#     focus_motor_end = get_cgi_value(@camera, @cgi[:status], "remote_focus_focus_motor_end").to_i
#     focus_values = 0.step(focus_motor_end).inject({}) do |h, position|
#       focus_value = get_cgi_value(@camera, "#{@cgi[:focus_value]}#{position}", "remote_focus_focus_value").to_i
#       h[position] = focus_value if focus_value > 0
#       h
#     end
#   end
# end

# class RemoteFocusWork
#   include RemoteFocus

#   def initialize(remote_focu_record, camera_param)
#     @camera = camera_param.dup
#     @cgi = setup_cgi(@camera)
#     @remote_focu = remote_focu_record
#   end

#   def get_af_task
#     full_scan, local_scan = FullScan.new, LocalScan.new
#     if @camera[:focus_mode]=="local_af"
#       return AfTask.new(@camera, @cgi, local_scan)
#     else
#       return AfTask.new(@camera, @cgi, full_scan)
#     end
#   end

#   def save_snapshot
#     temp_file = Tempfile.create('tmp')
#     raw_shot = @af_task.getsnapshot
#     File.open(temp_file.path, 'wb') do |f|
#       f.write(raw_shot)
#     end
#     return temp_file.path
#   end

#   def save_record(snapshot_path)
#     focus_values = @af_task.get_focus_values
#     @remote_focu.remote_focu_logs.create(
#       zoom_position: @camera[:zoom_motor_pos],
#       focus_position: @camera[:focus_motor_pos],
#       snapshot: File.open(snapshot_path),
#       max_focus_value: focus_values.values.max,
#       focus_values: focus_values.to_s,
#       time_elapse: @camera[:time_elpased]
#     )
#     @remote_focu.save
#   end

#   def check_status(tool_cvt_remote_focu)
#     begin
#       get_cgi_value(@camera, @cgi[:status], "remote_focus_focus_motor_end").to_i
#       true
#     rescue Exception => e
#       tool_cvt_remote_focu.errors.add(:format,"Invalid Setting, check URL and check if the cameara is support remote focus")
#       false
#     end
#   end

#   def start_work
#     motor = @camera[:motor]
#     @af_task = get_af_task

#     motor[:start_at].step( motor[:end_at], motor[:step]) do |zoom_motor_pos|
#       @camera[:zoom_motor_pos] = zoom_motor_pos
#       move_zoom_motor(@camera, @cgi)
#       motor[:iteration].times do |current_iteration|
#         @camera[:current_iteration]=current_iteration
#         ap(@camera)
#         snapshot_path = save_snapshot
#         save_record(snapshot_path)
#       end
#     end

#   end

# end
