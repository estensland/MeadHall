require 'rubygems'
require 'pry'
puts ""
rr = [['t', 'p'], ['b', 'n']].sample.shuffle
puts "Rajıs Ve#{rr.first}eği#{rr.last} Rajıdan"

Pry.config.prompt = proc do |obj, nest_level, _|
  if obj != 'main' && nest_level != 0
    "#{obj}:#{nest_level}    ☈  "
  else
    " \e[93m☈\e[39m "
  end
end

def cp(x)
  IO.popen('pbcopy', 'w') { |io| io.write(x) }
end

def _c(x = Readline::HISTORY.entries[-2])
  if x.is_a?(Integer)
    x = Readline::HISTORY.entries[(x * -1)..-2]
  end

  cp(x)
  "Ob Vikeniç Odu, Rapıgu"
end

Pry::Commands.block_command "_cc", "copy last output" do
  cp _pry_.last_result
  puts "Qüz, Objz Rapıgu"
end

Pry.config.exception_handler = proc do |output, exception, _|
  $r = output
  $last_exception = exception
  output.puts "#{exception.class}: #{exception.message}"
  puts "from: #{exception.backtrace[0]}"
end



