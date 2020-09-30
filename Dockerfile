FROM madnificent/lisp-webservice:0.2.0

COPY . /app

ENV BOOT=redti-reservations
ENV SYSTEMS="jsown hunchentoot easy-routes"
RUN sbcl --load /usr/src/load.lisp

CMD sbcl --load /usr/src/startup.lisp
