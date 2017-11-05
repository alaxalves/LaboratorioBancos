class PersonagemsController < ApplicationController
  before_action :set_personagem, only: [:show, :edit, :update, :destroy]

  # GET /personagems
  # GET /personagems.json
  def index
    @personagems = Personagem.all
  end

  # GET /personagems/1
  # GET /personagems/1.json
  def show
  end

  # GET /personagems/new
  def new
    @personagem = Personagem.new
  end

  # GET /personagems/1/edit
  def edit
  end

  # POST /personagems
  # POST /personagems.json
  def create
    @personagem = Personagem.new(personagem_params)

    respond_to do |format|
      if @personagem.save
        format.html { redirect_to @personagem, notice: 'Personagem was successfully created.' }
        format.json { render :show, status: :created, location: @personagem }
      else
        format.html { render :new }
        format.json { render json: @personagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personagems/1
  # PATCH/PUT /personagems/1.json
  def update
    respond_to do |format|
      if @personagem.update(personagem_params)
        format.html { redirect_to @personagem, notice: 'Personagem was successfully updated.' }
        format.json { render :show, status: :ok, location: @personagem }
      else
        format.html { render :edit }
        format.json { render json: @personagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personagems/1
  # DELETE /personagems/1.json
  def destroy
    @personagem.destroy
    respond_to do |format|
      format.html { redirect_to personagems_url, notice: 'Personagem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personagem
      @personagem = Personagem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personagem_params
      params.require(:personagem).permit(:nome, :nome_filme, :nome_ator, :cache_ator)
    end
end
