class User < ApplicationRecord
  include Elasticsearch::Model
  
  index_name Rails.env + 'sample_project_users'
  document_type :user

  mappings do
    indexes :id, type: :long
    indexes :name, type: :text
  end

  def self.search(query)
    query = <<-END
      {
        "query": {
          "bool": {
            "must": [
              {"match": {"name": "#{query}"}}
            ]
          }
        }
      } 
    END
    User.__elasticsearch__.search(query).records
  end

  def as_indexed_json(options = {})
    self.as_json(only: [:id, :name])
  end
end
