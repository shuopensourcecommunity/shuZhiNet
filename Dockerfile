FROM golang:1.12-alpine as builder
RUN apk add git
ENV GO111MODULE=on
COPY . /go/src/shuZhiNet
WORKDIR /go/src/shuZhiNet
RUN go get && go build -o shuZhiNet .


FROM alpine
COPY --from=builder /go/src/shuZhiNet/shuZhiNet .
CMD ["./shuZhiNet"]
EXPOSE 8000
