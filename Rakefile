require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test/test_unif.rb'
end

desc "Run tests"
task :default => :test
