namespace :docs do
  desc "Generate the latest docs from the source code and add to gh-pages"
  task :generate do
    ensure_clean_git
    run "git checkout #{branch}"
    run "docco lib/**/*.rb"
    run "git commit -am 'Updated documentation'"
    run "git checkout gh-pages"
    run "git checkout #{branch} -- docs/" # Copy docs changes across and stage
    run "git commit -am 'Updated docs on gh-pages'"
    run "git checkout #{branch}"
  end

  desc "Deploy docs to GitHub pages"
  task :deploy do
    ensure_clean_git
    run "git checkout gh-pages"
    run "git push origin gh-pages"
    run "git checkout #{branch}"
  end
end

def branch
  @branch ||= `git symbolic-ref HEAD 2> /dev/null`.gsub("refs/heads/", "").strip
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
