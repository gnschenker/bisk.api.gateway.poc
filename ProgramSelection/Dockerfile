FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch
WORKDIR /app
COPY ProgramSelection.csproj ./
RUN dotnet restore
COPY . .
EXPOSE 5000
CMD dotnet run