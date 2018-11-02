# get-repos
Get all repos for a user. Will only be public unless you clone your own.

## Instructions

Go to GitHub settings in the top right. 

At the bottom of the settings menu on the right, click "Developer Settings", then "Personal access tokens." 

Make a new one for this script, be sure to copy it when given, since GitHub will never display it again. 

Make a new folder where all your repos will be located, then copy this script into it.

Make your token the value of the `token` variable in `clone_repos.rb`.

Execute with `ruby clone_repos.rb` and wait until finished. 