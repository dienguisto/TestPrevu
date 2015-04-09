# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Groupe.delete_all
Tag.delete_all

Tag.create(libelle: 'Mugiwara')
Tag.create(libelle: 'Konowa')
Tag.create(libelle: 'Fac dof')

Groupe.create(nom: 'Dahira ESP')
Groupe.create(nom: 'ESP')
Groupe.create(nom: 'Fac science')
Groupe.create(nom: 'Grd Yoff')


StructureAperitrice.create(nom: 'Struct app 1', adresse: 'Adresse struct app 1', date_adhesion: Time.now)
StructureAperitrice.create(nom: 'Struct app 2', adresse: 'Adresse struct app 2', date_adhesion: Time.now)
StructureAperitrice.create(nom: 'Struct app 3', adresse: 'Adresse struct app 3', date_adhesion: Time.now)
StructureAperitrice.create(nom: 'Struct app 4', adresse: 'Adresse struct app 4', date_adhesion: Time.now)


a = StructureAssurance.new(nom: 'Mutuelle 1', adresse: 'Adresse mutuelle 1', date_adhesion: Time.now,
                          numero_agrement: '76543232', couleur: 'red', actif: true, structure_type: 'Mutuelle')
b = StructureAssurance.new(nom: 'Mutuelle 2', adresse: 'Adresse mutuelle 3', date_adhesion: Time.now,
                          numero_agrement: '4365432', couleur: 'yellow', actif: false, structure_type: 'Mutuelle')
c = StructureAssurance.new(nom: 'Mutuelle 3', adresse: 'Adresse mutuelle 3', date_adhesion: Time.now,
                          numero_agrement: '98713232', couleur: 'green', actif: true, structure_type: 'Mutuelle')

Mutuelle.create(:structure_assurance => a)
Mutuelle.create(:structure_assurance => b)
Mutuelle.create(:structure_assurance => c)

d = StructureAssurance.new(nom: 'MicroAssurance 1', adresse: 'Adresse micro assurance 1', date_adhesion: Time.now,
                          numero_agrement: '1213232', couleur: 'gray', actif: true, structure_type: 'MicroAssurance')
e = StructureAssurance.new(nom: 'MicroAssurance 2', adresse: 'Adresse micro assurance 1', date_adhesion: Time.now,
                          numero_agrement: '1454532', couleur: 'cyan', actif: true, structure_type: 'MicroAssurance')
f = StructureAssurance.new(nom: 'MicroAssurance 3', adresse: 'Adresse micro assurance 1', date_adhesion: Time.now,
                          numero_agrement: '1009122', couleur: '#FF0001', actif: false, structure_type: 'MicroAssurance')

MicroAssurance.create(:structure_assurance => d)
MicroAssurance.create(:structure_assurance => e)
MicroAssurance.create(:structure_assurance => f)

g = StructureSanitaire.new(nom: 'FormationSanitaire 1', adresse: 'Adresse FormaSanitaire 1', date_adhesion: Time.now, actif: true, structure_type: 'FormationSanitaire')
h = StructureSanitaire.new(nom: 'FormationSanitaire 2', adresse: 'Adresse FormaSanitaire 2', date_adhesion: Time.now, actif: false, structure_type: 'FormationSanitaire')
i = StructureSanitaire.new(nom: 'FormationSanitaire 3', adresse: 'Adresse FormaSanitaire 3', date_adhesion: Time.now, actif: true, structure_type: 'FormationSanitaire')

f1 = FormationSanitaire.create(:structure_sanitaire => g, :niveau => 0)
f2 = FormationSanitaire.create(:structure_sanitaire => h, :niveau => 3)
f3 = FormationSanitaire.create(:structure_sanitaire => i, :niveau => 2)

j = StructureSanitaire.new(nom: 'Pharmacy 1', adresse: 'Adresse Pharmacie 1', date_adhesion: Time.now, actif: true, structure_type: 'Pharmacy')
k = StructureSanitaire.new(nom: 'Pharmacy 2', adresse: 'Adresse Pharmacie 2', date_adhesion: Time.now, actif: true, structure_type: 'Pharmacy')
l = StructureSanitaire.new(nom: 'Pharmacy 3', adresse: 'Adresse Pharmacie 3', date_adhesion: Time.now, actif: true, structure_type: 'Pharmacy')

p1 = Pharmacy.create(:structure_sanitaire => j)
p2 = Pharmacy.create(:structure_sanitaire => k)
p3 = Pharmacy.create(:structure_sanitaire => l)


Medicament.create(nom: 'Paracétamol')
Medicament.create(nom: 'cac1000 sans dose')
Medicament.create(nom: 'Aspirine')
Medicament.create(nom: 'Néféréti')

c = CategorieActeMedical.create(nom: 'Categorie 1')
d = CategorieActeMedical.create(nom: 'Categorie 2')

TypeActeMedical.create(nom: 'Type 1.1', categorie_acte_medical: c)
TypeActeMedical.create(nom: 'Type 1.2', categorie_acte_medical: c)
TypeActeMedical.create(nom: 'Type 1.3', categorie_acte_medical: c)

TypeActeMedical.create(nom: 'Type 2.1', categorie_acte_medical: d)
TypeActeMedical.create(nom: 'Type 2.2', categorie_acte_medical: d)
TypeActeMedical.create(nom: 'Type 2.3', categorie_acte_medical: d)


f = Formule.create(structure_assurance_id: d.id, nom: "Formule 1 ", periode: 2, occurrence_periode: 1,
                   montant_adhesion: 2500.0, montant_cotisation: 20000.0, ticket_moderateur: 10.0)
g = Formule.create(structure_assurance_id: d.id, nom: "Formule 2 ", periode: 2, occurrence_periode: 1,
                   montant_adhesion: 1000.0, montant_cotisation: 15000.0, ticket_moderateur: 31.0)

#u = User.create(email='pharmacy@gmail.com', password='passer', entity_id=p1.id)
