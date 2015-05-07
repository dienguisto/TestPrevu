class VersementsController < ApplicationController
  before_action :only_for_structure_asssurance!
  before_action :set_adherent
  before_action :set_versement, only: [:show, :edit, :update, :destroy]

  # GET /versements
  # GET /versements.json
  def index
    @versements = current_structure_assurance.versements.order('created_at DESC').page params[:page]
  end

  # GET /versements/1
  # GET /versements/1.json
  def show
  end

  # GET /versements/new
  def new
    @versement = Versement.new
    @versement.build_mandataire
  end

  def new_versement

  end

  def redirect_versement
    matricule = params[:adherent][:matricule]
    @adherent = current_structure_assurance.adherents.find_by(matricule: matricule)
    if @adherent
      redirect_to new_adherent_versement_path(@adherent)
    else
      flash[:error] = "L'adhérent avec le matricule #{matricule} n'existe pas sur notre base"
      render :new_versement
    end
  end

  # GET /versements/1/edit
  def edit
  end

  # POST /versements
  # POST /versements.json
  def create
    @versement = Versement.new(versement_params)
    @versement.structure_assurance = current_structure_assurance
    @versement.compte = @adherent.compte

    respond_to do |format|
      if @versement.save
        format.html { redirect_to @adherent, notice: 'Le versement est bien pris en compte.' }
        format.json { render :show, status: :created, location: @versement }
      else
        format.html { render :new }
        format.json { render json: @versement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /versements/1
  # PATCH/PUT /versements/1.json
  def update
    respond_to do |format|
      if @versement.update(versement_params)
        format.html { redirect_to @versement, notice: 'Versement was successfully updated.' }
        format.json { render :show, status: :ok, location: @versement }
      else
        format.html { render :edit }
        format.json { render json: @versement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /versements/1
  # DELETE /versements/1.json
  def destroy
    @versement.destroy
    respond_to do |format|
      format.html { redirect_to versements_url, notice: 'Versement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_adherent
      @adherent = Adherent.find(params[:adherent_id]) unless params[:adherent_id].nil?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_versement
      @versement = Versement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def versement_params
      params.require(:versement).permit(:compte_id, :mandataire_id, :montant,
                                        mandataire_attributes: [:prenom, :nom, :adresse, :type_piece, :numero_piece])
    end
end
