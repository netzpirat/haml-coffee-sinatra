require 'bundler'
Bundler.require

class App < Sinatra::Base
  set :sprockets,     Sprockets::Environment.new(root)
  set :precompile,    [ /\w+\.(?!js\.coffee).+/, /application\.js\.coffee$/ ]
  set :assets_prefix, '/assets'
  set :digest_assets, false
  set(:assets_path)   { File.join public_folder, assets_prefix }

  configure do
    sprockets.append_path File.join(root, 'assets', 'javascripts')
    sprockets.append_path File.dirname(HamlCoffeeAssets.helpers_path)

    Sprockets::Helpers.configure do |config|
      config.environment = sprockets
      config.prefix      = assets_prefix
      config.digest      = digest_assets
      config.public_path = public_folder
    end
  end

  helpers do
    include Sprockets::Helpers
  end

  get '/' do
    haml :index
  end
end
