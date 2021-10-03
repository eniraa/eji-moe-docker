require 'yaml'
require 'pathname'

cfg = YAML.load_file('apps.yml')

dirs = Pathname.new(".").children.select { |c| c.directory? }.select { |c| cfg["load"].any? { |re| c.basename.to_s.match(re) } }

dirs.each { |dir|
    begin
        require_relative "#{dir.basename.to_s}/up"
    rescue LoadError
        `docker compose -f #{dir.basename.to_s}/docker-compose.yml up --detach`
    end
}
