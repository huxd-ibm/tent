FROM ubuntu:22.04 as build

WORKDIR /

RUN apt-get update -q -y
RUN apt-get install -q -y build-essential

COPY test.c .
RUN gcc test.c -o /bin/test

FROM ubuntu:22.04

COPY --from=build /bin/test /bin/test

CMD echo "CPU architecture is $(uname -m).\n"
