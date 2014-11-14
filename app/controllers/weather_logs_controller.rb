class WeatherLogsController < ApplicationController
  before_action :set_weather_log, only: [:show, :edit, :update, :destroy]
  include GeoProcess
  # GET /weather_logs
  # GET /weather_logs.json
  def index
    begin
      start_time, end_time = get_start_time_and_end_time(params)
      longitude, latitude = get_longitude_and_latitude(params)
      fields = get_fields(params)
      if longitude and latitude
        q = WeatherLog.nearby(100, longitude, latitude)
      else
        q = WeatherLog.all
      end
      if start_time and end_time
        q = q.where(datetime: start_time..end_time)
      elsif start_time
        q =  q.where("datetime >= ?", start_time)
      elsif end_time
        q =  q.where("datetime <= ?", end_time)
      end

      @weather_logs = q.order(datetime: :asc).limit(2000)

      respond_to do |format|
        if fields
          format.json { render json: @weather_logs.as_json(only: fields)}
        else
          format.json { render json: @weather_logs.as_json(only: get_all_valid_fields)}
        end
      end
    rescue Exception => e
      respond_to do |format|
        format.json { render json: {status: "Invalid Request #{e}"} }
      end
    end
  end

  # GET /weather_logs/1
  # GET /weather_logs/1.json
  def show
  end

  # GET /weather_logs/new
  def new
    @weather_log = WeatherLog.new
  end

  # GET /weather_logs/1/edit
  def edit
  end

  # POST /weather_logs
  # POST /weather_logs.json
  def create
    @weather_log = WeatherLog.new(weather_log_params)

    respond_to do |format|
      if @weather_log.save
        format.html { redirect_to @weather_log, notice: 'Weather log was successfully created.' }
        format.json { render :show, status: :created, location: @weather_log }
      else
        format.html { render :new }
        format.json { render json: @weather_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weather_logs/1
  # PATCH/PUT /weather_logs/1.json
  def update
    respond_to do |format|
      if @weather_log.update(weather_log_params)
        format.html { redirect_to @weather_log, notice: 'Weather log was successfully updated.' }
        format.json { render :show, status: :ok, location: @weather_log }
      else
        format.html { render :edit }
        format.json { render json: @weather_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weather_logs/1
  # DELETE /weather_logs/1.json
  def destroy
    @weather_log.destroy
    respond_to do |format|
      format.html { redirect_to weather_logs_url, notice: 'Weather log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weather_log
      @weather_log = WeatherLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weather_log_params
      params.require(:weather_log).permit(:latitude, :longitude, :datatime, :air_temperature)
    end
end
