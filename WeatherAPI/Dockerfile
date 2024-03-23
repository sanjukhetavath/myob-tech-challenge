FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["WeatherAPI.csproj", "."]
RUN dotnet restore "./WeatherAPI.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "WeatherAPI.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WeatherAPI.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
ENV ASPNETCORE_URLS http://*:80
ENV ASPNETCORE_ENVIRONMENT=Development
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WeatherAPI.dll"]