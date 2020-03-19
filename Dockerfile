FROM golang:1.14

ARG coveralls_token

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src/github.com/micke136/coveralls

# Copy everything from the current directory to the PWD (Present Working Directory) inside the container
COPY . .

# Download all the dependencies
RUN go get github.com/mattn/goveralls
RUN go get golang.org/x/tools/cmd/cover

# Test everything
RUN go test -v -covermode=count -coverprofile=coverage.out ./...

#SEND TO COVERALLS
RUN $GOPATH/bin/goveralls -coverprofile=coverage.out -service=travis-ci -repotoken ${coveralls_token}

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD ["go-sample-app"]