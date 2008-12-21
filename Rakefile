# -*- ruby -*-
require 'rubygems'
require 'hoe'
require 'cucumber/rake/task'
require './lib/khayyam.rb'

Hoe.new('khayyam', Khayyam::VERSION) do |p|
  p.developer('Jamal Hansen', 'jamal.hansen@gmail.com')
  p.changes=p.paragraphs_of("History.txt", 0..1).join("\n\n")
end

Cucumber::Rake::Task.new

# vim: syntax=Ruby
