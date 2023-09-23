require ["fileinto","mailbox"];

if header :contains "X-Spam" "YES" {
  fileinto :create "INBOX.Junk";
  stop;
}
