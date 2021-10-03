require 'yaml'

apps = YAML.load_file('apps.yml')["load"]

apps.each { |dir|
    begin
        require_relative "#{dir}/up"
    rescue LoadError
        `docker-compose -f #{dir}/docker-compose.yml up --detach`
    end
}
