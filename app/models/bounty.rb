class Bounty < ApplicationRecord
  belongs_to :master, class_name: 'User'
  belongs_to :issue

  attr_accessor :issue_url
end