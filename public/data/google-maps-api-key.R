library("secret")
library("here")

## https://www.mishabalyasin.com/2017/11/05/overview-secret-spelling/

my_vault <- here("static", "data", "secret_vault.vault")

create_vault(my_vault)


key_dir <- file.path("~/.ssh") # this folder is created by default when you create keys


## RUN: ssh-keygen -t rsa
## Filepath: blog_vault

martinjhnhadley_public_key <- file.path(key_dir, "blog_vault.pub")
martinjhnhadley_private_key <- file.path(key_dir, "secret_example")
add_user("martinjhnhadley", martinjhnhadley_public_key, vault = my_vault)

add_secret("secret_two", "fooooooooooabar", user = "martinjhnhadley", vault = my_vault)


