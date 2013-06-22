namespace :docs do
  desc "Generate the latest docs from the source code and add to gh-pages"
  task :generate do
    ensure_clean_git
    run "git checkout master"
    run "docco lib/**/*.rb"
    run "git commit -am 'Updated documentation'"
    run "git checkout gh-pages"
    run "git checkout master -- docs/" # Copy docs changes across and stage
    run "git commit -am 'Updated docs on gh-pages'"
    run "git checkout master"
  end

  desc "Deploy docs to GitHub pages"
  task :deploy do
    ensure_clean_git
    run "git checkout gh-pages"
    run "git push origin gh-pages"
    run "git checkout master"
  end
end

def git_dirty?
  `[[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]]`
  dirty = $?.success?
end

def ensure_clean_git
  if git_dirty?
    raise "Can't deploy without a clean git status."
  end
end

def run(command)
  puts "  #{command}"
  %x{#{command}}
end
