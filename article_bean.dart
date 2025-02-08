import 'dart:convert';

import 'material_bean.dart';
import 'model_bean.dart';

import 'article_comment_bean.dart';
import 'author_bean.dart';
import 'image_media_bean.dart';

enum ArticleTypeEnum { STANDARD, LINKCARD, STAR }

enum ArticleStatusTypeEnum { DELETE, PUBLIC, RECYCLE, DRAFTS }

class ArticleBean {
  int? id; //文章的id
  String? title;
  String? summary;
  String? source_author; //转自哪里
  String? url; //链接卡片的链接
  bool? is_block_by_shizhan;
  bool? is_shizhan_recommend;
  bool? is_likeing;
  bool? is_hateing;
  bool? is_collecting;
  int? likers_count;
  int? haters_count;
  int? collecters_count;
  int? comments_count;
  String? timestamp;
  int? views_num;
  int? type;
  int? status;
  bool? is_recommend_myspace;
  bool? is_can_recommend_myspace;
  AuthorBean? author;
  String? content;
  ArticleImageCardBean? first_image_card;
  MediaBean? cover_image_media;
  List<ArticleCommentBean>? selected_comments;
  List<ArticleBean>? star_hot_linkcards;
  bool? is_top;
  bool? is_important;
  ModelBean? article_product;
  MaterialBean? silhouette_material;

  ArticleBean(
      {this.id,
      this.title,
      this.summary,
      this.source_author,
      this.url,
      this.is_block_by_shizhan,
      this.is_shizhan_recommend,
      this.is_likeing,
      this.is_hateing,
      this.is_collecting,
      this.likers_count,
      this.haters_count,
      this.collecters_count,
      this.comments_count,
      this.timestamp,
      this.views_num,
      this.type,
      this.status,
      this.is_can_recommend_myspace,
      this.is_recommend_myspace,
      this.author,
      this.content,
      this.first_image_card,
      this.cover_image_media,
      this.selected_comments,
      this.star_hot_linkcards,
      this.is_top,
      this.is_important,
      this.article_product,
      this.silhouette_material});

  static List<ArticleBean> allFromResponse(String response) {
    var decodedJson = json.decode(response).cast<String, dynamic>();
    return decodedJson['']
        .cast<Map<String, dynamic>>((obj) => ArticleBean.fromMap(obj))
        .toList()
        .cast<ArticleBean>();
  }

  static ArticleBean fromMap(Map<String, dynamic> map) {
    ArticleBean articleBean = ArticleBean();
    articleBean.id = map['id'];
    articleBean.title = map['title'];
    articleBean.summary = map['summary'];
    articleBean.source_author = map['source_author'];
    articleBean.url = map['url'];
    articleBean.is_block_by_shizhan = map['is_block_by_shizhan'];
    articleBean.is_shizhan_recommend = map['is_shizhan_recommend'];
    articleBean.is_likeing = map['is_likeing'];
    articleBean.is_hateing = map['is_hateing'];
    articleBean.is_collecting = map['is_collecting'];
    articleBean.likers_count = map['likers_count'];
    articleBean.haters_count = map['haters_count'];
    articleBean.collecters_count = map['collecters_count'];
    articleBean.comments_count = map['comments_count'];
    articleBean.timestamp = map['timestamp'];
    articleBean.views_num = map['views_num'];
    articleBean.type = map['type'];
    articleBean.status = map['status'];
    articleBean.is_can_recommend_myspace = map['is_can_recommend_myspace'];
    articleBean.is_recommend_myspace = map['is_recommend_myspace'];
    articleBean.content = map['content'];

    if (map['article_product'] != null) {
      articleBean.article_product = ModelBean.fromMap(map['article_product']);
    }

    if (map['silhouette_material'] != null) {
      articleBean.silhouette_material =
          MaterialBean.fromMap(map['silhouette_material']);
    }

    if (map['first_image_card'] is String) {
      if (map['first_image_card'] != '') {
        var firstImageCard = jsonDecode(map['first_image_card']);
        articleBean.first_image_card =
            ArticleImageCardBean.fromMap(firstImageCard);
      }
    }

    if (map['author'] is String) {
      var author = jsonDecode(map['author']);
      articleBean.author = AuthorBean.fromMap(author);
    } else {
      if (map['author'] != null) {
        articleBean.author = AuthorBean.fromMap(map['author']);
      }
    }
    if (map.containsKey('cover_image_media')) {
      if (map['cover_image_media'] != null) {
        articleBean.cover_image_media =
            MediaBean.fromMap(map['cover_image_media']);
      }
    }
    if (map.containsKey('selected_comments')) {
      if (map['selected_comments'] != null) {
        articleBean.selected_comments =
            ArticleCommentBean.fromMapList(map['selected_comments']);
      }
    }
    if (map.containsKey('star_hot_linkcards')) {
      if (map['star_hot_linkcards'] != null) {
        articleBean.star_hot_linkcards =
            ArticleBean.fromMapList(map['star_hot_linkcards']);
      }
    }
    if (map.containsKey('is_top')) {
      if (map['is_top'] != null) {
        articleBean.is_top = map['is_top'];
      }
    }
    if (map.containsKey('is_important')) {
      if (map['is_important'] != null) {
        articleBean.is_important = map['is_important'];
      }
    }
    return articleBean;
  }

  static List<ArticleBean> fromMapList(dynamic mapList) {
    List<ArticleBean> list = List.filled(mapList.length, ArticleBean());
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'source_author': source_author,
      'url': url,
      'is_block_by_shizhan': is_block_by_shizhan,
      'is_shizhan_recommend': is_shizhan_recommend, //卡片上的图片
      'is_likeing': is_likeing,
      'is_hateing': is_hateing,
      'is_collecting': is_collecting,
      'likers_count': likers_count,
      'haters_count': haters_count,
      'collecters_count': collecters_count,
      'comments_count': comments_count,
      'timestamp': timestamp,
      'views_num': views_num,
      'type': type,
      'status': type,
      'is_can_recommend_myspace': is_can_recommend_myspace,
      'is_recommend_myspace': is_recommend_myspace,
      'content': content,
      'first_image_card': jsonEncode(first_image_card!.toMap()),
      'author': jsonEncode(author!.toMap()),
      // 'detail_list': jsonEncode(List.generate(detailList.length, (index) {
      //   return detailList[index].toMap();
      // })),
      //***************************************
    };
  }
}

class ArticleImageCardBean {
  String type;
  String title;
  String summary;
  List<MediaBean>? imageList = [];
  ArticleImageCardBean({
    this.type = "girdImage", //staceImage
    this.title = "",
    this.summary = "",
    this.imageList,
  });
  static ArticleImageCardBean fromMap(Map<String, dynamic> map) {
    ArticleImageCardBean photoCardBean = ArticleImageCardBean();
    photoCardBean.type = map['type'];
    photoCardBean.title = map['title'];
    photoCardBean.summary = map['summary'];
    if (map['imageList'] is String) {
      var imageList = jsonDecode(map['imageList']);
      photoCardBean.imageList = MediaBean.fromMapList(imageList);
    } else {
      photoCardBean.imageList = MediaBean.fromMapList(map['imageList']);
    }
    return photoCardBean;
  }

  static List<ArticleImageCardBean> fromMapList(dynamic mapList) {
    List<ArticleImageCardBean> list =
        List.filled(mapList.length, ArticleImageCardBean());
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

  @override
  String toString() {
    return '{"type":"$type", "title":"$title", "summary":"$summary", "imageList":$imageList}';
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'title': title,
      'summary': summary,
      'imageList': jsonEncode(List.generate(imageList!.length, (index) {
        return imageList![index].toMap();
      })),
    };
  }
}
