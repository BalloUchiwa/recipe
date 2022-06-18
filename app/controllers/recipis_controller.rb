class RecipisController < ApplicationController
  before_action :set_recipi, only: %i[ show edit update destroy ]

  # GET /recipis or /recipis.json
  def index
    @recipis = Recipi.all
  end

  # GET /recipis/1 or /recipis/1.json
  def show
  end

  # GET /recipis/new
  def new
    @recipi = Recipi.new
  end

  # GET /recipis/1/edit
  def edit
  end

  def search
    @recipis = Recipi.where("title LIKE ?", "%#{params[:q]}")

  end

  # POST /recipis or /recipis.json
  def create
    @ingredients = params[:recipi].delete(:recipi_ingredients)
    @recipi = Recipi.new(recipi_params)
    respond_to do |format|
      if @recipi.save
        @recipi.create_ingredients(@ingredients) if @ingredients.present?
        format.html { redirect_to recipi_url(@recipi), notice: "Recipi was successfully created." }
        format.json { render :show, status: :created, location: @recipi }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipis/1 or /recipis/1.json
  def update
    @ingredients = params[:recipi].delete(:recipi_ingredients)
    respond_to do |format|
      if @recipi.update(recipi_params)
        @recipi.create_ingredients(@ingredients) if @ingredients.present?
        format.html { redirect_to recipi_url(@recipi), notice: "Recipi was successfully updated." }
        format.json { render :show, status: :ok, location: @recipi }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipis/1 or /recipis/1.json
  def destroy
    @recipi.destroy

    respond_to do |format|
      format.html { redirect_to recipis_url, notice: "Recipi was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipi
      @recipi = Recipi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipi_params
      params.require(:recipi).permit(:title, :recipi_ingredients, :cook_time, :prep_time, :ratings, :cuisine, :category, :author, :image)
    end
end
