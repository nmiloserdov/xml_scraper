module Application
  class Parser::Document::Type
    def self.find_or_create_from!(name)
      doc = DocumentType.where(name: name).first
      doc.present? ? doc : DocumentType.create(name: name)
    end
  end
end
