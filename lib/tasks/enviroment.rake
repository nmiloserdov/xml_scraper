desc "Pre-requisite for tasks - Set environment, connect to DB"
task :environment do |t, args|
  Application.db_connect
end
