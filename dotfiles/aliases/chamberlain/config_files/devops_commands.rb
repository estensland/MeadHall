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
}