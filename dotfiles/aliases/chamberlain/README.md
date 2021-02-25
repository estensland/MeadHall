# Chamberlain

This is an experimental bash file management system

## Running

```
  ruby dotfiles/aliases/chamberlain/shell_boot.rb
```

## Echo Command

It is based on the idea that aliases save typing, but can make a user forget what the original command was. So all aliases are put through a function that will echo the original command before being run.

For example,

    reshell

is an alias for:

    source ~/.bash_profile

When run, before the command it echos:

    Running: source ~/.bash_profile


## Config Files

In the name of being DRY, it iterates through YAML files in /config_files. Besides aliases, conifg files support custom functions and also helper functions that list all the aliases/functions in one of the config files.

Profiles allow for using different combinations of config files. For instance, if a user does not want power-user functionality on certain machines
