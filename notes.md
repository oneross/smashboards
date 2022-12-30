## Notes



### Install

Interesting error and learning ruby...  bundle only support mac, add linux...
`bundle lock --add-platform x86_64-linux`

#### troubleshooting build

- docker build a troubleshooting image that is just ruby 3.1.3-slim with files copied in
- `docker run -it {image} bash -il` to iteractively inspect image so that I can see more detailed logs
- `cat /usr/local/bundle/extensions/x86_64-linux/3.1.0/eventmachine-1.2.7/mkmf.log`
- --> `package configuration for openssl is not found`

#### resolution

- switched base image from ruby:3.1.3-slim to ruby:3.1.3.  I guess the former is missing headers etc for libssl.
- build, but new issue - thin requires javascript runtime...
    - this: https://stackoverflow.com/questions/52274485/docker-not-able-to-run-nodejs-npm
    - and this: https://github.com/nodesource/distributions (for latest version)

