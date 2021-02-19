# Icecast install

## Prerequisites
```
sudo apt-get update
sudo apt-get install icecast2
sudo chown <username> /var/log/icecast2 # Or whatever file gives you a permission denied in the run command
```

## Running

```
make run-icecast-local
```


## Installing Docker (optional)

```
sudo apt-get update
```

> Warning: Always examine scripts downloaded from the internet before running them locally.
```
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh
$ sudo usermod -aG docker <your-user>
```

