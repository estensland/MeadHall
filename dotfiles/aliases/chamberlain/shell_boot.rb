require 'optparse'
require '~/coding/MeadHall/dotfiles/aliases/chamberlain/lib/chamberlain.rb'

profiles = {
  isidore: {
    lists: ['all']
  },
  al_farabi:{
    run_lists:{
      lists: ['basic', 'bundler', 'git', 'homebrew', 'rails', 'rspec', 'url']
    }
  }
}

options = {}

OptionParser.new do |opts|
  opts.on('-p', '--profile profile', 'Profile') do |profile|
    options[:profile] = profile
  end
end.parse!

profile = profiles[options[:profile]]

Chamberlain.new(profile: profile, options: options)

