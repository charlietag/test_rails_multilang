class ConfigsController < ApplicationController
  before_action :set_config, only: [:show, :edit, :update, :destroy]
  before_action :set_config_arrays, only: [:new, :edit]

  # app/controllers/concerns/set_config_arrays.rb
  #include SetConfigArrays

  # GET /configs
  # GET /configs.json
  def index
    @configs = Config.all
  end

  # GET /configs/1
  # GET /configs/1.json
  def show
  end

  # GET /configs/new
  def new
    @config = Config.new
  end

  # GET /configs/1/edit
  def edit
  end

  # POST /configs
  # POST /configs.json
  def create
    @config = Config.new(config_params)

    respond_to do |format|
      if @config.save
        format.html { redirect_to @config, notice: 'Config was successfully created.' }
        format.json { render :show, status: :created, location: @config }
      else
        format.html { render :new }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configs/1
  # PATCH/PUT /configs/1.json
  def update
    respond_to do |format|
      if @config.update(config_params)
        format.html { redirect_to @config, notice: 'Config was successfully updated.' }
        format.json { render :show, status: :ok, location: @config }
      else
        format.html { render :edit }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configs/1
  # DELETE /configs/1.json
  def destroy
    @config.destroy
    respond_to do |format|
      format.html { redirect_to configs_url, notice: 'Config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config
      @config = Config.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def config_params
      params.require(:config).permit(:name, :config_value)
    end


    # Use this approach, instead of app/controllers/concerns/set_config_arrays.rb
    def set_config_arrays
      @config_names = Array.new
      @config_names.push %W(#{Config.human_attribute_name('name.language')} language)

      @config_values = Array.new
      Config.config_values.keys.each do |v|
        @config_values.push %W{#{Config.human_attribute_name("config.config_value.#{v}")} #{v}}
      end

      #render plain: @config_values.inspect

      #render plain: @config_names[0][0].inspect
      #render plain: @config_names.inspect
    end
end
