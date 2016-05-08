require 'coffee-script'
require 'jekyll-assets'

Jekyll::Assets::Hook.register :env, :init do

    jekyll.sprockets.append_path(
        Pathname.new(__FILE__).dirname.join("..",'js').expand_path.to_s
    )

end
