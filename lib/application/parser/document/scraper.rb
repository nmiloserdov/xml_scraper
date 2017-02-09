module Application
  class Parser::Document::Scraper
    def initialize(content)
      @content = content
    end

    def scrape_and_save
      content_in_xml = scraper.parse(@content)
      type = scrape_type_from_dictionary(content_in_xml)

      Document.create(
        type: create_or_load_type(type),
        content: @content
      )
    end

    private

    def scrape_type_from_dictionary(xml)
      # detect document type from dictionary
      hash_type = Application::DOCUMENT_TYPES.detect do |key, value|
        result = xml.at_xpath(value).present?
      end

      if hash_type.present? 
        hash_type.first
      else
        DocumentType::DUMMY_TYPE
      end
    end

    def create_or_load_type(type)
      type = Parser::Document::Type.find_or_create_from!(type)
    end

    def scraper
      Nokogiri::XML
    end
  end
end
