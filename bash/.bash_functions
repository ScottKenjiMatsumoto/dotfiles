# ~/.bash_functions

clipshot() {
  local f
  f="$(mktemp /tmp/clipshot-XXXXXX.png)" || return 1

  scrot -o -s "$f" || {
    rm -f "$f"
    return 1
  }

  xclip -selection clipboard -target image/png < "$f" &&
  rm -f "$f"
}
