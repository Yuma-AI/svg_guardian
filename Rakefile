# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"
require "rb_sys/extensiontask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

begin
  require "standard/rake"
rescue LoadError
end

spec = Bundler.load_gemspec("svg_guardian.gemspec")

RbSys::ExtensionTask.new("svg_guardian", spec) do |ext|
  ext.lib_dir = "lib/svg_guardian"
  ext.cross_compile = true
end

task build: :compile
task default: %i[compile test standard]
