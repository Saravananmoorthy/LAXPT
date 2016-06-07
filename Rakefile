require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

properties = YAML.load_file('properties.yml')

desc "Run testing to all hosts"
task :spec => 'testing:all'

namespace :testing do
  task :all => properties.keys.map {|key| 'testing:' + key.split('.')[0] }
  properties.keys.each do |key|
    desc "Run testing to #{key}"
    RSpec::Core::RakeTask.new(key.split('.')[0].to_sym) do |t|
      ENV['TARGET_HOST'] = key
      t.pattern = 'spec/{' + properties[key][:roles].join(',') + '}/*_spec.rb'
    end
  end
end
