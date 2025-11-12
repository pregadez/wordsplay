# Build Stage
FROM golang:1.25-alpine as development

# Set environment variable
ENV APP_NAME wordsplay
ENV CMD_PATH ./cmd/server/main.go 
# Add Work directory
WORKDIR /${APP_NAME}

# Cache and install dependency
COPY go.mod go.sum ./
RUN go mod download

# Copy files
COPY . .
# Expose port to container
EXPOSE 8080
# Build the app
RUN go build -o wordsplay-server ${CMD_PATH}

#--------------Deploy stage------------#
FROM alpine
RUN apk --no-cache add ca-certificates
WORKDIR /root/
# copy env file
COPY --from=development /wordsplay/.env ./ 
# copy word data file
COPY --from=development /wordsplay/pkg/data.txt ./ 
# copy migration folder
COPY --from=development /wordsplay/pkg/migration ./migration
# copy the executable
COPY --from=development /wordsplay/wordsplay-server ./
EXPOSE 8080
ENTRYPOINT [ "./wordsplay-server" ]




