# A sample Guardfile
# More info at https://github.com/guard/guard#readme
interactor :off
# logger :level  => :debug

require 'sprockets'
require 'execjs'
require 'handlebars_assets'

::Sprockets.register_engine '.hbs', HandlebarsAssets::TiltHandlebars

root = File.expand_path('../extension/', __FILE__)
%w( popup inject background ).each do |bundle|
  #js
  script_path                      = File.join root, bundle, 'script'
  root_script                      = File.join script_path, "_#{bundle}.js"
  script_output                  =  File.join(root, 'build', "#{bundle}.js")
  script_vendor_path        = File.join(root, 'vendor', 'script')
  script_paths = [
    HandlebarsAssets.path,
    script_vendor_path,
    script_path,
    File.join(root, bundle, 'templates')   #template_path
  ]
  guard 'sprockets', :destination => script_output, :asset_paths => script_paths, :root_file => root_script, :minify => false do
    watch(%r{^#{script_vendor_path}/(.+)})
    watch(%r{^extension/#{bundle}/(script|templates)/(.+)})
  end

  #css
  style_dir                      = File.join root, bundle, 'style'
  root_style                   = File.join style_dir, "_#{bundle}.css"
  style_output               =  File.join(root, 'build', "#{bundle}.css")
  style_vendor_path     = File.join(root, 'vendor', 'style')
  style_paths = [
    style_vendor_path,
    style_dir
  ]
  guard 'sprockets', :destination => style_output, :asset_paths => style_paths, :root_file => root_style, :minify => false do
    watch(%r{^#{style_vendor_path}/(.+)})
    watch(%r{^extension/#{bundle}/(style)/(.+)})
  end
end