puts "Adding default stuff ...".magenta

copy_static_file 'app/views/layouts/application.html.slim'
gsub_file 'app/views/layouts/application.html.slim', /PROJECT/, @app_name
git :add => '.'
git :commit => "-aqm 'Add application layout in slim.'"

copy_static_file 'app/views/layouts/_flash.html.slim'
git :add => '.'
git :commit => "-aqm 'Add flash partial.'"

copy_static_file 'config/locales/devise.views.en.yml'
copy_static_file 'config/locales/devise.simple_form.en.yml'
git :add => '.'
git :commit => "-aqm 'Add default locales for en.'"

copy_static_file '.gitignore'
git :add => '.'
git :commit => "-aqm 'Add .gitignore'"


gsub_file 'app/controllers/application_controller.rb', "end", "
  protected
  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end
end
"
git :add => '.'
git :commit => "-aqm 'Add render_404 to application controller'"
puts "\n"
