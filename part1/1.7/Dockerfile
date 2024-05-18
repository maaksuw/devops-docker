# Start from the alpine image
FROM ubuntu:22.04

# Use /usr/src/app as our workdir. The following instructions will be executed in this location.
WORKDIR /usr/src/app

# Copy the hello.sh file from this location to /usr/src/app/ creating /usr/src/app/hello.sh.
COPY script.sh .

# Execute a command with `/bin/sh -c` prefix.
RUN apt-get update &&\ 
    apt-get install -y curl &&\
    chmod +x script.sh

# When running Docker run the command will be ./hello.sh
ENTRYPOINT ["./script.sh"]
