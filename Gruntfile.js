module.exports = function (grunt) {
    // load all grunt tasks matching the ['grunt-*', '@*/grunt-*'] patterns
    require('load-grunt-tasks')(grunt);

    /**
     * TODO move css.map
     */
    grunt.registerTask('compile-css', ['sass:app', 'autoprefixer:app']);
    grunt.registerTask('compile-js', ['browserify:app', 'uglify:app']);

    grunt.registerTask('init', ['compile-js', 'compile-css', 'htmlmin', 'imagemin']);

    grunt.registerTask('default', ['watch']);

    grunt.initConfig({

        /**
         * Watch
         */
        watch: {
            index: {
                files: ['src/*.html'],
                tasks: ['htmlmin:index'],
                options: {
                    livereload: 35729
                }
            },
            partials: {
                files: ['src/partials/*.html'],
                tasks: ['htmlmin:partials'],
                options: {
                    livereload: 35729
                }
            },
            directive: {
                files: ['src/directive/*.html'],
                tasks: ['htmlmin:directive'],
                options: {
                    livereload: 35729
                }
            },
            javascript: {
                files: ['src/coffee/*.coffee','src/coffee/**/*.coffee','src/coffee/**/**/*.coffee'],
                tasks: ['compile-js'],
                options: {
                    interrupt: true,
                    livereload: 35729
                }
            },
            css: {
                files: ['src/sass/*.sass','src/sass/**/*.sass','src/sass/**/**/*.sass'],
                tasks: ['compile-css'],
                options: {
                    interrupt: true,
                    livereload: 35729
                }
            },
            images: {
                files: ['src/images/*.{png,jpg,gif}', 'src/images/**/*.{png,jpg,gif}'],
                tasks: ['newer:imagemin'],
                options: {
                    interrupt: true,
                    livereload: 35729
                }
            }
        },

        /**
         * HTML
         */
        htmlmin: {
            index: {
                options: {
                    removeComments: true,
                    collapseWhitespace: true
                },
                files: {
                    'web/index.html': 'src/index.html'
                }
            },
            partials: {
                options: {
                    removeComments: true,
                    collapseWhitespace: true
                },
                files: {
                    'web/partials/AboutMe.html': 'src/partials/AboutMe.html',
                    'web/partials/Experience.html': 'src/partials/Experience.html',
                    'web/partials/Skills.html': 'src/partials/Skills.html',
                    'web/partials/Realisations.html': 'src/partials/Realisations.html',
                    'web/partials/Hire.html': 'src/partials/Hire.html'
                }
            },
            directive: {
                options: {
                    removeComments: true,
                    collapseWhitespace: true
                },
                files: {
                    'web/directive/ProgressBar.html': 'src/directive/ProgressBar.html',
                    'web/directive/ExperienceTimeline.html': 'src/directive/ExperienceTimeline.html',
                    'web/directive/Hexagon.html': 'src/directive/Hexagon.html'
                }
            }
        },


        /**
         * CSS
         */
        sass: {
            app: {
                options: {
                    style: 'compressed'
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
                    src: ['*.{png,jpg,gif}', '**/*.{png,jpg,gif}'],
                    dest: 'web/assets/images/'
                }]
            }
        }
    });
};
