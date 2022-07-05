require 'fileutils'

class ListCollector

  def self.run(profile)
    self.new(profile).list
  end

  def initialize(profile)
    @picked_lists = profile[:lists]
  end

  def list
    FileUtils.cd("/Users/ericstensland/coding/MeadHall/dotfiles/aliases/chamberlain/config_files/")

    collection = []
    Dir.entries(".").select{|file| file.match('.yaml')}.each do |file|
      next if file == '.' || file == '..' || File.directory?(file)

      begin
        list = YAML.load_file(file)

      rescue Exception => e
        raise "#{file} raised the following error #{e}"
      end

      collection << list
    end
    return collection
  end

end
