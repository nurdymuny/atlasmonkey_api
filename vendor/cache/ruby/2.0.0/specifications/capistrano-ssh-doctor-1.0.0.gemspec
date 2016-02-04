# -*- encoding: utf-8 -*-
# stub: capistrano-ssh-doctor 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-ssh-doctor"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bruno Sutic"]
  s.date = "2014-09-30"
  s.description = "This plugin helps you setup and debug `ssh-doctor` forwarding for Capistrano\ndeployment.\nIt peforms a number of checks on the local machine as well as on the\nservers. Report output with suggested next steps is provided in case there\nare any errors with the setup.\n"
  s.email = ["bruno.sutic@gmail.com"]
  s.homepage = "https://github.com/capistrano-plugins/capistrano-ssh-doctor"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "This plugin helps you setup and debug `ssh-doctor` forwarding for Capistrano deployment."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>, [">= 3.1"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<capistrano>, [">= 3.1"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<capistrano>, [">= 3.1"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
