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


def find_file match
  path = match.to_s.sub('_spec', '').sub(/^spec\//, '')

  locations = [
    File.join("app", path),
    File.join("lib", path),
    path
  ]
  if File.exist?(match.to_s) && match.to_s["_spec"].nil?
    match
  elsif path = locations.find {|x| File.exist?(x) }
    path
  end
end

def find_spec match
  locations = [
    File.join("spec", match[1] + "_spec.rb"),
    File.join("spec", match[2] + "_spec.rb"),
    File.join("spec", match[1].sub(/^app/, '') + "_spec.rb")
  ]
  if match[1] =~ /_spec$/
    match
  elsif specpath = locations.find {|x| File.exist?(x) }
    specpath
  end
end

def run_spec match
  specpath = find_spec(match)
  return unless specpath
  print magenta, "spec", reset, " ", specpath, nl


  system("spec #{specpath}")
end

def run_cmd(cmd, match)
  match = find_file(match)
  return unless match
  puts "-" * 80
  print magenta, cmd, reset, " ", match, nl
  system "#{cmd} #{match}"
end

watch("^(.*/(.*))\.rb$") do |md|
  system "clear"

  if run_spec(md)
    run_cmd("flog", md)
    run_cmd("reek", md)
  end

  puts "=" * 80
end
