class TalentsController < ApplicationController
  # GET /talents
  # GET /talents.json
  def index
    @talents = Talent.all
  end

  # GET /talents/1
  # GET /talents/1.json
  def show
    @talent = Talent.find(params[:id])
  end

  # GET /talents/new
  def new
    @talent = Talent.new
  end

  # GET /talents/1/edit
  def edit
    @talent = Talent.find(params[:id])
  end

  # POST /talents
  # POST /talents.json
  def create
    @talent = Talent.create(talent_params)
    redirect_to talent_path(talent.id)
  end

  # PATCH/PUT /talents/1
  # PATCH/PUT /talents/1.json
  def update
    @talent = Talent.find(params[:id])
    @talent.update(talent_params)
    redirect_to talents_path
  end

  # DELETE /talents/1
  # DELETE /talents/1.json
  def destroy
    @talent = Talent.find(params[:id])
    @talent.destroy
    redirect_to talents_path
  end

  private

  def talent_params
    params.require(:talent).permit(:user_id, :title, :description)
  end
  
end
