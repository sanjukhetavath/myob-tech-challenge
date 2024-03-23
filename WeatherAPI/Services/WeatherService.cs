using Microsoft.Extensions.Options;
using Weather.NET;
using Weather.NET.Exceptions;
using WeatherAPI.DTO;
using WeatherAPI.Enums;
using WeatherAPI.Services.Interfaces;

namespace WeatherAPI.Services
{
    public class WeatherService : IWeatherService
    {
        private readonly AppSettings _appSettings;
        public WeatherService(IOptions<AppSettings> settings)
        {
            _appSettings = settings.Value;
        }
        public async Task<WeatherOutfit> GetOutfitForATemperature(string city)
        {
            double temperature = await GetTemperature(city);

            if (temperature < 10)
                return new WeatherOutfit(city, $"{temperature.ToString("0.##")} degree", Outfit.Jacket);

            else if (temperature > 20)
                return new WeatherOutfit(city, $"{temperature.ToString("0.##")} degree", Outfit.Casual);

            else return new WeatherOutfit(city, $"{temperature.ToString("0.##")} degree", Outfit.Jumper);
        }

        public async Task<double> GetTemperature(string city)
        {
            WeatherClient client = new WeatherClient(_appSettings.APIKey);

            var weather = await client.GetCurrentWeatherAsync(city);
            return weather.Main.Temperature - 273.15;
        }
    }
}
