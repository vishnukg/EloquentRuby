require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.test_files = FileList["test/*_test.rb"]
  t.ruby_opts = ["-r coverage_helper"]
end

task :format do
  sh "bundle exec standardrb --fix"
end

task :install do
  sh "bundle install"
end

task :update do
  sh "bundle update --all"
end

task default: :test
