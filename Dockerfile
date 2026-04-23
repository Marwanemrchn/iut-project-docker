FROM eclipse-temurin:25-jdk AS builder

WORKDIR /app

COPY . .

RUN chmod +x gradlew

RUN ./gradlew build --no-daemon -x test 


FROM eclipse-temurin:25-jre

WORKDIR /app

COPY --from=builder /app/build/libs/app.jar ./app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
