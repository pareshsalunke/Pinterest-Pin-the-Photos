class ReportPicturesController < ApplicationController
  # GET /report_pictures
  # GET /report_pictures.json
  def index
    @report_pictures = ReportPicture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @report_pictures }
    end
  end

  # GET /report_pictures/1
  # GET /report_pictures/1.json
  def show
    @report_picture = ReportPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report_picture }
    end
  end

  # GET /report_pictures/new
  # GET /report_pictures/new.json
  def new
    @report_picture = ReportPicture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report_picture }
    end
  end

  # GET /report_pictures/1/edit
  def edit
    @report_picture = ReportPicture.find(params[:id])
  end

  # POST /report_pictures
  # POST /report_pictures.json
  def create
    @report_picture = ReportPicture.new(params[:report_picture])

    respond_to do |format|
      if @report_picture.save
        format.html { redirect_to @report_picture, notice: 'Report picture was successfully created.' }
        format.json { render json: @report_picture, status: :created, location: @report_picture }
      else
        format.html { render action: "new" }
        format.json { render json: @report_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /report_pictures/1
  # PUT /report_pictures/1.json
  def update
    @report_picture = ReportPicture.find(params[:id])

    respond_to do |format|
      if @report_picture.update_attributes(params[:report_picture])
        format.html { redirect_to @report_picture, notice: 'Report picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_pictures/1
  # DELETE /report_pictures/1.json
  def destroy
    @report_picture = ReportPicture.find(params[:id])
    @report_picture.destroy

    respond_to do |format|
      format.html { redirect_to report_pictures_url }
      format.json { head :no_content }
    end
  end
end
