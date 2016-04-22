class University < ActiveRecord::Base
  belongs_to :created_by
  belongs_to :updated_by
end
