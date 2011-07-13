require 'fileutils'
require 'yaml'
require 'yui/compressor'

desc 'Generate documentation with docco'
task :doc do
  assets = YAML.load_file 'assets.yml'
  sh "docco #{ assets['document'].join ' ' }"
  # FileUtils.mv 'docs', 'public/docs', :force=>true
end

desc 'minify js files'
task :min do
  assets = YAML.load_file("assets.yml")
  outstream = assets[ 'javascripts' ].collect{ |f| IO.read("#{f}") }
  out = File.new(assets['outputjs'], 'w')
  compressor = YUI::JavaScriptCompressor.new(:munge => true)
  out.write(compressor.compress(outstream.join(' ')))
end

