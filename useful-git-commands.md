## Fetch the remote branch from the local repo and check it out
'git fetch origin development && git checkout development' 
## Switch to another branch on the remote repo, must use git fetch if branch doesn't exist locally
'git switch development'
## alias setup on the global git command is helpful with long commands
'git config --global alias.co commit'
## git fetch <remote><local>
'git fetch development main