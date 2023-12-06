FROM ubuntu:22.04 as build

RUN apt-get update -q -y
RUN apt-get install -q -y build-essential

RUN --mount=type=bind,target=/src gcc /src/test.c -o /bin/test

FROM ubuntu:22.04

COPY --from=build /bin/test /bin/test
COPY --chmod=+x test.sh .

CMD test.sh
