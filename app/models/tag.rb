class Tag < ActiveRecord::Base
  has_and_belongs_to_many :adherents

  validates :libelle,
      presence: true, uniqueness: true
end
