module Application
  class Document < ActiveRecord::Base
    belongs_to :type, class_name: 'DocumentType'

    # show_attribute('export','fcsNotificationZP','printForm','url')
    def show_attribute(*attribute_hash)
      hash_content = Hash.from_xml(self.content)

      attribute_hash.each do |key|
        hash_content = hash_content.public_send(:dig, key.to_s)
      end
      hash_content
    end

    private

    def scraper
      Nokogiri::XML
    end
  end
end
