require 'fileutils'

class ListCollector

  def self.run(profile)
    self.new(profile).list
  end

  def initialize(profile)
    @picked_lists = profile[:lists]
  end

  def list
    FileUtils.cd("/Users/Eric/coding/MeadHall/dotfiles/aliases/chamberlain/confi_files/")

    Dir.entries(".").each do |file|

    end
  end

end