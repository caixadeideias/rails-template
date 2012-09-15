if would_you_like? "Brazilian locale and timezone? [y,n]"
  inject_into_file "config/application.rb", :after => "class Application < Rails::Application" do
    <<BR_CONFIG

    # Brasilian locale and timezone
    config.i18n.default_locale = :"pt-BR"
    config.time_zone = "Brasilia"
BR_CONFIG
  end
end

git :add => '.'
git :commit => "-aqm 'Brazilian locale and timezone set'"
puts "\n"
