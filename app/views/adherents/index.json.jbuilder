json.array!(@adherents) do |adherent|
  json.extract! adherent, :id, :nom, :prenom, :status_matrimonial, :date_de_naissance, :lieu_de_naissance, :adresse, :telephone1, :telephone2, :email, :username, :status, :payer, :last_activation, :last_suspension, :last_delete, :paiement_date, :montant_cotisation
  json.url adherent_url(adherent, format: :json)
end
