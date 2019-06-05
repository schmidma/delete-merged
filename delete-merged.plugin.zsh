# Delete merged branched.
gbmcleanup() {
  zparseopts -a opts f q h i d
  local curb merged
  local force interactive
  local from_branches='^(master|dev)$'
  local keep_branches='^(master|dev|local)$'

  if (( $opts[(I)-h] )); then
    echo "Cleans merged branches."
    echo "$0 [-i] [-f] [-q]"
    return
  fi
  interactive=$opts[(I)-i]
  force=$opts[(I)-f]
  dry_run=$opts[(I)-d]

  curb=$(current_branch)
  if [[ -z $curb ]]; then
    echo "No current branch. Aborting."
    return 1
  fi
  if ! [[ $curb =~ $from_branches ]] && ! (( $force )) && ! (( $dry_run )); then
    echo "Current branch does not match '$from_branches'." 2>&1
    echo "Use -f to force." 2>&1
    return 1
  fi

  merged=($(git branch --merged | sed '/^*/d' | cut -b3- | sed "/$keep_branches/d"))

  local cmd
  cmd=(git branch -d)
  if (( $dry_run )); then
    cmd=(echo $cmd)
  fi

  if (( $interactive )); then
    echo "$#merged branches to process: " $merged

    for b in $merged; do
      git show $b
      read "yn?Delete $b [y/n]? "
      case $yn in
          [Yy]* ) $cmd $b;;
          * ) echo "Skipping $b";;
      esac
    done
  else
    $cmd $merged
  fi
}

