# Write in this file customization code that will get executed before 
# autoproj is loaded.

# Set the path to 'make'
# Autobuild.commands['make'] = '/path/to/ccmake'

# Set the parallel build level (defaults to the number of CPUs)
# Autobuild.parallel_build_level = 10

# Uncomment to initialize the environment variables to default values. This is
# useful to ensure that the build is completely self-contained, but leads to
# miss external dependencies installed in non-standard locations.
#
# set_initial_env
#
# Additionally, you can set up your own custom environment with calls to env_add
# and env_set:
#
env_add 'PATH', "/usr/lib/ccache/"

#if Autobuild.macos?
#    Autobuild.programs['wget'] = ['wget --no-check-certificate']
#end

if ENV['PURE_MARS']
    STDOUT.puts "Overrivding mars build to #{ENV['PURE_MARS']}"
    Autoproj.change_option('pure_mars', ENV['PURE_MARS']) 
else
    Autoproj.configuration_option 'pure_mars', 'boolean',
         :default => 'no',
         :doc => ["Do you want to make a pure-mars build without rock-stuff?"]
end


require "autoproj/gitorious"
Autoproj.gitorious_server_configuration('GITORIOUS', 'gitorious.org')
Autoproj.gitorious_server_configuration('SPACEGIT', 'git.hb.dfki.de',:fallback_to_http => false)
Autoproj.gitorious_server_configuration('GITHUB', 'github.com', :http_url => 'https://github.com')

Autoproj.env_inherit 'CMAKE_PREFIX_PATH'

if(Autobuild.respond_to?("displayed_error_line_count"))
    Autobuild.displayed_error_line_count = 999999999999999999999999999999999999999999 
end
