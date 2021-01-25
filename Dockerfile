FROM perl:5.32.0

MAINTAINER team@and.how

WORKDIR /tmp

COPY cpanfile .

RUN apt-get update -y

RUN apt-get install -y ca-certificates
RUN apt-get install -y cpanminus
RUN apt-get install -y openssl
RUN apt-get install -y libev-perl
RUN apt-get install -y libpq-dev
RUN apt-get install -y default-libmysqlclient-dev
RUN apt-get install -y libsqlite3-dev
RUN apt-get install -y libreadline-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y zlib1g-dev

RUN cpanm -qn --installdeps .

RUN rm cpanfile

CMD perl -V
