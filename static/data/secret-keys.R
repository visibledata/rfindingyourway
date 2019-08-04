library("secret")
library("here")

## ==== Create a vault
## Run these lines ONCE ONLY
my_vault <- here("static", "data", "secret-vault.vault")
create_vault(my_vault)

## ==== Create a user
## This uses the ssh-key we created above, run this code ONCE ONLY
key_dir = "~/.ssh"
martinjhnhadley_public_key <- file.path(key_dir, "blog_vault.pub")
martinjhnhadley_private_key <- file.path(key_dir, "blog_vault")
add_user("martinjhnhadley", martinjhnhadley_public_key, vault = my_vault)

