FROM alpine:3.19
RUN apk update && apk add curl openjdk21
COPY run.sh .
RUN chmod +x run.sh
ENV MODPACK=117
ENV RELEASE=11786
EXPOSE 25565
CMD /run.sh