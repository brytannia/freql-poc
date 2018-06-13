class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :lang
  belongs_to :publisher, class_name: 'User'
end