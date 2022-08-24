FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app

COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build-env /app/out .

ENV ASPNETCORE_ENVIRONMENT Production
ENV GOOGLE_APPLICATION_CREDENTIALS "ivets-530b2-338621fc1f7e.json"

ENTRYPOINT ["dotnet", "iVets.Ui.Api.dll"]