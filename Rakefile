require 'rake/testtask'

task 'default' => ['test']

task 'test' => ['search-tests']

Rake::TestTask.new do |t|
  t.name = 'search-tests'
  t.test_files = FileList['test/test_search.rb']
end
