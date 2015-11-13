require '~/coding/MeadHall/dotfiles/aliases/chamberlain/chamberlain.rb'


lists = [
  [
    {
      name: 'Basic',
      aliases:{
        reshell: "source ~/.bash_profile",
        chamberlain: "ruby ~/coding/MeadHall/dotfiles/aliases/shell_boot.rb; reshell",
        '..' => "cd ..",
        '...' => "cd ...",
        lg: "ls -G",
        la: "ls -AF",
        ll: "ls -alh",
        l: "ls -a",
        l1: "ls -1",
        lo: "ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g'",
        recent: "ls -lAt | head",
        old: "ls -lAt | tail"
      }
    },
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
      },
      custom_functions: {
        shuffle: {
          command:
  "local i tmp size max rand

  array=( 'Get that shit out of you, and get that motivation to not give up and not be a quitter, no matter how much you just want to fall flat on your face' 'These are the times that try mens souls...Tyranny, like hell, is not easily conquered...the harder the conflict, the more glorious the triumph' 'Nothing is eaten as hot as it is cooked' 'Sometimes even to live is an act of courage' 'Ships are safe in harbor, but that is not what they are made for' 'All I know is that I know nothing' 'The best revenge is massive success' 'People often say that motivation doesn’t last. Well, neither does bathing.  That’s why we recommend it daily' 'Fall seven times and stand up eight' 'If the wind will not serve, take to the oars' 'ASTRA INCLINANT NON OBLIGANT' 'When everything seems to be going against you, remember that the airplane takes off against the wind, not with it.' 'Nothing is impossible, the word itself says, I’m possible!' 'Give me six hours to chop down a tree and I will spend the first four sharpening the axe' 'Common looking people are the best in the world: that is the reason the Lord makes so many of them' 'If I were two-faced, would I be wearing this one?')
  size=${#array[*]}
  max=$(( 32768 / size * size ))
  for ((i=size-1; i>0; i--)); do
    while (( (rand=$RANDOM) >= max )); do :; done
    rand=$(( rand % (i+1) ))
    tmp=${array[i]} array[i]=${array[rand]} array[rand]=$tmp
  done"
        },
        inspire: {
          helper_descrpition: "randomly be given an inspiring quote",
          command:
  "shuffle
  echo \"Quote:\"
  echo \"${array[1]}\"
  echo"
        }

      }
    },
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
        mikedrop: "git push origin master",
        choochoo: "git push origin master --force",
        hitme: "git pull origin master",
        cmdz: "git reset --soft HEAD~1"
      },
      quoted_inputs: {
        gac: "git add . ; git commit -m",
        gc: "git commit -m",
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
        },
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
    {
      name: 'Rails',
      aliases: {
        rc: "rails console",
        rgm: "rails generate model",
        rn: "rails new",
        rs: "rails server",
        rt: "bundle exec rspec spec --format documentation",
      },
      custom_functions:{
        rr:{
          helper_descrpition: 'rake route (| grep \$1)',
          command:
  "if [ $# -gt 0 ]; then
    run_and_tell \"rake routes | grep $1\"
  else
    run_and_tell rake routes
  fi"
        }
      }
    },
    {
      name: 'Homebrew',
      aliases: {
        brup: 'brew update && brew upgrade',
        brout: 'brew outdated',
        bro: 'brew outdated',
        brin: 'brew install',
        brrm: 'brew uninstall',
        brls: 'brew list',
        brsr: 'brew search',
        brinf: 'brew info',
        brdr: 'brew doctor'
      }
    },
    {
      name: 'Heroku',
      aliases: {
        hl: 'heroku list',
        hi: 'heroku info',
        ho: 'heroku open',
        hr: 'heroku rake',
        hcon: 'heroku console',
        hnew: 'heroku create',
        hrestart: 'heroku restart',
        hlog: 'heroku logs',
        hc: 'heroku config',
        hca: 'heroku config:add',
        hcr: 'heroku config:remove',
        hcc: 'heroku config:clear'
      }
    },
    {
      name: 'RSpec',
      custom_functions:{
        rtc: {
          helper_descrpition: 'rspec test controller (\$1) line (\$2)',
          command:
  "if [ $# -gt 1 ]; then
    echo testing line $2 in $1 controller
    echo \"rspec spec/controllers/$1_controller_spec.rb:$2;\"
    rspec spec/controllers/$1_controller_spec.rb:$2;
  elif [ $# -gt 0 ]; then
    echo testing all of $1 controller
    echo \"rspec spec/controllers/$1_controller_spec.rb\"
    rspec spec/controllers/$1_controller_spec.rb;
  else
    echo testing all controllers
    echo \"rspec spec/controllers/\"
    rspec spec/controllers/;
  fi"
        },
        rtm: {
          helper_descrpition: 'rspec test controller (\$1) line (\$2)',
          command:
  "if [ $# -gt 1 ]; then
    echo testing line $2 in $1 model
    echo \"rspec spec/models/$1_spec.rb:$2;\"
    rspec spec/models/$1_spec.rb:$2;
  elif [ $# -gt 0 ]; then
    echo testing all of $1 model
    echo \"rspec spec/models/$1_spec.rb;\"
    rspec spec/models/$1_spec.rb;
  else
    echo testing all of models
    echo \"rspec spec/models/;\"
    rspec spec/models/;
  fi"
        },
      }
    },
    {
      name: 'Url',
      aliases: {
        goexer: 'open http://www.exercism.io/estensland',
        goeuler: 'open http://projecteuler.net/problems',
        gogit: 'open http://www.github.com/estensland'
      },
      custom_functions:{
        gorepo: {
          echo_description: 'openning repo url',
          helper_descrpition: 'opens git remote origin url',
          command:
  "URL=$(git --git-dir=.git config --get remote.origin.url | sed -e 's/\\:/\\//')
  URL=$(awk '{gsub(/git@/,\"https://www.\")}1' <<< $URL)
  open \"$URL\""
        }
      }
    },
    {
      name: 'DevOps',
      custom_functions:{
        hop: {
          echo_description: 'sshing...',
          helper_descrpition: 'ssh -p(port, user, ip',
          command:
  "echo ssh -p $1 $2@$3
  echo ''
  ssh -p $1 $2@$3;"
        }
      }
    },
    {
      name: 'Zeus',
      aliases: {
        zc: 'zeus c',
        zr: 'zeus rake',
        zs: 'zeus start'
      },
      custom_functions:{
        ztc: {
          helper_descrpition: 'zeus test controller (\$1) line (\$2)',
          command:
  "if [ $# -gt 1 ]; then
    echo testing line $2 in $1 controller
    zeus rspec spec/controllers/$1_controller_spec.rb:$2;
  elif [ $# -gt 0 ]; then
    echo testing all of $1 controller
    zeus rspec spec/controllers/$1_controller_spec.rb;
  else
    echo testing all controllers
    zeus rspec spec/controllers/;
  fi"
        },
        ztm: {
          helper_descrpition: 'zeus test controller (\$1) line (\$2)',
          command:
  "if [ $# -gt 1 ]; then
    echo testing line $2 in $1 model
    zeus rspec spec/models/$1_spec.rb:$2;
  elif [ $# -gt 0 ]; then
    echo testing all of $1 model
    zeus rspec spec/models/$1_spec.rb;
  else
    echo testing all of models
    zeus rspec spec/models/;
  fi"
        },
      }
    }
  ]
]


Chamberlain.new(alias_lists: lists)

