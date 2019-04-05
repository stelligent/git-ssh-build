# Git SSH Mount At Build

Example project of cloning a private repository during a docker build

> No SSH Keys are stored in the docker layers - EVER

Docker mounts your SSH socket into the container layer during build to perform
the steps that you specify using:

```
RUN --mount=type=ssh <your command>
```

[This article helps explain](https://medium.com/@tonistiigi/build-secrets-and-ssh-forwarding-in-docker-18-09-ae8161d066) more about what is happening.

## REQUIREMENTS

  - Docker 18.09+
  - SSH Agent on your host
  - SSH Keys mounted in running SSH agent on host
  - SSH access to the repository you wish to clone

## USAGE

Clone the repository and run

```
make run REPOSITORY=<repository_ssh_url>
```

> Replace repository_ssh_url with the git ssh path to your repository

## TROUBLESHOOTING

For whatever reason you need to explicitly add your ssh keys to your local SSH agent on MacOS. If you get a "Permission Denied, public key" error try running this on your host.

```
ssh-add ~/.ssh/id_rsa
```

This will add your default key to your ssh agent. Retry your `make run` command again.
