require 'term/ansicolor'

puts "sploek initialized"

["on_green", "green", "underline", 
 "append_features", "on_yellow", 
 "yellow", "blink", "on_blue", "blue", 
 "uncolored", "rapid_blink", "on_magenta", 
 "reset", "magenta", "negative", 
 "on_cyan", "cyan", "concealed", 
 "attributes", "on_white", "white", 
 "underscore", "strikethrough", "bold", 
 "on_black", "black", "dark", "on_red", 
 "clear", "red", "coloring?", "italic"].each do |m|
  eval("def #{m}; Term::ANSIColor.#{m}; end")
end

def nl
  "\n"
end

def find_spec match
  if match[1] =~ /_spec$/
    match
  elsif File.exist?(specpath = File.join("spec", match[1] + "_spec.rb"))
    specpath
  elsif File.exist?(specpath = File.join("spec", match[2] + "_spec.rb"))
    specpath
  end
end

def fail?(result)
  md = result.match(/(\d*) failure(s?)/)
  md[1].to_i > 0
end

def run_spec match
  specpath = find_spec(match)
  print magenta, "spec", reset, " ", specpath, nl
  result = %x{ spec #{specpath} }


  if fail?(result)
    puts result
  else
    print green, "success", reset, nl
  end
end

def run_cmd(cmd, match)
  return if match[1] =~ /_spec$/
  puts "=" * 80
  print magenta, cmd, reset, " ", match, nl
  system "#{cmd} #{match}"
end

watch("^(.*/(.*))\.rb$") do |md|
  system "clear"

  run_spec(md)
  run_cmd("flog", md)
  run_cmd("reek", md)
end
