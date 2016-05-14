class RandomStringGenerator

  def random_string(opts = {})
    if opts.is_a?(Integer)
      length = opts
    elsif opts.is_a?(Hash)
      default_random_string_args.merge!(opts)
      length = opts[:length]
      char_start = opts[:char_start]
      rand_limit = opts[:rand_limit]
    else
      raise 'Improper argument to #random_string, must be Hash or Integer'
    end


    "#{(0...length).map { random_letter(char_start, rand_limit) }.join}"
  end

  def random_letter(char_start, rand_limit)
    (char_start + rand(rand_limit)).chr
  end

  def default_random_string_args
    {
      length: 8,
      char_start: 65,
      rand_limit: 26
    }
  end
end
