using WeatherAPI.DTO;

namespace WeatherAPI.Services.Interfaces
{
    public interface IWeatherService
    {
        Task<double> GetTemperature(string city);
        Task<WeatherOutfit> GetOutfitForATemperature(string city);
    }
}
