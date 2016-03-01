desc "Run those specs"
task :spec do

  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new do |t|
    t.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
    t.pattern = Dir['spec/**/*_spec.rb']
  end

  # require 'spec/rake/spectask'
  # Spec::Rake::SpecTask.new do |t|
  #   t.spec_files = FileList['spec/**/*_spec.rb']
  # end
end
