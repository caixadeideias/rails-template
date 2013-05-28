if would_you_like? "Brazilian locale and timezone? [y,n]"
  inject_into_file "config/application.rb", :after => "# config.time_zone = 'Central Time (US & Canada)'" do
    <<BR_CONFIG

    # Brazilian locale and timezone
    config.i18n.locale = :"pt-BR"
    config.i18n.default_locale = :"pt-BR"
    config.time_zone = "Brasilia"
BR_CONFIG
  end
end

git :add => '.'
git :commit => "-aqm 'Brazilian locale and timezone set'"
puts "\n"
