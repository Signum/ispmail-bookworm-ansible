require ["vnd.dovecot.pipe", "copy", "imapsieve", "variables"];

if string "${mailbox}" "Trash" {
  stop;
}

pipe :copy "rspamd-learn-ham.sh";
