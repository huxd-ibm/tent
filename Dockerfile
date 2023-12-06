FROM ubuntu:22.04 as build

WORKDIR /src

RUN apt-get update -q -y
RUN apt-get install -q -y build-essential

RUN --mount=type=bind,target=/src gcc test.c -o /bin/test

FROM ubuntu:22.04

COPY --from=build /bin/test /bin/test
COPY --chmod=777 test.sh /bin/test.sh

CMD /bin/test.sh
