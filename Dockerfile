FROM golang:alpine

# Copy compiled Go toolchain into Postgres image
FROM postgres:alpine
COPY --from=0 /usr/local/go /usr/local/
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# Install git and gcc
RUN apk --update add --no-cache \
    gcc \
    git \
    musl-dev \
    && \
    rm -f /usr/libexec/gcc/x86_64-alpine-linux-musl/9.2.0/cc1obj
