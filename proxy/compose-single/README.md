# proxy/compose-single

In this example is about 

## Host
### FAQ
#### update version docker-compose
How to update you local docker-compose version
```
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## docker compose
### FAQ
#### verbose docker compose build
Example build image for service **www**
```
docker compose --verbose build --no-cache www
```
#### ERROR [_servicename_ internal] load metadata for _image to be pulled_
```
cat ~/.docker/config.json
```
If you see something like:
```
   "credsStore": "desktop.exe"
```
** replace "credsStore" with "credStore" 
```
   "credStore": "desktop.exe"
```
