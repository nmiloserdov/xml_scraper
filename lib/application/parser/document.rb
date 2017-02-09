module Application

  DEFAULT_FILE_DIR = 'system/files'

  class Parser::Document

    attr_reader :content

    def initialize(name)
      @name    = name
      @file    = open_file
      @content = get_content
    end

    private

    attr_reader :file

    def open_file
      File.open(@name)
    end

    def get_content
      raise 'File not loaded' unless file
      file.read
    end
  end
end
