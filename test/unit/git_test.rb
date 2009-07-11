require File.dirname(__FILE__) + "/../helpers"

Integrity::SCM::Git.class_eval { public :git_command }

class GitTest < Test::Unit::TestCase
  def git(uri)
    SCM.new(Addressable::URI.parse(uri), "master", "foo")
  end
  
  it "uses the basic git command if no bin_path is set" do
    git('git@git:git.git').git_command.should == 'git'
  end

  it "adds the bin_path to git commands if present" do
    Integrity.config[:bin_path] = '/opt/local/bin/'
    git('git@git:git.git').git_command.should == '/opt/local/bin/git'
  end
end