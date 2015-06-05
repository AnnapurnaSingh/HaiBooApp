# This file is used by Rack-based servers to start the application.


Bundler.require(*Rails.groups)

Dotenv::Railtie.load

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
