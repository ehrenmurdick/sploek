# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sploek}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ehren Murdick"]
  s.date = %q{2010-10-18}
  s.default_executable = %q{sploek}
  s.email = %q{ehren.murdick@gmail.com}
  s.executables = ["sploek"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/sploek",
     "lib/sploek.rb",
     "lib/sploek.watchr.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/sploek_spec.rb",
     "sploek.gemspec"
  ]
  s.homepage = %q{http://github.com/ehrenmurdick/sploek}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Auto run specs, flog, reek}
  s.test_files = [
    "spec/models/foobar_spec.rb",
     "spec/spec_helper.rb",
     "spec/sploek_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_runtime_dependency(%q<term-ansicolor>, [">= 1.0.5"])
      s.add_runtime_dependency(%q<watchr>, [">= 0.6"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<term-ansicolor>, [">= 1.0.5"])
      s.add_dependency(%q<watchr>, [">= 0.6"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<term-ansicolor>, [">= 1.0.5"])
    s.add_dependency(%q<watchr>, [">= 0.6"])
  end
end

