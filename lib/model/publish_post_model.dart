// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PublishPostModel {


        final int? id;
        final String? image_url;
        final String? title;
        final String? slug;
        final int? author;
        final String? category;
        final String? content;
        final String? status;
  PublishPostModel({
    this.id,
    this.image_url,
    this.title,
    this.slug,
    this.author,
    this.category,
    this.content,
    this.status,
  });



  PublishPostModel copyWith({
    int? id,
    String? image_url,
    String? title,
    String? slug,
    int? author,
    String? category,
    String? content,
    String? status,
  }) {
    return PublishPostModel(
      id: id ?? this.id,
      image_url: image_url ?? this.image_url,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      author: author ?? this.author,
      category: category ?? this.category,
      content: content ?? this.content,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image_url': image_url,
      'title': title,
      'slug': slug,
      'author': author,
      'category': category,
      'content': content,
      'status': status,
    };
  }

  factory PublishPostModel.fromMap(Map<String, dynamic> map) {
    return PublishPostModel(
      id: map['id'] != null ? map['id'] as int : null,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      author: map['author'] != null ? map['author'] as int : null,
      category: map['category'] != null ? map['category'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublishPostModel.fromJson(String source) => PublishPostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PublishPostModel(id: $id, image_url: $image_url, title: $title, slug: $slug, author: $author, category: $category, content: $content, status: $status)';
  }

  @override
  bool operator ==(covariant PublishPostModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.image_url == image_url &&
      other.title == title &&
      other.slug == slug &&
      other.author == author &&
      other.category == category &&
      other.content == content &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      image_url.hashCode ^
      title.hashCode ^
      slug.hashCode ^
      author.hashCode ^
      category.hashCode ^
      content.hashCode ^
      status.hashCode;
  }
}
