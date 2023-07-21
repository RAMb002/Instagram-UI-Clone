import 'package:instagram_clone/model/user_data/content.dart';
import 'package:instagram_clone/model/user_data/content_image.dart';
import 'package:instagram_clone/model/user_data/reel.dart';

class Data{
  static List horizontalList =[
    Content(imageUrl: "https://randomuser.me/api/portraits/men/21.jpg", name: "Rambo", message: "hi this is rambo speaking · 1 w", time: "9 Tue",status: false,subMessage: "20 new messages · 2 w",followers: 245,following: 453),
    Content(imageUrl: "https://randomuser.me/api/portraits/men/10.jpg", name: "Bobby ford", message: "I am working in harvard · 1 w", time: "8 fri",status: false,subMessage: "Sent a reel · 1 w",followers: 451,following: 356),
    Content(imageUrl: "https://randomuser.me/api/portraits/men/4.jpg", name: "Will", message: "I am studying in voc college · 5 d", time: "30 wed",status: true,subMessage: "5 new messages · 6 d",followers: 123,following: 311),
    Content(imageUrl: "https://randomuser.me/api/portraits/men/28.jpg", name: "Joshua", message: "I am doing part time job in a pizza shop · 3 d", time: "20 mon ",status: false,subMessage: "Reacted to your message · 5 d",followers: 674,following: 534),
    Content(imageUrl: "https://randomuser.me/api/portraits/men/6.jpg", name: "Brett Jacobs", message: "I love to code for a long time · 1 d", time: "12 sat",status: false,subMessage: "seen",followers: 178,following: 673),
    Content(imageUrl: "https://randomuser.me/api/portraits/men/68.jpg", name: "Edgar Hansen", message: "Got a job in google recently · 1 d", time:"18 sun",status: false,subMessage: "Liked a message · 1 d",followers: 457,following: 2002),
    Content(imageUrl: "https://randomuser.me/api/portraits/women/1.jpg", name: "Lorraine Wilson", message: "Life is getting sad now a days dont like it at all", time: "1 may",status: true ,subMessage:"3 new messages · 2 d",followers: 2435,following: 753),
    Content(imageUrl: "https://randomuser.me/api/portraits/women/10.jpg", name: "Clara Taylor", message: "I like to play games a lot · 8 h", time: "12 feb",status: true,subMessage: "Mentioned you in a story · 7 h",followers: 755,following: 967),
    Content(imageUrl: "https://randomuser.me/api/portraits/women/67.jpg", name: "Marion Burke", message: "I am gonna get married soon · 6 h", time: "17 tue",status: false,subMessage: "seen",followers: 2453,following: 4530),
    Content(imageUrl: "https://randomuser.me/api/portraits/women/33.jpg", name: "Eleanor Perez", message: "Lot of Bills to pay · 3 h", time: "2 mon",status: false,subMessage: "sent 17m ago",followers: 1245,following: 1453),

  ];

  static List homeScreenBodyImages = [
    ContentImage(image:  "assets/images/scenaryOne.webp", likes: 205, comment: "That is an wonderful landscape, I am going to travel to that place.",totalComments: 344,day: "5 hours ago"),
    ContentImage(image: "assets/images/animeReelOne.jpg", likes: 702, comment: "Cant wait to watch it. Release Date?",totalComments: 256,day: "1 day ago"),
    ContentImage(image: "assets/images/roadOne.jfif", likes: 45, comment: "Take me to home, wanna rest",totalComments: 34,day: "3 days ago"),
  ContentImage(image: "assets/images/animeTwo.jpg", likes: 1021, comment: "Seventh Form - Rengokuuu",totalComments: 573,day: "3 days ago"),
  ContentImage(image: "assets/images/sceneryTwo.jfif", likes: 698, comment: "That is an fantastic view , I have never seen something like this before",totalComments: 86,day: "2 days ago"),
  ContentImage(image: "assets/images/animeThree.jpg", likes: 10396, comment: "Nothing can beat this classic for sure",totalComments: 1045,day: "4 days ago")


  ];

  static List suggestedReels =[
    ReelData(image: "assets/images/animeOne.jpg", likes: 698, comment: "Anime name - Unknown",totalComments: 86,day: "2 days ago",imageUrl: "https://randomuser.me/api/portraits/men/68.jpg", name: "Edgar Hansen",),
    ReelData(image:  "assets/images/street.jpg", likes: 205, comment: "I am going to travel there",totalComments: 344,day: "5 hours ago",imageUrl: "https://randomuser.me/api/portraits/men/21.jpg", name: "Rambo",),
    ReelData(image:  "assets/images/koreanFour.jpg", likes: 345, comment: "Member of the blackpink",totalComments: 34,day: "3 days ago",imageUrl: "https://randomuser.me/api/portraits/men/6.jpg", name: "Brett Jacobs"),
    ReelData(image:  "assets/images/girll.jpg", likes: 923, comment: "The beauty of black.",totalComments: 344,day: "5 hours ago",imageUrl: "https://randomuser.me/api/portraits/men/10.jpg", name: "Bobby ford",),
    ReelData(image:  "assets/images/koreanThree.jpg", likes: 205, comment: "The water is so clear",totalComments: 344,day: "5 hours ago",imageUrl: "https://randomuser.me/api/portraits/men/4.jpg", name: "Will"),
    ReelData(image: "assets/images/animeReelTwo.webp", likes: 702, comment: "Waa, nice coffee",totalComments: 256,day: "1 day ago",imageUrl: "https://randomuser.me/api/portraits/men/28.jpg", name: "Joshua"),
    // ReelData(image: "assets/images/koreanOne.jfif", likes: 1021, comment: "Seventh Form - Rengokuuu",totalComments: 573,day: "3 days ago"),
    ReelData(image: "assets/images/koreanTwo.jpeg", likes: 10396, comment: "The Blackpink",totalComments: 1045,day: "4 days ago",imageUrl: "https://randomuser.me/api/portraits/women/1.jpg", name: "Lorraine Wilson",),
    ReelData(image: "assets/images/food.webp", likes: 10396, comment: "The best pasta ever",totalComments: 1045,day: "4 days ago",imageUrl: "https://randomuser.me/api/portraits/women/33.jpg", name: "Eleanor Perez")

  ];

  static List storyList = [
    "assets/images/street.jpg",
    "assets/images/girll.jpg",
    "assets/images/animeOne.jpg",
    "assets/images/koreanFour.jpg",

    "assets/images/koreanThree.jpg",
  "assets/images/animeReelTwo.webp",
    "assets/images/koreanTwo.jpeg"
        "assets/images/food.webp",
    "assets/images/animeOne.jpg",
    "assets/images/street.jpg",
  ];

  static List myProfile = [
    Content(imageUrl: "assets/images/myProfile.jpg", name: "Ram Prasanth", message: "hi this is rambo speaking · 1 w", time: "9 Tue",status: false,subMessage: "20 new messages · 2 w",followers: 245,following: 453),

  ];
  //
  // static List suggestedReels = [
  //   "assets/images/koreanThree.jpg",
  //   "assets/images/animeReelTwo.webp",
  //   "assets/images/koreanFour.jpg",
  //   "assets/images/koreanOne.jfif",
  //   "assets/images/animeReelOne.jpg",
  //   "assets/images/koreanTwo.jpeg",
  //   "assets/images/food.webp"
  // ];

  static List searchGridAllData =[
    "https://media.istockphoto.com/photos/two-happy-asian-girls-using-smartphone-checking-flight-or-online-at-picture-id682572826?k=20&m=682572826&s=612x612&w=0&h=fYfurX6mu_te9a2UZvqJWScYjv65KqLVGUHICM7G2cQ=",
    "https://cdn.pixabay.com/photo/2022/07/29/16/30/sea-7352141_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/07/09/17/42/dog-7311407_960_720.jpg",
    "https://media.istockphoto.com/photos/grilled-cheese-spinach-and-tomato-sandwich-on-concrete-background-picture-id1308448446?b=1&k=20&m=1308448446&s=170667a&w=0&h=w8AyYHTO725wiMw5AwDhnx-cKdweThfMqGybwLLfTos=",
    "https://cdn.pixabay.com/photo/2021/09/07/18/10/cat-6604565__340.jpg",
    "https://media.istockphoto.com/photos/young-adult-happy-asian-woman-wear-eyeglasses-using-mobile-phone-for-picture-id1313939390?k=20&m=1313939390&s=612x612&w=0&h=1Q0wWsTXAKINpUKv5pgYlht399X04gVDF754Gr5IC7I=",
    "https://media.istockphoto.com/photos/happy-excited-infant-baby-girl-crawling-on-the-bed-picture-id1186066169?k=20&m=1186066169&s=612x612&w=0&h=s9A-lD9HHx1UMiC2N3fuQgrFnKBcixbqmghI6PXhbRg=",
    "https://media.istockphoto.com/photos/portrait-young-woman-with-laughing-corgi-puppy-nature-background-picture-id1276788283?k=20&m=1276788283&s=612x612&w=0&h=U8vbtohy7ptRPKs_xHJ-U1niZW84jZjbMa4GArepJKc=",
    "https://cdn.pixabay.com/photo/2022/08/20/08/41/thunderstorm-7398529_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/05/27/10/35/strawberry-7224875__340.jpg",
    "https://media.istockphoto.com/photos/stirfried-noodles-closeup-picture-id1184359662?b=1&k=20&m=1184359662&s=170667a&w=0&h=tHVkfOuOqvw96UZqMmxXJGnJSCVvpXd_JLdkktwM744=",
    "https://media.istockphoto.com/photos/beautiful-young-couple-expressing-their-feelings-on-the-street-picture-id1086628458?k=20&m=1086628458&s=612x612&w=0&h=sXmm1hzPZXAa8C01H0rQMDgxs9L1WaL8b7M5tI8f7Lo=",
  ];

  static List searchGridTileData = [
    [
      "https://media.istockphoto.com/photos/two-happy-asian-girls-using-smartphone-checking-flight-or-online-at-picture-id682572826?k=20&m=682572826&s=612x612&w=0&h=fYfurX6mu_te9a2UZvqJWScYjv65KqLVGUHICM7G2cQ=",
      "https://cdn.pixabay.com/photo/2022/07/29/16/30/sea-7352141_960_720.jpg",
      "https://cdn.pixabay.com/photo/2022/07/09/17/42/dog-7311407_960_720.jpg",
      "https://media.istockphoto.com/photos/grilled-cheese-spinach-and-tomato-sandwich-on-concrete-background-picture-id1308448446?b=1&k=20&m=1308448446&s=170667a&w=0&h=w8AyYHTO725wiMw5AwDhnx-cKdweThfMqGybwLLfTos=",
      "https://cdn.pixabay.com/photo/2022/08/14/10/22/couple-7385502__340.jpg"
    ],
    [
      "https://cdn.pixabay.com/photo/2021/09/07/18/10/cat-6604565__340.jpg",
      "https://media.istockphoto.com/photos/young-adult-happy-asian-woman-wear-eyeglasses-using-mobile-phone-for-picture-id1313939390?k=20&m=1313939390&s=612x612&w=0&h=1Q0wWsTXAKINpUKv5pgYlht399X04gVDF754Gr5IC7I=",
      "https://media.istockphoto.com/photos/happy-excited-infant-baby-girl-crawling-on-the-bed-picture-id1186066169?k=20&m=1186066169&s=612x612&w=0&h=s9A-lD9HHx1UMiC2N3fuQgrFnKBcixbqmghI6PXhbRg=",
      "https://media.istockphoto.com/photos/portrait-young-woman-with-laughing-corgi-puppy-nature-background-picture-id1276788283?k=20&m=1276788283&s=612x612&w=0&h=U8vbtohy7ptRPKs_xHJ-U1niZW84jZjbMa4GArepJKc=",
      "https://cdn.pixabay.com/photo/2021/02/11/05/34/woman-6004286_960_720.jpg",
    ],
    [
      "https://cdn.pixabay.com/photo/2022/08/20/08/41/thunderstorm-7398529_960_720.jpg",
      "https://cdn.pixabay.com/photo/2022/05/27/10/35/strawberry-7224875__340.jpg",
      "https://media.istockphoto.com/photos/stirfried-noodles-closeup-picture-id1184359662?b=1&k=20&m=1184359662&s=170667a&w=0&h=tHVkfOuOqvw96UZqMmxXJGnJSCVvpXd_JLdkktwM744=",
      "https://media.istockphoto.com/photos/beautiful-young-couple-expressing-their-feelings-on-the-street-picture-id1086628458?k=20&m=1086628458&s=612x612&w=0&h=sXmm1hzPZXAa8C01H0rQMDgxs9L1WaL8b7M5tI8f7Lo=",
      "https://cdn.pixabay.com/photo/2022/02/17/04/54/animal-7017939__340.jpg",
    ]

  ];
}