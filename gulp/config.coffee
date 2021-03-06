src  = "src"
dev  = "dev"
prod = "dist"

module.exports =
  browserSync:
    open: false
    server:
      baseDir: [dev, '.']
      middleware: (req, res, next) ->
        req.url = '/index.html' if (/^[^\.]*$/.test(req.url)) # Matches everything that does not contain '.' (period). Used for clean URLs (eg '/login')
        next()
  cjsx:
    src: "#{src}/scripts/**/*.{coffee,cjsx}"
    dest: "#{dev}/scripts"
    options:
      bare: true
  clean:
    dirs: [dev, prod]
  copyDev:
    dirs: ["#{src}/**", "!#{src}/{scripts,styles}{,/**}"]
    dest: dev
  copyProd:
    dirs: ["#{dev}/**", "!#{dev}/{scripts,styles,images}{,/**}", "!#{dev}/index.html"]
    dest: prod
  cssmin:
    src: "#{dev}/styles{,/**}"
    dest: prod
    options: {}
  dev:
    dev: dev
    src: src
  imagemin:
    src: "#{dev}/images{,/**}"
    dest: prod
    options:
      progressive: true
  indexProd:
    src: "#{dev}/index.html"
    dest: prod
    options:
      js: 'scripts/main.js'
  jsmin:
    src: "#{dev}/scripts/main"
    dest: "#{prod}/scripts/main.js"
  sass:
    src: "#{src}/styles/**/*.{sass,scss}"
    dest: "#{dev}/styles"
    autoprefixerOptions:
      browsers: ['> 1%', 'last 2 version']
    options:
      indentedSyntax: true
      imagePath: 'images'
  uglify:
    src: "#{prod}/scripts/main.js"
    dest: "#{prod}/scripts/main.js"
    options: {}