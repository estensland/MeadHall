{
  name: 'Git',
  aliases: {
    g: "git",
    gi: "git init",
    ga: "git add",
    gap: "git add --all -p",
    gb: "git branch",
    gco: "git checkout",
    gs: "git status",
    gss: "git status -s",
    gd: "git diff",
    gdc: "git diff --cached",
    gr: "git pull --rebase",
    gv: "git remote -v",
    ggph: "gph && gobranch",
    hitme: "git pull origin master",
    cmdz: "git reset --soft HEAD~1"
  },
  quoted_inputs: {
    gac: "git add . ; git commit -m",
    gc: "git commit -m",
  },
  custom_functions: {
    graft: {
      echo_description: 'git pull origin HEAD',
      helper_descrpition: 'git pull on current branch',
      command:
"BRANCH=$(git symbolic-ref HEAD)
echo \"\"
echo \"Pulling Down Origin Branch\"
echo \"git pull origin $BRANCH\"
echo \"\"
git pull origin $BRANCH
echo \"\""
    }
  }
}