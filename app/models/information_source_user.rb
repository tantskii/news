class InformationSourceUser < ApplicationRecord
  belongs_to :user
  belongs_to :information_source
end
