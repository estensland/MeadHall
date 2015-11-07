require '~/coding/MeadHall/dotfiles/aliases/chamberlain/run_and_tell.rb'

class Chamberlain

  #### INSTANCE METHODS

  def self.run
    # set path
    path = ".test.sh"
    # create file
     File.open(path, 'w') do |alias_file|
      alias_file.write(RunAndTell.base_function)
     end

     puts File.absolute_path(File.open(path).path)

    # init run and tell

  end

  #### INSTANCE METHODS

  def initialize(opts = {})
    1
  end
end