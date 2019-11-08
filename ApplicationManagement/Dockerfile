FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch
WORKDIR /app
COPY ApplicationManagement.csproj ./
RUN dotnet restore
COPY . .
EXPOSE 6000
CMD dotnet run