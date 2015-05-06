FROM alpine:3.1

COPY ./ /app

RUN apk --update add nodejs && \
	cd /app && \
	npm install && \
	rm -rf /var/cache/apk/*

EXPOSE 8080

CMD ["/usr/bin/node","/app/server.js"]