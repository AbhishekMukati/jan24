class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  self.abstract_class = true


  def self.ransackable_attributes(auth_object = nil)
    column_names
  end
end
