module Application
  class Parser

    def initialize(file_name=nil)
      @file_name  = file_name
      @files      = load_file_or_files
    end

    def scrape_files!
      process_each_file
    end

    private

    attr_reader :file_name

    def load_file_or_files
      if file_name
        file_loader.find_by_name(name)
      else
        file_loader.load_all
      end
    end

    def process_each_file
      raise 'files are not loaded' unless @files

      @files.each do |file|
        scrape(file)
      end
    end

    def file_loader
      Document::Loader
    end

    def scrape(file)
      content = file.content
      Document::Scraper.new(content).scrape_and_save
    end
  end
end
