FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch
WORKDIR /app
COPY GatewayApi.csproj ./
RUN dotnet restore
COPY . .
EXPOSE 7000
CMD dotnet run