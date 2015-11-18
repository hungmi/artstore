# for re-defining the Rake task
# otherwise the previous Rake task is still called
task(:notes).clear

desc "Enumerate all annotations 
      (use notes:optimize, :fixme, :todo, :wtf for focus)"
task :notes do
  SourceAnnotationExtractor.enumerate "OPTIMIZE|FIXME|TODO|WTF", 
                                      :tag => true
end

namespace :notes do
  task(:wtf).clear
  task :wtf do
    SourceAnnotationExtractor.enumerate "BEST", :tag => true
  end
end

namespace :dev do
  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate"]
  task :rebuild => [ "dev:build", "db:seed" ]
end