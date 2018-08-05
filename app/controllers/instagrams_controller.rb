class InstagramsController < ApplicationController
  before_action :login_check, only: %i[new edit show destroy]
  before_action :set_instagram, only: %i[show edit update destroy]
  # GET /instagrams
  # GET /instagrams.json
  def index
    @instagrams = Instagram.all
  end

  # GET /instagrams/1
  # GET /instagrams/1.json
  def show
    @instagram = Instagram.find(params[:id])
    @user = User.find_by(id: @instagram.user_id)
    @favorite = current_user.favorites.find_by(instagram_id: @instagram.id)
  end

  # GET /instagrams/new
  def new
    @instagram = if params[:back]
                   Instagram.new(instagram_params)
                 else
                   Instagram.new
                 end
  end

  # GET /instagrams/1/edit
  def edit; end

  # POST /instagrams
  # POST /instagrams.json
  def create
    @instagram = Instagram.new(instagram_params)
    @instagram.user_id = current_user.id
    respond_to do |format|
      if @instagram.save
        InstaMailer.insta_mail(@instagram).deliver
        format.html { redirect_to @instagram, notice: '投稿しました' }
        format.json { render :show, status: :created, location: @instagram }
      else
        format.html { render :new }
        format.json { render json: @instagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instagrams/1
  # PATCH/PUT /instagrams/1.json
  def update
    respond_to do |format|
      if @instagram.update(instagram_params)
        format.html { redirect_to @instagram, notice: 'Instagram was successfully updated.' }
        format.json { render :show, status: :ok, location: @instagram }
      else
        format.html { render :edit }
        format.json { render json: @instagram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instagrams/1
  # DELETE /instagrams/1.json
  def destroy
    @instagram.destroy
    respond_to do |format|
      format.html { redirect_to instagrams_url, notice: 'Instagram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    @instagram = Instagram.new(instagram_params)
    @instagram.user_id = current_user.id
    render :new if @instagram.invalid?
  end

  def login_check
    if logged_in?
    else redirect_to new_session_path
    end
  end

  private

  def set_instagram
    @instagram = Instagram.find(params[:id])
  end

  def instagram_params
    params.require(:instagram).permit(:image, :content, :image_cache)
  end
end
