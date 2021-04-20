class AvatarsController < ApplicationController
  before_action :set_avatar, only: %i[ show edit update destroy ]

  # GET /avatars or /avatars.json
  def index
    @avatars = Avatar.all
  end

  # GET /avatars/1 or /avatars/1.json
  def show
  end

  # GET /avatars/new
  def new
    @avatar = Avatar.new
  end

  # GET /avatars/1/edit
  def edit
  end

  # POST /avatars or /avatars.json
  def create
    @avatar = Avatar.new(avatar_params)

    respond_to do |format|
      if @avatar.save
        session[:avatar_id] = @avatar.id
        format.html { redirect_to @avatar, notice: "Avatar was successfully created." }
        format.json { render :show, status: :created, location: @avatar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avatars/1 or /avatars/1.json
  def update
    respond_to do |format|
      if @avatar.update(avatar_params)
        format.html { redirect_to @avatar, notice: "Avatar was successfully updated." }
        format.json { render :show, status: :ok, location: @avatar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avatars/1 or /avatars/1.json
  def destroy
    @avatar.destroy
    respond_to do |format|
      format.html { redirect_to avatars_url, notice: "Avatar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avatar
      @avatar = Avatar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def avatar_params
      params.require(:avatar).permit(:name, :image_url)
    end
end
