class Lang < ApplicationRecord
  has_many :project_langs
  has_many :projects, through: :project_langs
end