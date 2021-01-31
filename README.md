# Setting up proxy in Docker Container
## Summary
Hey Guys, In this repo I added a small example which will explain how to setup proxy to monitor the traffic for a particular docker container. While working on one of the project, I needed to monitor the network but found there is no clear guide to achieve what I need. After analyzing further and found the answer, I decided to put a article on this so It might help others.

**NOTE:** In this example, i only demonstrated the http proxy not https.

## Repo content
This repo has [docker-compose.yml](https://github.com/venkatpselvam1/docker-container-proxy/blob/master/docker-compose.yml) file which have the following component in it.
* [server](https://github.com/venkatpselvam1/docker-container-proxy/blob/master/docker-compose.yml#L4) - it is a webserver which listens at port 80
* [client](https://github.com/venkatpselvam1/docker-container-proxy/blob/master/docker-compose.yml#L12) - it is consumer who hits the server at port 80
* [app-network](https://github.com/venkatpselvam1/docker-container-proxy/blob/master/docker-compose.yml#L33) - it is the network for these component

## What is out goal?
We want to add a proxy on the client container so we can monitor the out going traffic from this container.
![Setting proxy](https://github.com/venkatpselvam1/docker-container-proxy/blob/master/Proxy_between_containers.PNG?raw=true)
![Setting proxy](https://github.com/venkatpselvam1/docker-container-proxy/blob/master/Result.PNG?raw=true)

## Changes Needed
We only need change in docker file.
* Add one more container which will act as a proxy. I am using [mitmproxy](https://hub.docker.com/r/mitmproxy/mitmproxy/) in this example.
* Set http proxy for the container which we are interested with proxy container's name.

Please refer the below image. I have commented out the code in [docker-compose.yml](https://github.com/venkatpselvam1/docker-container-proxy/blob/master/docker-compose.yml) file. Just uncomment it so you can see the changes.

![Changes](https://github.com/venkatpselvam1/docker-container-proxy/blob/master/Changes.PNG?raw=true)

## Conclusion
As We expose port 8083 from mitmproxy, through which we can monitor the network traffic.