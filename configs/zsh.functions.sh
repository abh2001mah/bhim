gr() {
    grep -r -n $1 * | grep -v .svn
}

gri() {
  grep -i -r -n $1 * | grep -v .svn
}

s1() {
  find . -name "*$1*";
}

s2() {
  find . -name "*$1*.$2";
}
