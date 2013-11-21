# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

@config = YAML.load_file('./amzn.yaml')
Amazon::Ecs.options = {
  :associate_tag => @config['associate_tag'],
  :AWS_access_key_id => @config['AWS_access_key_id'],
  :AWS_secret_key => @config['AWS_secret_key'],
  :country => 'jp'
}
