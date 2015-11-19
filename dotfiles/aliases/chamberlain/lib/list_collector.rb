require 'fileutils'

class ListCollector

  def self.run(profile)
    self.new(profile).list
  end

  def initialize(profile)
    @picked_lists = profile[:lists]
  end

  def list
    FileUtils.cd("/Users/Eric/coding/MeadHall/dotfiles/aliases/chamberlain/config_files/")

    collection = []
    Dir.entries(".").select{|file| file.match('.yaml')}.each do |file|
      next if file == '.' || file == '..' || File.directory?(file)
      list = YAML.load_file(file)
      collection << list
    end
    return collection
  end

end