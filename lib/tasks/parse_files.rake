namespace :files do

  namespace :xml_scraping do

    desc "Load and parse xml files"
    task :start, [:file_name] => :environment do |t, args|
      file_name = file_name ? file_name : nil
      Application::Parser.new(file_name).scrape_files!
    end
  end
end
