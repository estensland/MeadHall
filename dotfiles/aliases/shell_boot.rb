require '~/coding/MeadHall/dotfiles/aliases/chamberlain/chamberlain.rb'


lists = [
  [
    {
      name: 'Custom',
      aliases: {
        bashprof: "subl ~/.bash_profile",
        coding: "cd ~/coding",
        mh: "cd ~/coding/MeadHall",
        rfiles: "cd ~/coding/ruby_files",
        wp: "cd ~/coding/web_projects",
        exer: "cd ~/coding/exercism.io",
        euler: "cd ~/coding/euler",
        emberp: "cd ~/coding/ember_projects",
        ngp: "cd ~/coding/angular_projects",
        jsp: "cd ~/coding/js_projects",
        phpp: "cd ~/coding/php_projects",
        rp: "cd ~/coding/rails_projects",
        rpg: "cd ~/coding/rails_projects/gems",
        gene: "cd ~/coding/rails_projects/genealogy_test"
      }
    },
    {
      name: 'Git',
      aliases: {
        g: "git",
        gi: "git init",
        ga: "git add",
        gap: "git add -all -p",
        gb: "git branch",
        gco: "git checkout",
        gs: "git status",
        gss: "git status -s",
        gd: "git diff",
        gdc: "git diff --cached",
        gr: "git pull --rebase",
        gv: "git remote -v",
        ggph: "gph && gobranch"
      },
      quoted_inputs: {
        gac: "git add . ; git commit -m",
        gc: "git commit -m",
      }
    },
    {
      name: 'Bundler',
      aliases: {
        b: "bundle",
        bi: "bundle install --path vendor",
        be: "bundle exec",
        bl: "bundle list",
        bu: "bundle update",
        bp: "bundle package"
      }
    },
  ]
]



# bundler-help () {
#   echo "Bundler Aliases"
#   echo
#   echo " b     = bundle"
#   echo " bi    = bundle install --path vendor"
#   echo " be    = bundle exec"
#   echo " bl    = bundle list"
#   echo " bu    = bundle update"
#   echo " bp    = bundle package"
#   echo
# }



Chamberlain.new(alias_lists: lists)


