#!/bin/bash

CHNGFILE="$BATS_TMPDIR/test-changelog"
CHAGREPO="$BATS_TMPDIR/chag-test"

# Creates a test fixure changelog
setup_changelog() {
  tail -9 CHANGELOG.rst > $CHNGFILE
}

# Creates a test fixure changelog that has a TBD entry
setup_changelog_tbd() {
  printf "Foo\n\n" > $CHNGFILE
  printf "Next Release (TBD)\n" >> $CHNGFILE
  echo "------------------" >> $CHNGFILE
  printf "\nHello!\n\n" >> $CHNGFILE
  tail -9 CHANGELOG.rst >> $CHNGFILE
}

# Deletes the test fixture changelog
delete_changelog() {
  rm $CHNGFILE
}

# Deletes the test fixture repository
delete_repo() {
  rm -rf $CHAGREPO
}

# Creates a test fixture repository
setup_repo() {
  delete_repo
  # Create new git repo
  mkdir -p $CHAGREPO
  tail -9 CHANGELOG.rst > $CHAGREPO/CHANGELOG.rst
  cd $CHAGREPO
  git init && git add -A && git commit -m 'Initial commit'
}
