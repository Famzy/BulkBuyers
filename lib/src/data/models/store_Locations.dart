class Locations{
  int id;
  String name;

  Locations(this.id, this.name);
  static List <Locations> getLocations(){
    return<Locations>[
      Locations(1,"Abuja"),
    ];
  }
}