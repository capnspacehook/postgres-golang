FROM golang:alpine

# Copy compiled Go toolchain into Postgres image
FROM postgres:alpine
COPY --from=0 /usr/local/go /usr/local/
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
