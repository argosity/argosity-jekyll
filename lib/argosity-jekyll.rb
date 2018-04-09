require 'coffee-script'
require 'jekyll-assets'

Jekyll::Assets::Hook.register :env, :init do

    assets = Pathname.new(__FILE__).dirname.join('..', '_assets')

    jekyll.sprockets.append_path( assets.join('js').expand_path.to_s )
    jekyll.sprockets.append_path( assets.join('css').expand_path.to_s )
    jekyll.sprockets.append_path( assets.join('images').expand_path.to_s )

end
