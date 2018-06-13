class ProjectLang < ApplicationRecord
  belongs_to :lang
  belongs_to :project
end