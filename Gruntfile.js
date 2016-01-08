module.exports = function (grunt) {
    require('load-grunt-tasks')(grunt);

    grunt.registerTask('compile-css', ['sass:app', 'autoprefixer:app']);
    grunt.registerTask('compile-js', ['browserify:app', 'uglify:app']);

    grunt.registerTask('init', ['compile-js', 'compile-css', 'htmlmin', 'copy', 'inline']);

    grunt.registerTask('default', ['watch']);

    var WatchConf = function(files, tasks) {
        return {
            files: files,
            tasks: tasks,
            options: {
                livereload: true,
                interrupt: true
            }
        }
    };

    var HtmlMinConf = function(files) {
        return {
            options: {
                removeComments: true,
                collapseWhitespace: true
            },
            files: files
        }
    };

    grunt.initConfig({

        /**
         * Watch
         */
        watch: {
            index: new WatchConf(['src/*.html'], ['htmlmin:index']),
            partials: new WatchConf(['src/terminal/*.html'], ['htmlmin:terminal']),
            javascript: new WatchConf(['src/coffee/**/*.coffee'], ['compile-js']),
            css: new WatchConf(['src/sass/**/*.s[ac]ss'], ['compile-css']),
            images: new WatchConf(['src/images/**/*.{png,jpg,gif}'], ['newer:imagemin'])
        },

        /**
         * HTML
         */
        htmlmin: {
            index: new HtmlMinConf({
                'web/index.html': 'src/index.html'
            }),
            terminal: new HtmlMinConf([
                {
                    expand: true,
                    cwd: 'src/terminal/',
                    src: ['**/*.html'],
                    dest: 'web/terminal/'
                }
            ])
        },

        /**
         * CSS
         */
        sass: {
            app: {
                options: {
                    style: 'compressed',
                    loadPath: 'src/sass'
                },
                files: {
                    'src/css/app.min.css': 'src/sass/app.sass'
                }
            }
        },
        autoprefixer: {
            options: {
                // Task-specific options go here.
            },
            app: {
                src: 'src/css/app.min.css',
                dest: 'web/assets/app.min.css'
            }
        },

        /**
         * Javascript
         */
        browserify: {
            app: {
                files: {
                    'web/assets/app.js': ['src/coffee/app.coffee']
                },
                options: {
                    transform: ['coffeeify']
                }
            }
        },
        uglify: {
            app: {
                files: {
                    'web/assets/app.min.js': ['web/assets/app.js']
                }
            }
        },

        /**
         * Images
         */
        imagemin: {
            dynamic: {
                files: [{
                    expand: true,
                    cwd: 'src/images/',
                    src: ['**/*.{png,jpg,gif}'],
                    dest: 'web/assets/images/'
                }]
            }
        },

        /**
         * Copy
         */
        copy: {
            htaccess: {
                src: 'src/.htaccess',
                dest: 'web/.htaccess'
            }
        },

        /**
         * Deploy
         */
        shell: {
            deploy: {
                command: 'git subtree push --prefix web origin gh-pages'
            }
        },
        inline: {
            index: {
                src: 'web/index.html',
                dest: 'web/index.html'
            }
        }
    });

    grunt.registerTask('deploy', ['init', 'shell:deploy']);
};
