require 'coffee-script'
require 'jekyll-assets'

Jekyll::Assets::Hook.register :env, :after_init do

    assets = Pathname.new(__FILE__).dirname.join('..', '_assets')

    append_path( assets.join('js').expand_path.to_s )
    append_path( assets.join('css').expand_path.to_s )
    append_path( assets.join('images').expand_path.to_s )

end
