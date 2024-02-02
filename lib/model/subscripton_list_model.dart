class StoryListModel {
  StoryListModel({
    this.status,
    this.message,
    this.today,
    this.weekly,
  });

  final bool? status;
  final String? message;
  final Today? today;
  final List<Today>? weekly;

  StoryListModel copyWith({
    bool? status,
    String? message,
    Today? today,
    List<Today>? weekly,
  }) {
    return StoryListModel(
      status: status ?? this.status,
      message: message ?? this.message,
      today: today ?? this.today,
      weekly: weekly ?? this.weekly,
    );
  }

  factory StoryListModel.fromJson(Map<String, dynamic> json){
    return StoryListModel(
      status: json["status"] ?? false,
      message: json["message"] ?? "",
      today: json["today"] == null ? null : Today.fromJson(json["today"]),
      weekly: json["weekly"] == null ? [] : List<Today>.from(json["weekly"]!.map((x) => Today.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "today": today?.toJson(),
    "weekly": weekly?.map((x) => x.toJson()).toList(),
  };

  @override
  String toString(){
    return "$status, $message, $today, $weekly, ";
  }

}

class Today {
  Today({
    required this.id,
    required this.uuid,
    required this.gender,
    required this.title,
    required this.age,
    required this.scheduleAt,
    required this.genreId,
    required this.scheduleDate,
    required this.storyImage,
    required this.imageUrl,
    required this.storyDescription,
    required this.storyTitle,
    required this.storyChapter,
  });

  final int id;
  final String uuid;
  final String gender;
  final String title;
  final int age;
  final DateTime? scheduleAt;
  final int genreId;
  final String scheduleDate;
  final String storyImage;
  final String imageUrl;
  final String storyDescription;
  final String storyTitle;
  final List<StoryChapter> storyChapter;

  Today copyWith({
    int? id,
    String? uuid,
    String? gender,
    String? title,
    int? age,
    DateTime? scheduleAt,
    int? genreId,
    String? scheduleDate,
    String? storyImage,
    String? imageUrl,
    String? storyDescription,
    String? storyTitle,
    List<StoryChapter>? storyChapter,
  }) {
    return Today(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      gender: gender ?? this.gender,
      title: title ?? this.title,
      age: age ?? this.age,
      scheduleAt: scheduleAt ?? this.scheduleAt,
      genreId: genreId ?? this.genreId,
      scheduleDate: scheduleDate ?? this.scheduleDate,
      storyImage: storyImage ?? this.storyImage,
      imageUrl: imageUrl ?? this.imageUrl,
      storyDescription: storyDescription ?? this.storyDescription,
      storyTitle: storyTitle ?? this.storyTitle,
      storyChapter: storyChapter ?? this.storyChapter,
    );
  }

  factory Today.fromJson(Map<String, dynamic> json){
    return Today(
      id: json["id"] ?? 0,
      uuid: json["uuid"] ?? "",
      gender: json["gender"] ?? "",
      title: json["title"] ?? "",
      age: json["age"] ?? 0,
      scheduleAt: DateTime.tryParse(json["schedule_at"] ?? ""),
      genreId: json["genre_id"] ?? 0,
      scheduleDate: json["scheduleDate"] ?? "",
      storyImage: json["story_image"] ?? "",
      imageUrl: json["image_url"] ?? "",
      storyDescription: json["story_description"] ?? "",
      storyTitle: json["story_title"] ?? "",
      storyChapter: json["story_chapter"] == null ? [] : List<StoryChapter>.from(json["story_chapter"]!.map((x) => StoryChapter.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "gender": gender,
    "title": title,
    "age": age,
    "schedule_at": scheduleAt?.toIso8601String(),
    "genre_id": genreId,
    "scheduleDate": scheduleDate,
    "story_image": storyImage,
    "image_url": imageUrl,
    "story_description": storyDescription,
    "story_title": storyTitle,
    "story_chapter": storyChapter.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$id, $uuid, $gender, $title, $age, $scheduleAt, $genreId, $scheduleDate, $storyImage, $imageUrl, $storyDescription, $storyTitle, $storyChapter, ";
  }

}

class StoryChapter {
  StoryChapter({
    required this.id,
    required this.storyId,
    required this.title,
    required this.description,
    required this.chapterNo,
    required this.imagePrompt,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.storyTitle,
    required this.storyDescription,
    required this.imageUrl,
  });

  final int id;
  final int storyId;
  final String title;
  final String description;
  final int chapterNo;
  final String imagePrompt;
  final String image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String storyTitle;
  final String storyDescription;
  final String imageUrl;

  StoryChapter copyWith({
    int? id,
    int? storyId,
    String? title,
    String? description,
    int? chapterNo,
    String? imagePrompt,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? storyTitle,
    String? storyDescription,
    String? imageUrl,
  }) {
    return StoryChapter(
      id: id ?? this.id,
      storyId: storyId ?? this.storyId,
      title: title ?? this.title,
      description: description ?? this.description,
      chapterNo: chapterNo ?? this.chapterNo,
      imagePrompt: imagePrompt ?? this.imagePrompt,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      storyTitle: storyTitle ?? this.storyTitle,
      storyDescription: storyDescription ?? this.storyDescription,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory StoryChapter.fromJson(Map<String, dynamic> json){
    return StoryChapter(
      id: json["id"] ?? 0,
      storyId: json["story_id"] ?? 0,
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      chapterNo: json["chapter_no"] ?? 0,
      imagePrompt: json["image_prompt"] ?? "",
      image: json["image"] ?? "",
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
      storyTitle: json["story_title"] ?? "",
      storyDescription: json["story_description"] ?? "",
      imageUrl: json["image_url"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "story_id": storyId,
    "title": title,
    "description": description,
    "chapter_no": chapterNo,
    "image_prompt": imagePrompt,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "story_title": storyTitle,
    "story_description": storyDescription,
    "image_url": imageUrl,
  };

  @override
  String toString(){
    return "$id, $storyId, $title, $description, $chapterNo, $imagePrompt, $image, $createdAt, $updatedAt, $deletedAt, $storyTitle, $storyDescription, $imageUrl, ";
  }

}

/*
{
	"status": true,
	"message": "Story List ",
	"today": {
		"id": 7,
		"uuid": "a810b795-d59f-40cd-84f9-0f13ccc19a17",
		"gender": "m",
		"title": "An Unassuming Woman",
		"age": 7,
		"schedule_at": "2023-12-06 00:00:00",
		"genre_id": 2,
		"scheduleDate": "6 December 2023",
		"story_image": "image_1701773180.png",
		"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701773180.png",
		"story_description": "With curiosity piqued, Granny Elm decided to investigate. She packed up some food and decided to follow the strange markings on the map. Along the way, she faced several obstacles: thorny bushes, slippery stones, and narrow paths. Still, Granny Elm's adventurous spirit got the better of her. Meanwhile, back at the village, everyone was wondering where the old woman had gone.",
		"story_title": "An Unassuming Woman",
		"story_chapter": [
			{
				"id": 31,
				"story_id": 7,
				"title": "The Mysterious Granny",
				"description": "In a bustling little village, there lived an unassuming old woman known as Granny Elm. She was always seen with her sun hat and her flower basket. Every day, she would collect flowers from the outskirts of town. But, today was different. While picking flowers in an uncommon location, she stumbled upon a cryptic old map. It was a map illustrated with strange markings and symbols that Granny Elm couldn't understand.",
				"chapter_no": 1,
				"image_prompt": "An old woman with a sun hat finding a map among flowers.",
				"image": "image_1701773180.png",
				"created_at": "2023-12-05T10:46:20.000000Z",
				"updated_at": "2023-12-05T10:46:20.000000Z",
				"deleted_at": null,
				"story_title": "The Mysterious Granny",
				"story_description": "In a bustling little village, there lived an unassuming old woman known as Granny Elm. She was always seen with her sun hat and her flower basket. Every day, she would collect flowers from the outskirts of town. But, today was different. While picking flowers in an uncommon location, she stumbled upon a cryptic old map. It was a map illustrated with strange markings and symbols that Granny Elm couldn't understand.",
				"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701773180.png"
			},
			{
				"id": 32,
				"story_id": 7,
				"title": "The Quest Begins",
				"description": "With curiosity piqued, Granny Elm decided to investigate. She packed up some food and decided to follow the strange markings on the map. Along the way, she faced several obstacles: thorny bushes, slippery stones, and narrow paths. Still, Granny Elm's adventurous spirit got the better of her. Meanwhile, back at the village, everyone was wondering where the old woman had gone.",
				"chapter_no": 2,
				"image_prompt": "A woman walking through the dense forest with a map.",
				"image": "image_1701773180.png",
				"created_at": "2023-12-05T10:46:20.000000Z",
				"updated_at": "2023-12-05T10:46:20.000000Z",
				"deleted_at": null,
				"story_title": "The Quest Begins",
				"story_description": "With curiosity piqued, Granny Elm decided to investigate. She packed up some food and decided to follow the strange markings on the map. Along the way, she faced several obstacles: thorny bushes, slippery stones, and narrow paths. Still, Granny Elm's adventurous spirit got the better of her. Meanwhile, back at the village, everyone was wondering where the old woman had gone.",
				"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701773180.png"
			},
			{
				"id": 33,
				"story_id": 7,
				"title": "New Discoveries",
				"description": "Granny Elm's journey led her to an ancient temple, hidden among the depths of the forest. Her heart pounded with excitement as she stepped inside. The temple was filled with old artifacts and symbols, which matched the markings on the map. She realized that she might have discovered the lost civilization that the village elders spoke about.",
				"chapter_no": 3,
				"image_prompt": "An old woman examining an ancient temple.",
				"image": "image_1701773180.png",
				"created_at": "2023-12-05T10:46:20.000000Z",
				"updated_at": "2023-12-05T10:46:20.000000Z",
				"deleted_at": null,
				"story_title": "New Discoveries",
				"story_description": "Granny Elm's journey led her to an ancient temple, hidden among the depths of the forest. Her heart pounded with excitement as she stepped inside. The temple was filled with old artifacts and symbols, which matched the markings on the map. She realized that she might have discovered the lost civilization that the village elders spoke about.",
				"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701773180.png"
			},
			{
				"id": 34,
				"story_id": 7,
				"title": "The Unexpected Hero",
				"description": "On her return, Granny Elm narrated her thrilling adventure to the village people. Everyone was surprised to learn about the unassuming woman's bravery and intelligence. She became the village’s pride overnight and was titled 'The Unexpected Hero'. Now, Granny Elm wasn't just an old woman with a sun hat and a flower basket anymore, but a brave adventurer with a tale to tell.",
				"chapter_no": 4,
				"image_prompt": "The villagers cheering for Granny Elm.",
				"image": "image_1701773180.png",
				"created_at": "2023-12-05T10:46:20.000000Z",
				"updated_at": "2023-12-05T10:46:20.000000Z",
				"deleted_at": null,
				"story_title": "The Unexpected Hero",
				"story_description": "On her return, Granny Elm narrated her thrilling adventure to the village people. Everyone was surprised to learn about the unassuming woman's bravery and intelligence. She became the village’s pride overnight and was titled 'The Unexpected Hero'. Now, Granny Elm wasn't just an old woman with a sun hat and a flower basket anymore, but a brave adventurer with a tale to tell.",
				"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701773180.png"
			},
			{
				"id": 35,
				"story_id": 7,
				"title": "The Moral of the Story",
				"description": "Granny Elm's daring adventure reminds us to never underestimate anyone based on their appearances. Age is just a number when it comes to exploring new things, breaking stereotypes, and making epic discoveries. Everyone carries an element of surprise within them, even the most unassuming person. So, never judge a book by its cover, or in this case, a Granny by her hat!",
				"chapter_no": 5,
				"image_prompt": "Granny Elm wearing her sun hat, with the village in the background.",
				"image": "image_1701773180.png",
				"created_at": "2023-12-05T10:46:20.000000Z",
				"updated_at": "2023-12-05T10:46:20.000000Z",
				"deleted_at": null,
				"story_title": "The Moral of the Story",
				"story_description": "Granny Elm's daring adventure reminds us to never underestimate anyone based on their appearances. Age is just a number when it comes to exploring new things, breaking stereotypes, and making epic discoveries. Everyone carries an element of surprise within them, even the most unassuming person. So, never judge a book by its cover, or in this case, a Granny by her hat!",
				"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701773180.png"
			}
		]
	},
	"weekly": [
		{
			"id": 8,
			"uuid": "b6645a42-6915-4754-9039-2e7b2ce944e5",
			"title": "Space Story",
			"age": 7,
			"genre_id": 1,
			"gender": "m",
			"schedule_at": "2023-12-04 00:00:00",
			"story_image": "image_1701848892.png",
			"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701848892.png",
			"story_description": "With the guide book in hand, DummyBoy found the secret location where a beautiful, shining rocket was waiting for him. It was a magical rocket, a unique one, with its own AI personality named 'StarDust'. Excited, DummyBoy hopped into the rocket, and together with StarDust, they blasted off into the vast expanse of the universe.",
			"scheduleDate": "4 December 2023",
			"story_title": "Space Story",
			"story_chapter": [
				{
					"id": 36,
					"story_id": 8,
					"title": "A Mysterious Invitation",
					"description": "Once upon a time, there was a curious and adventurous boy named DummyBoy. One day, he received a mysterious invitation in the mail. It was an invitation to explore Space! DummyBoy was unsure who had sent it, but he was both fascinated and excited. After all, his dream was to become an astronaut one day. The invitation included a small instruction manual and a space suit. DummyBoy couldn't wait to embark on his space adventure.",
					"chapter_no": 1,
					"image_prompt": "A puzzled boy holding a letter and a shiny space suit.",
					"image": "image_1701776570.png",
					"created_at": "2023-12-05T11:42:50.000000Z",
					"updated_at": "2023-12-05T11:42:50.000000Z",
					"deleted_at": null,
					"story_title": "A Mysterious Invitation",
					"story_description": "Once upon a time, there was a curious and adventurous boy named Ash. One day, he received a mysterious invitation in the mail. It was an invitation to explore Space! Ash was unsure who had sent it, but he was both fascinated and excited. After all, his dream was to become an astronaut one day. The invitation included a small instruction manual and a space suit. Ash couldn't wait to embark on his space adventure.",
					"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701776570.png"
				},
				{
					"id": 37,
					"story_id": 8,
					"title": "The Magic Rocket",
					"description": "With the guide book in hand, DummyBoy found the secret location where a beautiful, shining rocket was waiting for him. It was a magical rocket, a unique one, with its own AI personality named 'StarDust'. Excited, DummyBoy hopped into the rocket, and together with StarDust, they blasted off into the vast expanse of the universe.",
					"chapter_no": 2,
					"image_prompt": "A boy getting into a magical, shining rocket, ready for take off.",
					"image": "image_1701848892.png",
					"created_at": "2023-12-05T11:42:50.000000Z",
					"updated_at": "2023-12-06T07:48:12.000000Z",
					"deleted_at": null,
					"story_title": "The Magic Rocket",
					"story_description": "With the guide book in hand, Ash found the secret location where a beautiful, shining rocket was waiting for him. It was a magical rocket, a unique one, with its own AI personality named 'StarDust'. Excited, Ash hopped into the rocket, and together with StarDust, they blasted off into the vast expanse of the universe.",
					"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701848892.png"
				},
				{
					"id": 38,
					"story_id": 8,
					"title": "The Incredible Space Voyage",
					"description": "In space, DummyBoy witnessed the marvels of the cosmos. He saw planets of different colors, sparkling stars, and swirling galaxies. Each sight was more spectacular than the last. This triggered his scientific curiosity and he documented every single thing in his explorer's diary. The trip was turning out to be much more enlightening than he had ever imagined.",
					"chapter_no": 3,
					"image_prompt": "A boy inside a spaceship, looking awestruck at the colorful planets, stars, and galaxies from a window.",
					"image": "image_1701776570.png",
					"created_at": "2023-12-05T11:42:50.000000Z",
					"updated_at": "2023-12-05T11:42:50.000000Z",
					"deleted_at": null,
					"story_title": "The Incredible Space Voyage",
					"story_description": "In space, Ash witnessed the marvels of the cosmos. He saw planets of different colors, sparkling stars, and swirling galaxies. Each sight was more spectacular than the last. This triggered his scientific curiosity and he documented every single thing in his explorer's diary. The trip was turning out to be much more enlightening than he had ever imagined.",
					"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701776570.png"
				},
				{
					"id": 39,
					"story_id": 8,
					"title": "A Brave Encounter with Aliens",
					"description": "During his journey, DummyBoy crossed paths with an alien spaceship. Initially, he was terrified but StarDust reminded him to stay calm. So, DummyBoy decided to be brave and met the friendly aliens. They exchanged knowledge about their respective planets and promised to keep in touch, forging a unique friendship.",
					"chapter_no": 4,
					"image_prompt": "DummyBoy shaking hands with interesting looking friendly aliens.",
					"image": "image_1701776570.png",
					"created_at": "2023-12-05T11:42:50.000000Z",
					"updated_at": "2023-12-05T11:42:50.000000Z",
					"deleted_at": null,
					"story_title": "A Brave Encounter with Aliens",
					"story_description": "During his journey, Ash crossed paths with an alien spaceship. Initially, he was terrified but StarDust reminded him to stay calm. So, Ash decided to be brave and met the friendly aliens. They exchanged knowledge about their respective planets and promised to keep in touch, forging a unique friendship.",
					"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701776570.png"
				},
				{
					"id": 40,
					"story_id": 8,
					"title": "The Return Home and A Valuable Lesson Learned",
					"description": "After an incredible space voyage, DummyBoy returned to Earth a changed boy. The adventure not only satisfied his curiosity but also taught him about bravery, friendship, and the importance of being open to new experiences. He realized that the universe was full of wonders, and he owed his extraordinary journey to his courage and intellectual curiosity. The moral of DummyBoy's story is, 'Sometimes, you need to step out of your comfort zone to find what the universe has to offer.'",
					"chapter_no": 5,
					"image_prompt": "DummyBoy back on earth, sharing his space adventure with his friends.",
					"image": "image_1701781171.png",
					"created_at": "2023-12-05T11:42:50.000000Z",
					"updated_at": "2023-12-05T12:59:31.000000Z",
					"deleted_at": null,
					"story_title": "The Return Home and A Valuable Lesson Learned",
					"story_description": "After an incredible space voyage, Ash returned to Earth a changed boy. The adventure not only satisfied his curiosity but also taught him about bravery, friendship, and the importance of being open to new experiences. He realized that the universe was full of wonders, and he owed his extraordinary journey to his courage and intellectual curiosity. The moral of Ash's story is, 'Sometimes, you need to step out of your comfort zone to find what the universe has to offer.'",
					"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701781171.png"
				}
			]
		}
	]
}*/