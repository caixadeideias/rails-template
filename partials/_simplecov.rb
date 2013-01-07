puts "Configuring SimpleCov... ".magenta

after_bundler do
  inject_into_file "spec/spec_helper.rb", :after => "# This file is copied to spec/ when you run 'rails generate rspec:install'" do
  <<BR_CONFIG

  require 'simplecov'
  SimpleCov.start
BR_CONFIG
  end
end

git :add => '.'
git :commit => "-aqm 'SimpleCov configuration'"
puts "\n"
