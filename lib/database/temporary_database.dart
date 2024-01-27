
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/model/user.dart';

import '../model/accommodation.dart';
import '../model/enum/accommodation_category.dart';
import '../model/enum/place_category.dart';
import '../model/favorite.dart';
import '../model/place.dart';
import '../model/restaurant.dart';
import '../model/visited.dart';

class TemporaryDatabase{
  //create a singleton to access this class statically
  static final _singleton = TemporaryDatabase._internal();

  factory TemporaryDatabase(){
    return _singleton;
  }

  TemporaryDatabase._internal();

  User currentUser = User(name: "Metehan", lastName: "Akgül", email: "mete.059@hotmail.com", password: "123456789");

  List<Place> places = [
    Place(title: "Selimiye Camii", image: "images/selimiye.jpg", category: PlaceCategory.historical, location: "Meydan, Mimar Sinan Cd., 22020 Edirne Merkez/Edirne", info: "Mimar sinan tarafından yapılan başyapıt bir camii"),
    Place(title: "Sultan II. Beyazid Külliyesi", image: "images/külliye1.jpg", category: PlaceCategory.historical, location: " ", info: " "),
    Place(title: "Karaağaç", image: "images/tren garı.jpg", category: PlaceCategory.historical, location: " ", info: " "),
    Place(title: "Meriç Köprüsü", image: "images/meric.jpg", category: PlaceCategory.historical, location: " ", info: " "),
    Place(title: "Üç Şerefeli Camii", image: "images/üçşerefelicamii.jpg", category: PlaceCategory.historical, location: " ", info: " "),
    Place(title: "Lozan Anıtı", image: "images/lozan-anıtı.jpg", category: PlaceCategory.historical, location: " ", info: " "),
    Place(title: "Edirne Arkeoloji ve Etnografya Müzesi", image: "images/etnografya.jpg", category: PlaceCategory.museum, location: " ", info: " "),
    Place(title: "Türk ve İslam Eserleri Müzesi", image: "images/islam.jpg", category: PlaceCategory.museum, location: " ", info: " "),
    Place(title: "Edirne Kent Müzesi", image: "images/edirne-kent-muzesi.jpg", category: PlaceCategory.museum, location: " ", info: " "),
    Place(title: "Selimiye Vakfı Müzesi", image: "images/selimiyevakıf.jpeg", category: PlaceCategory.museum, location: " ", info: " "),
    Place(title: "Fatih Sultan Mehmet Müzesi", image: "images/fsm.jpg", category: PlaceCategory.museum, location: " ", info: " "),
    Place(title: "Balkan Savaşları Müzesi", image: "images/balkansavaşları.jpg", category: PlaceCategory.museum, location: " ", info: " ")
  ];

  List<Accommodation> hotels = [
    Accommodation(title: "Hilly Otel", image: "images/hilly-hotel.jpg", info: "Edirne bölgesinde, üst kalite, spa, restoran olan otel.", location: "Şükrü Paşa Mah. Kıyık Cad. No.: 254, Edirne,", category: AccommodationCategory.hotel),
    Accommodation(title: "ND Suite Otel", image: "images/ND-Suit-Hotel.jpg", info: "Edirne bölgesinde restoran olan otel", location: "Sanayi Sitesi, 29. Sokak, Edirne, Edirne, 22100", category: AccommodationCategory.hotel),
  ];

  List<Favorite> favorites = [
    Favorite(favoritePlace: Accommodation(title: "Hilly Otel", image: "images/hilly-hotel.jpg", info: "Edirne bölgesinde, üst kalite, spa, restoran olan otel.", location: "Şükrü Paşa Mah. Kıyık Cad. No.: 254, Edirne,", category: AccommodationCategory.hotel), category: BasePlaceCategory.accommodation),
    Favorite(favoritePlace: Accommodation(title: "ND Suite Otel", image: "images/ND-Suit-Hotel.jpg", info: "Edirne bölgesinde restoran olan otel", location: "Sanayi Sitesi, 29. Sokak, Edirne, Edirne, 22100", category: AccommodationCategory.hotel), category: BasePlaceCategory.accommodation),
    Favorite(favoritePlace: Place(title: "Balkan Savaşları Müzesi", image: "images/balkansavaşları.jpg", category: PlaceCategory.museum, location: " ", info: " "), category: BasePlaceCategory.place),
    Favorite(favoritePlace: Place(title: "Meriç Köprüsü", image: "images/meric.jpg", category: PlaceCategory.historical, location: " ", info: " "), category: BasePlaceCategory.place)
  ];

  List<Restaurant> restaurants = [
    Restaurant(title: "Aydın Tava Ciğer", image:"images/aydın.jpg" , info: "", location: "Sabuni, Tahmis Çarşısı Sk. No:8, 22000 Edirne Merkez/Edirne"),
    Restaurant(title: "Edirneli Köfteci Osman", image: "images/osman.jpg", info: "", location: "Sarıcapaşa, Kıyık Cd. No:8, 22000 Edirne Merkez/Edirne"),
    Restaurant(title: "Ciğerci Niyazi Usta", image: "images/niyazi.jpg", info: "", location: "Mithat Paşa, Ortakapı Cd. No:9, 22020 Edirne Merkez/Edirne"),
    Restaurant(title: "Kırkpınar Ciğercisi", image: "images/kırkpınar.jpg", info: "", location: "Sabuni, Tahmis Çarşısı Sk. No:6, 22000 Edirne Merkez/Edirne"),
  ];

  List<VisitedPlace> visitedPlaces = [
    VisitedPlace(visitedPlace: Accommodation(title: "ND Suite Otel", image: "images/ND-Suit-Hotel.jpg", info: "Edirne bölgesinde restoran olan otel", location: "Sanayi Sitesi, 29. Sokak, Edirne, Edirne, 22100", category: AccommodationCategory.hotel), category: BasePlaceCategory.accommodation),
    VisitedPlace(visitedPlace: Place(title: "Balkan Savaşları Müzesi", image: "images/balkansavaşları.jpg", category: PlaceCategory.museum, location: " ", info: " "), category: BasePlaceCategory.place),
    VisitedPlace(visitedPlace: Place(title: "Türk ve İslam Eserleri Müzesi", image: "images/islam.jpg", category: PlaceCategory.museum, location: " Meydan, Zehrimar Cami Sok., 22020 Edirne Merkez/Edirne", info: "Edirne'de ilk müze Atatürk'ün talimatıyla 1925 yılında Selimiye Camii Dar-ül Hadis Medresesi'nde kurulmuştur. Osmanlı İmparatorluğu'nun yaklaşık 94 yıl başkentliğini yapan Edirne'de saray, halk sanatlarını etkilemiş ve etnografya açısından zenginlik kazandırmıştır. Bu yüzden ikinci bir müzeye gerek duyulmuştur.Selimiye Camii avlusu içinde bulunan Dar-üs Sıbyan Medresesi'nin, restore ettirilmesiyle Etnografya adı altında ikinci bir bölüm, Edirne'nin kurtuluşunun 13'üncü yılında (25 Kasım 1936) burada açılmıştır.İkinci Dünya Savaşından sonra Edirne Müzelerindeki eserlerin birçoğunun müzelere geri verilmesi sonucu elde kalanlar yalnızca Dar-ül Hadis Medresesi'nde sergilenmiştir.Bundan sonraki yıllarda satın alma, bağış ve kazılardan gelen eserlerle müzedeki eserlerin sayısının artması nedeniyle Edirne'de ihtiyaç duyulan yeni bir müze binası 1966 yılında programa alınmıştır. Selimiye Camii civarında müze için temin edilen arsa üzerine yapılan müze binası, 13 Haziran 1971 yılında Arkeoloji ve Etnografya Müzesi adı ile açılmış, Dar-ül Hadis Medresesindeki Müze de Türk İslam Eserleri Müzesi olarak düzenlenmiştir. "),category: BasePlaceCategory.place),
    VisitedPlace(visitedPlace: Place(title: "Meriç Köprüsü", image: "images/meric.jpg", category: PlaceCategory.historical, location: " ", info: " "), category: BasePlaceCategory.place),
    VisitedPlace(visitedPlace:Place(title: "Selimiye Camii", image: "images/selimiye.jpg", category: PlaceCategory.historical, location: "Meydan, Mimar Sinan Cd., 22020 Edirne Merkez/Edirne ", info: "Edirne’nin her yerinden tüm ihtişamı ile görülebilen, dört zarif minaresi, muhteşem kubbesi ile eşsiz bir yapı olan Selimiye Camii dünya tarihinin ünlü mimarlarından birisi olan Mimar Sinan’ın eseridir. Yapımına II.Selim’in emri ile 1568 yılında başlanan caminin inşası binlerce kişinin yoğun çalışması ile yedi yıl sürmüş ve 1575 yılında tamamlanmıştır. Osmanlı mimarisinin en önemli eseri olarak kabul edilen camiyi Mimar Sinan da “ustalık eserim” olarak tanımlamıştır.İlk olarak anıtsal görünümü ile dikkat çeken Selimiye Camii’nin dört köşesinde yer alan, her biri üç şerefeli minareleri ,dünyanın en görkemli örnekleri arasında gösterilmektedir. Caminin minarelerinin uzunluğu alemleri dahil 85,67 metre olarak ölçülmüştür. Minarelerin mimari açıdan dikkat çekici yönleri, mümkün olabilecek en ince şekilde tasarlanmaları ve her birinde birbiriyle çakışmadan ayrı ayrı şerefelere ulaşan üçer merdivenin bulunmasıdır.Osmanlı İmparatorluğu’nun İstanbul’dan önce başkentliğini yapmış Edirne şehrindeki Selimiye Camii ve Külliyesi, 2011 yılında UNESCO Dünya Miras Listesi’ne dahil edilmiştir."),category: BasePlaceCategory.place),
    VisitedPlace(visitedPlace: Restaurant(title: "Aydın Tava Ciğer", image:"images/aydın.jpg" , info: "", location: "Sabuni, Tahmis Çarşısı Sk. No:8, 22000 Edirne Merkez/Edirne"),category: BasePlaceCategory.restaurant),
    VisitedPlace(visitedPlace:Restaurant(title: "Edirneli Köfteci Osman", image: "images/osman.jpg", info: "", location: "Sarıcapaşa, Kıyık Cd. No:8, 22000 Edirne Merkez/Edirne"),category: BasePlaceCategory.restaurant),

  ];
}