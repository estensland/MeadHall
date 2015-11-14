{
  name: 'Git',
  aliases: {
    mikedrop: "git push origin master",
    choochoo: "git push origin master --force"
  },
  custom_functions: {
    gph: {
      echo_description: 'git push origin HEAD',
      helper_descrpition: 'git push origin current branch (blocks master)',
      command:

"BRANCH=$(git symbolic-ref HEAD)
MASTER=\"refs/heads/master\"
echo \"Trying to Push Branch\"
echo \"Checking if on master...\"
if  [[ \"$BRANCH\" == \"$MASTER\" ]]; then
echo 'YOU ARE ON MASTER BRACNH!'
else
echo \"Passed check\"
git push origin HEAD
fi"
    }
  }
}
