GIT='git --git-dir='$PWD'/.git'
$GIT pull
$GIT add .
COMMIT = date
$GIT commit -m "$COMMIT"
$GIT push