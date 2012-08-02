require './app'

guard('sprockets2',
      :sprockets   => App.sprockets,
      :assets_path => App.assets_path,
      :precompile  => App.precompile,
      :digest      => App.digest_assets) do

  watch %r(^assets/.+$)
  watch 'app.rb'
end
