FROM madnificent/lisp-webservice:0.2.0

COPY . /app

ENV BOOT=mu-cl-resources
RUN sbcl --load /usr/src/load.lisp

CMD sbcl --load /usr/src/startup.lisp
