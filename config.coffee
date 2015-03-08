exports.config =
  # See docs at https://github.com/brunch/brunch/blob/stable/docs/config.md.
  conventions:
    assets:  /^app\/assets\//
    ignored: /^(.*?\/)?[_]\w*/
  modules:
    definition: false
    wrapper: false
  paths:
    public: 'www'
  server:
    port: 2020
  files:
    javascripts:
      joinTo:
        'js/app.js': (path) -> /^app/.test(path)
        'js/vendor.js': (path) -> /^(bower_components|vendor)/.test(path) and !/^bower_components\/ionic/.test(path)
        'js/ionic.bundle.js': (path) -> path is 'bower_components/ionic/js/dist/js/ionic.bundle.js'

    stylesheets:
      joinTo:
        'css/app.css': (path) ->
          return path in ['app/styles/app.scss']

    templates:
      joinTo:
        'js/dontUseMe' : /^app/ # dirty hack for Jade compiling.

  plugins:
    jade:
      pretty: yes # Adds pretty-indentation whitespaces to output (false by default)
    jade_angular:
      modules_folder: 'partials'
      locals: {}

  # Enable or disable minifying of result js / css files.
  # minify: true
