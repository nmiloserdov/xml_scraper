require 'yaml'
require 'active_record'
require 'nokogiri'

require 'application/parser'
require 'application/parser/document'
require 'application/parser/document/loader'
require 'application/parser/document/type'
require 'application/parser/document/scraper'
require 'application/parser/document/types/types'

lib_path = File.dirname File.absolute_path(__FILE__)
Dir[lib_path + "/application/models/*.rb"].each { |file| require file  }

module Application

  ROOT_DIR ||= ::File.expand_path(::File.dirname __dir__)

  @root ||= ::File.expand_path ::File.dirname __dir__
  @secrets = YAML.load_file([@root,'config','secrets.yml'].join("/"))
  TOKEN = @secrets.dig("token")

  def self.start
    require 'pry'; binding.pry
  end

  def self.db_connect
    db_config = YAML.load_file([@root,'db','database.yml'].join("/"))
    ActiveRecord::Base.establish_connection db_config.dig("development")
  end
end
