class StoryDetailModel {
  StoryDetailModel({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  StoryDetailModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) {
    return StoryDetailModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  factory StoryDetailModel.fromJson(Map<String, dynamic> json){
    return StoryDetailModel(
      status: json["status"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };

  @override
  String toString(){
    return "$status, $message, $data, ";
  }

}

class Data {
  Data({
    required this.id,
    required this.uuid,
    required this.title,
    required this.age,
    required this.genreId,
    required this.storyImage,
    required this.storyDescription,
    required this.storyImageUrl,
    required this.storyTitle,
    required this.storyChapter,
  });

  final int id;
  final String uuid;
  final String title;
  final int age;
  final int genreId;
  final String storyImage;
  final String storyDescription;
  final String storyImageUrl;
  final String storyTitle;
  final List<StoryChapter> storyChapter;

  Data copyWith({
    int? id,
    String? uuid,
    String? title,
    int? age,
    int? genreId,
    String? storyImage,
    String? storyDescription,
    String? storyImageUrl,
    String? storyTitle,
    List<StoryChapter>? storyChapter,
  }) {
    return Data(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      age: age ?? this.age,
      genreId: genreId ?? this.genreId,
      storyImage: storyImage ?? this.storyImage,
      storyDescription: storyDescription ?? this.storyDescription,
      storyImageUrl: storyImageUrl ?? this.storyImageUrl,
      storyTitle: storyTitle ?? this.storyTitle,
      storyChapter: storyChapter ?? this.storyChapter,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"] ?? 0,
      uuid: json["uuid"] ?? "",
      title: json["title"] ?? "",
      age: json["age"] ?? 0,
      genreId: json["genre_id"] ?? 0,
      storyImage: json["story_image"] ?? "",
      storyDescription: json["story_description"] ?? "",
      storyImageUrl: json["story_image_url"] ?? "",
      storyTitle: json["story_title"] ?? "",
      storyChapter: json["story_chapter"] == null ? [] : List<StoryChapter>.from(json["story_chapter"]!.map((x) => StoryChapter.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "title": title,
    "age": age,
    "genre_id": genreId,
    "story_image": storyImage,
    "story_description": storyDescription,
    "story_image_url": storyImageUrl,
    "story_title": storyTitle,
    "story_chapter": storyChapter.map((x) => x.toJson()).toList(),
  };

  @override
  String toString(){
    return "$id, $uuid, $title, $age, $genreId, $storyImage, $storyDescription, $storyImageUrl, $storyTitle, $storyChapter, ";
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
    required this.audioUrl,
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
  final String audioUrl;
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
    String? audioUrl,
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
      audioUrl: audioUrl ?? this.audioUrl,
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
      audioUrl: json["audio_url"] ?? "",
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
    "audio_url": audioUrl,
    "story_title": storyTitle,
    "story_description": storyDescription,
    "image_url": imageUrl,
  };

  @override
  String toString(){
    return "$id, $storyId, $title, $description, $chapterNo, $imagePrompt, $image, $createdAt, $updatedAt, $deletedAt, $audioUrl, $storyTitle, $storyDescription, $imageUrl, ";
  }

}

/*
{
	"status": true,
	"message": "Get story detail",
	"data": {
		"id": 1,
		"uuid": "6209b00c-088d-4c1a-90b3-6eab2ac91cf1",
		"title": "Escape from Mr. Lemoncello’s Library",
		"age": 8,
		"genre_id": 1,
		"story_image": "image_1701523474.png",
		"story_description": "As DummyGirl entered the magnificent library, she was awestruck by the towering shelves filled with thousands of books, revolving bookcases, and secret passages. The library was nothing like she had ever seen before. Mr. Lemoncello greeted her with a wide grin and introduced her to the other participants. The adventure was about to begin.",
		"story_image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701523474.png",
		"story_title": "Escape from Mr. Lemoncello’s Library",
		"story_chapter": [
			{
				"id": 1,
				"story_id": 1,
				"title": "The Mysterious Invitation",
				"description": "Once upon a time, there was an enthusiastic and curious girl named DummyGirl. One day, she received a puzzle-like invitation for an overnight adventure in the town's new library. The library was owned by the eccentric and legendary gamemaker, Mr. Lemoncello. With sparkling eyes and a racing heart, DummyGirl accepted the invitation, intrigued by the excitement and mystery that lay ahead.",
				"chapter_no": 1,
				"image_prompt": "A girl holding a mysterious, puzzle-like invitation near a beautifully crafted wooden library.",
				"image": "image_1701523474.png",
				"created_at": "2023-12-02T13:24:34.000000Z",
				"updated_at": "2023-12-02T13:24:34.000000Z",
				"deleted_at": null,
				"audio_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/audio/8535316fc692e687d102efc24a3bea9a.mp3",
				"story_title": "The Mysterious Invitation",
				"story_description": "Once upon a time, there was an enthusiastic and curious girl named Anaya. One day, she received a puzzle-like invitation for an overnight adventure in the town's new library. The library was owned by the eccentric and legendary gamemaker, Mr. Lemoncello. With sparkling eyes and a racing heart, Anaya accepted the invitation, intrigued by the excitement and mystery that lay ahead.",
				"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701523474.png"
			},
			{
				"id": 2,
				"story_id": 1,
				"title": "The Grand Library",
				"description": "As DummyGirl entered the magnificent library, she was awestruck by the towering shelves filled with thousands of books, revolving bookcases, and secret passages. The library was nothing like she had ever seen before. Mr. Lemoncello greeted her with a wide grin and introduced her to the other participants. The adventure was about to begin.",
				"chapter_no": 2,
				"image_prompt": "An immense library with towering shelves and secret passages filled with a variety of books.",
				"image": "image_1701523474.png",
				"created_at": "2023-12-02T13:24:34.000000Z",
				"updated_at": "2023-12-02T13:24:34.000000Z",
				"deleted_at": null,
				"audio_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/audio/51d2c844f9a8fcfc2a89872fcc11000c.mp3",
				"story_title": "The Grand Library",
				"story_description": "As Anaya entered the magnificent library, she was awestruck by the towering shelves filled with thousands of books, revolving bookcases, and secret passages. The library was nothing like she had ever seen before. Mr. Lemoncello greeted her with a wide grin and introduced her to the other participants. The adventure was about to begin.",
				"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701523474.png"
			},
			{
				"id": 3,
				"story_id": 1,
				"title": "The Great Library Escape",
				"description": "Just as everything seemed calm, Mr. Lemoncello announced the real challenge. The doors of the library were locked, and the only way out was to solve a series of riddles and clues hidden in the books around the library. With a determined spirit, DummyGirl started to unravel the mysterious riddles, one at a time.",
				"chapter_no": 3,
				"image_prompt": "A girl engrossed in reading books and solving riddles.",
				"image": "image_1701523474.png",
				"created_at": "2023-12-02T13:24:34.000000Z",
				"updated_at": "2023-12-02T13:24:34.000000Z",
				"deleted_at": null,
				"audio_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/audio/52cfee5eabbc6f26a879c27203441d64.mp3",
				"story_title": "The Great Library Escape",
				"story_description": "Just as everything seemed calm, Mr. Lemoncello announced the real challenge. The doors of the library were locked, and the only way out was to solve a series of riddles and clues hidden in the books around the library. With a determined spirit, Anaya started to unravel the mysterious riddles, one at a time.",
				"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701523474.png"
			},
			{
				"id": 4,
				"story_id": 1,
				"title": "The Final Clue",
				"description": "As she solved each riddle, DummyGirl delved deeper into the magical world of books, each holding a unique clue. The final clue led her to the topmost shelf, holding a dusty book. Like a brave adventurer, she reached for it, and with that, a key fell out from the book! It was the key to the front door! Triumphantly, DummyGirl held the key up in the air.",
				"chapter_no": 4,
				"image_prompt": "A girl holding a dusty book from which falls a key.",
				"image": "image_1701523474.png",
				"created_at": "2023-12-02T13:24:34.000000Z",
				"updated_at": "2023-12-02T13:24:34.000000Z",
				"deleted_at": null,
				"audio_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/audio/e72414c63a374533f37d7143b9e72724.mp3",
				"story_title": "The Final Clue",
				"story_description": "As she solved each riddle, Anaya delved deeper into the magical world of books, each holding a unique clue. The final clue led her to the topmost shelf, holding a dusty book. Like a brave adventurer, she reached for it, and with that, a key fell out from the book! It was the key to the front door! Triumphantly, Anaya held the key up in the air.",
				"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701523474.png"
			},
			{
				"id": 5,
				"story_id": 1,
				"title": "The Grand Escape and The Lesson",
				"description": "With the key in her hand, DummyGirl unlocked the front door. Everyone cheered and applauded. She had solved Mr. Lemoncello’s grand library escape game! However, the true reward was the incredible journey she embarked on through the world of books, learning that knowledge unlocks doors and every book holds a story waiting to be discovered. This adventure taught DummyGirl the joy of reading and the power of perseverance.",
				"chapter_no": 5,
				"image_prompt": "A smiling girl standing at the open door of the library.",
				"image": "image_1701523515.png",
				"created_at": "2023-12-02T13:24:34.000000Z",
				"updated_at": "2023-12-02T13:25:15.000000Z",
				"deleted_at": null,
				"audio_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/audio/1c495a1facade0a0067f3775f4769091.mp3",
				"story_title": "The Grand Escape and The Lesson",
				"story_description": "With the key in her hand, Anaya unlocked the front door. Everyone cheered and applauded. She had solved Mr. Lemoncello’s grand library escape game! However, the true reward was the incredible journey she embarked on through the world of books, learning that knowledge unlocks doors and every book holds a story waiting to be discovered. This adventure taught Anaya the joy of reading and the power of perseverance.",
				"image_url": "https://kidsstory.laraveldevelopmentcompany.com/public/storage/user/chapters/image_1701523515.png"
			}
		]
	}
}*/