puts "Configuring the simple_form... ".magenta

after_bundler do
  generate 'simple_form:install --bootstrap'
  git :add => '.'
  git :commit => "-aqm 'Configure simple_form.'"
end
