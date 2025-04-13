class ArticleModel {
  int id;
  String judul;
  String subjudul;
  String tanggalPosting;
  String isiArtikel;

  ArticleModel(
      this.id, this.judul, this.subjudul, this.tanggalPosting, this.isiArtikel);

  int get getId {
    return id;
  }

  String get getJudul {
    return judul;
  }

  String get getSubjudul {
    return subjudul;
  }

  String get getTanggalPosting {
    return tanggalPosting;
  }

  String get getIsiArtikel {
    return isiArtikel;
  }
}
