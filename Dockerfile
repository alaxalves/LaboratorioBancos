FROM redis:4.0.2

MAINTAINER alaxallves@gmail.com

COPY src/@scripts-lua/. $PWD/redis/.

RUN echo Starting Redis Hollywood...
