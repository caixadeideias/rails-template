puts "Adding the defaults javascripts... ".magenta

if would_you_like? "Do you want use CoffeeScript? [y,n]".red
  copy_static_file 'app/assets/javascripts/app.js.coffee'
  copy_static_file 'app/assets/javascripts/init.js.coffee'
else
  copy_static_file 'app/assets/javascripts/app.js'
  copy_static_file 'app/assets/javascripts/init.js'
end

git :add => '.'
git :commit => "-aqm 'Add defaults javascripts'"
