

namespace gregsListSharp.Services;



public class HouseService(HouseRepository repo)
{
  private readonly HouseRepository repo = repo;

    internal House CreateHouse(House houseData)
    {
      House house = repo.CreateHouse(houseData);
      return house;
    }

    internal List<House> GetAllHouses()
    {
      List<House> houses = repo.GetAllHouses();
      return houses;
    }

    internal House GetHouseById(int houseId)
    {
      House house = repo.GetHouseById(houseId);
      if(house == null) throw new Exception("no house with that house id bozo. try again");
      return house;
    }

    internal string RemoveHouse(int houseId)
    {
      House original = GetHouseById(houseId);
      repo.RemoveHouse(houseId);
      return "house removed, hope you're happy.";
    }

    internal House UpdateHouse(House updateData)
    {
      House original = GetHouseById(updateData.Id);
      original.Sqft = updateData.Sqft != 0 ? updateData.Sqft : original.Sqft;
      original.Bedrooms = updateData.Bedrooms != 0 ? updateData.Bedrooms : original.Bedrooms;
      original.Bathrooms = updateData.Bathrooms != 0 ? updateData.Bathrooms : original.Bathrooms;
      original.ImgUrl ??= updateData.ImgUrl;
      original.Description ??= updateData.Description;
      original.Price = updateData.Price != 0 ? updateData.Price : original.Price;

      House update = repo.UpdateHouse(original);
      return update;
    }
}