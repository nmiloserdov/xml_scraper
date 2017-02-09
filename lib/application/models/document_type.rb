module Application
  class DocumentType < ActiveRecord::Base
    DUMMY_TYPE = 'empty'.freeze

    has_many :documents
  end
end
