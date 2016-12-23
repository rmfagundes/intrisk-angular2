FROM google/dart-runtime-base

WORKDIR /project/app

ADD . /project/app

RUN pub get

CMD []
ENTRYPOINT ["/usr/bin/dart", "web/main.dart"]
