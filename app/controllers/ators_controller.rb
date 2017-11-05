class AtorsController < ApplicationController
  before_action :set_ator, only: [:show, :edit, :update, :destroy]

  # GET /ators
  # GET /ators.json
  def index
    @ators = Ator.all
  end

  # GET /ators/1
  # GET /ators/1.json
  def show
  end

  # GET /ators/new
  def new
    @ator = Ator.new
  end

  # GET /ators/1/edit
  def edit
  end

  # POST /ators
  # POST /ators.json
  def create
    @ator = Ator.new(ator_params)

    respond_to do |format|
      if @ator.save
        format.html { redirect_to @ator, notice: 'Ator was successfully created.' }
        format.json { render :show, status: :created, location: @ator }
      else
        format.html { render :new }
        format.json { render json: @ator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ators/1
  # PATCH/PUT /ators/1.json
  def update
    respond_to do |format|
      if @ator.update(ator_params)
        format.html { redirect_to @ator, notice: 'Ator was successfully updated.' }
        format.json { render :show, status: :ok, location: @ator }
      else
        format.html { render :edit }
        format.json { render json: @ator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ators/1
  # DELETE /ators/1.json
  def destroy
    @ator.destroy
    respond_to do |format|
      format.html { redirect_to ators_url, notice: 'Ator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ator
      @ator = Ator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ator_params
      params.require(:ator).permit(:nome, :nome_artistico, :seguro_social, :nacionalidade, :idade)
    end
end
