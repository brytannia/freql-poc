class Project < ApplicationRecord
  belongs_to :main_lang, class_name: 'Lang'
  has_many :issues

  has_many :project_langs
  has_many :langs, through: :project_langs
end