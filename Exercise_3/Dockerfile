FROM alpine:latest AS builder

RUN echo "<p> Hello World </p>" > /index.html

FROM nginx:alpine

COPY --from=builder /index.html /usr/share/nginx/html/index.html

CMD echo "starting nginx" && nginx -g 'daemon off;'

