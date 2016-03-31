class RandomStringGenerator

  def random_string(length = 8, char_start = 65, rand_limit = 26) 
    "#{(0...length).map { (char_start + rand(rand_limit)).chr }.join}"
  end

end
