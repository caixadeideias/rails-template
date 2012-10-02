puts "Adding default stuff ...".magenta

copy_static_file 'app/views/layouts/application.html.slim'
gsub_file 'app/views/layouts/application.html.slim', /PROJECT/, @app_name
git :add => '.'
git :commit => "-aqm 'Add application layout in slim.'"

gsub_file 'config/environments/development.rb', "::Application.configure do", "::Application.configure do
  Slim::Engine.set_default_options :pretty => true"
git :add => '.'
git :commit => "-aqm Add Slim pretty option"

copy_static_file 'app/views/layouts/_flash.html.slim'
git :add => '.'
git :commit => "-aqm 'Add flash partial.'"

copy_static_file 'config/locales/devise.views.en.yml'
copy_static_file 'config/locales/devise.simple_form.en.yml'
copy_static_file 'config/locales/devise.en.yml'
copy_static_file 'config/locales/devise.pt-BR.yml'
git :add => '.'
git :commit => "-aqm 'Add default locales for en and pt-BR.'"

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
