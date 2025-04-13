import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_gdgoc/model/article_model.dart';
import 'package:tubes_gdgoc/ui/widget/article_item.dart';
import 'package:tubes_gdgoc/ui/widget/transaction_history.dart';
import 'package:tubes_gdgoc/ui/transaction/add_income.dart';
import 'package:tubes_gdgoc/ui/transaction/add_spending.dart';

import '../../widget/transaction_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<String> getUsername() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return userDoc['username'];
  }

  List<ArticleModel> article = [
    ArticleModel(
        1,
        "Dasar-dasar Manajemen Keuangan Pribadi",
        "Memahami konsep dasar pengelolaan uang untuk mencapai kestabilan finansial.",
        "02 Januari 2023",
        "Manajemen keuangan pribadi merupakan salah satu pilar utama menuju kestabilan dan kemandirian finansial. Artikel ini menguraikan konsep fundamental seperti pendapatan, pengeluaran, tabungan, dan investasi dalam konteks kehidupan sehari-hari. Pertama-tama, penting untuk mengevaluasi sumber pendapatan dan menetapkan anggaran yang realistis sesuai dengan kebutuhan serta tujuan finansial jangka panjang. Pembahasan mendalam mencakup cara mencatat setiap arus kas, mengelompokkan pengeluaran ke dalam kategori esensial dan non-esensial, serta mengevaluasi efektivitas alokasi dana melalui pencatatan berkala. Dengan menerapkan teknik-teknik pengelolaan seperti metode amplop atau aplikasi digital, setiap individu dapat menghindari pemborosan, memperbaiki disiplin keuangan, dan menyiapkan cadangan dana untuk keadaan darurat. Selain itu, artikel ini juga menekankan pentingnya memahami bunga majemuk dan dampaknya dalam investasi sehingga keputusan finansial dapat dibuat dengan informasi yang memadai."),
    ArticleModel(
        2,
        "Membuat Anggaran Bulanan yang Efektif",
        "Langkah-langkah praktis untuk mengatur pendapatan dan pengeluaran setiap bulan.",
        "04 Januari 2023",
        "Anggaran bulanan merupakan alat esensial dalam perencanaan keuangan. Artikel ini membahas secara detail cara menyusun anggaran yang efektif dengan pendekatan terpadu. Pertama, pembaca diarahkan untuk mengidentifikasi semua sumber pendapatan yang masuk, mulai dari gaji, bonus, dan pendapatan sampingan. Selanjutnya, metode pemetaan pengeluaran digunakan untuk mencatat biaya tetap seperti sewa, listrik, dan kebutuhan sehari-hari, serta biaya variabel yang mungkin berubah tiap bulan. Panduan langkah demi langkah disertai tips praktis untuk memotong pengeluaran yang tidak perlu, memprioritaskan kebutuhan pokok, serta menentukan persentase ideal antara tabungan dan belanja. Artikel ini juga menyentuh pentingnya evaluasi rutin atas anggaran yang dibuat dan penyesuaian terhadap perubahan kondisi keuangan, sehingga anggaran tersebut tetap relevan dan efektif untuk mencapai tujuan keuangan jangka panjang."),
    ArticleModel(
        3,
        "Cara Menabung untuk Investasi",
        "Strategi menabung yang tepat untuk memulai perjalanan investasi Anda.",
        "06 Januari 2023",
        "Menabung untuk investasi adalah langkah strategis yang memerlukan perencanaan matang dan disiplin tinggi. Artikel ini menawarkan wawasan mendalam mengenai berbagai strategi menabung, seperti otomatisasi transfer ke rekening tabungan khusus investasi, pengurangan pengeluaran harian, dan cara mengidentifikasi kebiasaan belanja yang tidak perlu. Selain itu, pembaca juga diajak memahami perbedaan antara menabung untuk dana darurat dan menabung untuk investasi jangka panjang. Penjelasan tentang konsep bunga majemuk dan bagaimana hal tersebut dapat mengoptimalkan pertumbuhan aset juga disajikan secara terperinci. Artikel ini dilengkapi dengan studi kasus dan contoh perhitungan yang dapat membantu para pembaca merancang rencana tabungan yang realistis serta memilih instrumen investasi yang sesuai dengan profil risiko mereka."),
    ArticleModel(
        4,
        "Strategi Investasi untuk Pemula",
        "Panduan lengkap investasi bagi mereka yang baru memulai perjalanan finansial.",
        "08 Januari 2023",
        "Investasi merupakan sarana penting dalam menumbuhkan kekayaan yang dapat dijadikan pondasi keuangan jangka panjang. Artikel ini secara mendalam membahas strategi investasi untuk pemula, dimulai dengan pengenalan berbagai jenis instrumen investasi seperti deposito, saham, obligasi, dan reksa dana. Di dalamnya, pembaca akan menemukan analisis tentang risiko dan imbal hasil masing-masing instrumen serta cara menyusun portofolio investasi yang terdiversifikasi. Penjelasan mengenai analisis fundamental dan teknikal, serta pentingnya memahami kondisi pasar ekonomi global, disajikan untuk memberikan gambaran yang holistik. Artikel ini juga memaparkan tips memilih platform investasi dan strategi untuk meminimalisir risiko, sehingga pemula dapat memasuki dunia investasi dengan keyakinan dan pengetahuan yang memadai."),
    ArticleModel(
        5,
        "Membangun Dana Darurat yang Kuat",
        "Mengapa dana darurat penting dan bagaimana cara membangunnya dengan efektif.",
        "10 Januari 2023",
        "Dana darurat berfungsi sebagai jaring pengaman keuangan ketika menghadapi situasi tidak terduga seperti kehilangan pendapatan, kebutuhan medis mendesak, atau krisis ekonomi. Artikel ini membahas secara rinci langkah-langkah untuk membangun dana darurat yang memadai, dimulai dari menentukan besaran dana yang diperlukan berdasarkan persentase pendapatan dan kebutuhan hidup bulanan. Pembaca juga diberikan strategi untuk menabung secara konsisten tanpa mengganggu alur keuangan harian, termasuk metode pembagian pendapatan antara biaya operasional dan tabungan. Disertai dengan contoh perhitungan dan simulasi kebutuhan dana darurat, artikel ini membantu pembaca memahami pentingnya menjaga kestabilan finansial dan betapa krusialnya peran dana darurat dalam menghindari utang yang memberatkan di masa sulit."),
    ArticleModel(
        6,
        "Mengurangi Pengeluaran Tidak Perlu",
        "Tips praktis untuk mengidentifikasi dan memangkas biaya yang tidak esensial.",
        "12 Januari 2023",
        "Mengurangi pengeluaran tidak perlu adalah salah satu cara efektif untuk meningkatkan kapasitas tabungan dan investasi. Artikel ini mengeksplorasi berbagai metode untuk meninjau dan mengoptimalkan pengeluaran harian, mulai dari melakukan audit pengeluaran rutin hingga menggunakan aplikasi perencanaan keuangan. Pembahasan meliputi analisis mendalam tentang kategori pengeluaran yang sering kali terabaikan, seperti langganan digital, biaya transportasi, dan kebiasaan makan di luar. Dilengkapi dengan tips negosiasi harga dan cara menemukan alternatif yang lebih ekonomis, artikel ini juga menyertakan studi kasus yang menggambarkan transformasi keuangan seseorang setelah mengurangi pengeluaran tidak esensial. Pembaca akan mendapatkan panduan praktis untuk menerapkan teknik penghematan secara berkelanjutan, guna memastikan tercapainya tujuan finansial jangka panjang."),
    ArticleModel(
        7,
        "Manajemen Utang dan Kartu Kredit",
        "Strategi untuk mengelola utang dan memanfaatkan kartu kredit secara bijak.",
        "14 Januari 2023",
        "Utang, jika tidak dikelola dengan benar, dapat menjadi beban besar yang mengganggu kestabilan keuangan. Artikel ini memberikan panduan komprehensif tentang bagaimana mengelola utang dengan bijak, terutama yang berkaitan dengan penggunaan kartu kredit. Pembahasan mencakup penentuan prioritas pembayaran utang, pengaturan jadwal pembayaran, dan strategi konsolidasi utang untuk mengurangi beban bunga yang tinggi. Artikel ini juga mengulas cara-cara untuk memanfaatkan fasilitas kartu kredit secara cerdas, seperti memanfaatkan program reward, menghindari biaya keterlambatan, dan memilih kartu dengan bunga rendah. Disertai dengan simulasi perhitungan bunga dan tips negosiasi dengan pihak bank, panduan ini bertujuan untuk membantu pembaca menyusun strategi pembayaran utang yang efisien dan mengoptimalkan penggunaan kredit untuk mendukung pertumbuhan finansial secara keseluruhan."),
    ArticleModel(
        8,
        "Menetapkan Tujuan Keuangan Jangka Panjang",
        "Cara menentukan target keuangan yang realistis untuk masa depan yang lebih aman.",
        "16 Januari 2023",
        "Menetapkan tujuan keuangan jangka panjang adalah langkah strategis yang membantu memandu setiap keputusan finansial. Artikel ini membahas berbagai aspek dalam menentukan target keuangan yang realistis dan terukur, seperti perencanaan pendidikan anak, pembelian rumah, dan persiapan pensiun. Pendekatan SMART (Specific, Measurable, Achievable, Relevant, Time-bound) digunakan untuk memastikan setiap tujuan memiliki kerangka waktu dan kriteria keberhasilan yang jelas. Pembaca diajak untuk melakukan analisis kebutuhan saat ini dan proyeksi kebutuhan di masa depan, serta mempelajari teknik diversifikasi investasi yang mendukung pencapaian target tersebut. Dengan pemaparan contoh kasus dan langkah-langkah terstruktur, artikel ini memberikan panduan lengkap agar setiap individu dapat merumuskan rencana keuangan yang kuat dan adaptif terhadap perubahan kondisi ekonomi."),
    ArticleModel(
        9,
        "Pentingnya Pendidikan Finansial",
        "Meningkatkan literasi keuangan untuk membuat keputusan yang lebih baik.",
        "18 Januari 2023",
        "Pendidikan finansial merupakan landasan utama untuk membuat keputusan keuangan yang cerdas dan terinformasi. Artikel ini menguraikan pentingnya meningkatkan literasi keuangan sejak dini melalui pemahaman tentang produk perbankan, investasi, dan asuransi. Pembahasan mendalam meliputi pemahaman tentang risiko dan imbal hasil, cara membaca laporan keuangan, serta teknik dasar dalam analisis pasar. Berbagai sumber belajar seperti seminar, buku, dan kursus online juga direkomendasikan sebagai upaya untuk mengembangkan pengetahuan finansial. Dengan peningkatan literasi keuangan, pembaca tidak hanya dapat menghindari kesalahan umum dalam mengelola uang, tetapi juga mampu merancang strategi keuangan yang tepat guna mencapai kebebasan finansial di masa depan."),
    ArticleModel(
        10,
        "Teknik Negosiasi Harga dan Diskon",
        "Cara pintar bernegosiasi untuk mendapatkan harga terbaik dalam berbagai transaksi.",
        "20 Januari 2023",
        "Negosiasi adalah seni yang dapat membantu Anda mengoptimalkan pengeluaran dan mendapatkan nilai terbaik dari setiap transaksi. Artikel ini menyajikan teknik-teknik negosiasi harga yang terbukti efektif, termasuk tips untuk mempersiapkan informasi produk, menentukan batas harga, dan mengenali momen yang tepat untuk meminta diskon. Pembahasan juga mencakup analisis psikologis dalam negosiasi, sehingga Anda dapat memahami taktik lawan bicara dan menggunakan strategi win-win. Dengan studi kasus dan contoh percakapan negosiasi, pembaca diajak untuk berlatih dan mengasah keterampilan bernegosiasi demi mencapai penghematan yang signifikan dalam belanja sehari-hari maupun transaksi besar."),
    ArticleModel(
        11,
        "Investasi Saham dan Reksa Dana",
        "Panduan memilih investasi saham dan reksa dana untuk menumbuhkan kekayaan.",
        "22 Januari 2023",
        "Investasi di pasar saham dan reksa dana merupakan salah satu cara paling dinamis untuk menumbuhkan kekayaan jangka panjang. Artikel ini membahas secara mendetail perbedaan antara saham dan reksa dana, proses analisis fundamental perusahaan, serta konsep analisis teknikal yang membantu menentukan waktu entry dan exit pasar. Pembaca juga diperkenalkan pada metode diversifikasi portofolio sebagai strategi untuk mengurangi risiko investasi. Dilengkapi dengan contoh perhitungan potensi keuntungan, simulasi pasar, dan tips pemilihan produk investasi, panduan ini dirancang agar para investor pemula dapat memilih instrumen investasi yang sesuai dengan profil risiko dan tujuan finansial mereka."),
    ArticleModel(
        12,
        "Perencanaan Pensiun Sejak Dini",
        "Mengapa memulai rencana pensiun sejak dini sangat penting untuk keamanan masa depan.",
        "24 Januari 2023",
        "Perencanaan pensiun yang matang adalah investasi terbaik untuk masa depan, karena persiapan yang dilakukan sejak dini akan membantu mengatasi risiko penurunan pendapatan di hari tua. Artikel ini menguraikan langkah-langkah strategis dalam merencanakan pensiun, mulai dari menentukan kebutuhan keuangan pasca-kerja, memilih instrumen investasi untuk dana pensiun, hingga manfaat bunga majemuk yang bekerja seiring waktu. Penjelasan mendalam mengenai perbandingan antara program pensiun dari perusahaan, asuransi pensiun, dan investasi pribadi disajikan dengan studi kasus nyata. Dengan panduan lengkap ini, pembaca diharapkan dapat menyusun rencana keuangan yang adaptif, memastikan kenyamanan finansial dan kualitas hidup yang baik di masa pensiun."),
    ArticleModel(
        13,
        "Mengelola Risiko Finansial",
        "Identifikasi dan penanganan risiko dalam perencanaan keuangan pribadi.",
        "26 Januari 2023",
        "Dalam dunia keuangan, setiap keputusan membawa risiko yang harus dikelola dengan cermat. Artikel ini menguraikan berbagai jenis risiko finansial, mulai dari risiko pasar, risiko likuiditas, hingga risiko kredit. Pembahasan mendalam mencakup teknik identifikasi risiko, evaluasi dampak, dan penerapan strategi mitigasi melalui diversifikasi portofolio, penggunaan asuransi, serta pembentukan dana cadangan. Disertai dengan contoh nyata, artikel ini memberikan wawasan bagaimana risiko dapat diukur dengan alat seperti Value at Risk (VaR) dan bagaimana manajemen risiko dapat membantu mengurangi potensi kerugian yang tidak diinginkan."),
    ArticleModel(
        14,
        "Tip Mengatur Keuangan Keluarga",
        "Strategi pengelolaan keuangan yang efektif untuk seluruh anggota keluarga.",
        "28 Januari 2023",
        "Keuangan keluarga yang sehat adalah kunci untuk membangun kesejahteraan secara kolektif. Artikel ini memaparkan strategi-strategi praktis dalam mengatur keuangan keluarga, dimulai dengan penyusunan anggaran bersama yang melibatkan seluruh anggota keluarga. Pembahasan mencakup pembagian tanggung jawab keuangan, cara mengelola pengeluaran rumah tangga, hingga pentingnya komunikasi terbuka mengenai tujuan finansial keluarga. Teknik pengaturan seperti pertemuan keuangan rutin, pencatatan pengeluaran bersama, dan penggunaan aplikasi keluarga untuk memonitor belanja juga diulas secara mendalam. Dengan pendekatan yang sistematis dan partisipatif, artikel ini mengajak pembaca untuk menciptakan budaya keuangan yang sehat, sehingga setiap keputusan finansial mendukung stabilitas dan pertumbuhan kesejahteraan keluarga secara keseluruhan."),
    ArticleModel(
        15,
        "Mengoptimalkan Penghasilan Pasif",
        "Cara menciptakan aliran pendapatan tambahan tanpa harus bekerja ekstra.",
        "30 Januari 2023",
        "Penghasilan pasif dapat menjadi sumber keuangan tambahan yang signifikan jika dikelola dengan tepat. Artikel ini mengulas beragam metode untuk menciptakan penghasilan pasif, mulai dari investasi properti, dividen saham, hingga pengembangan bisnis online dan penjualan produk digital. Pembahasan mencakup strategi diversifikasi sumber pendapatan, analisis risiko dan potensi pengembalian, serta pentingnya konsistensi dalam mengelola aset-aset yang menghasilkan pendapatan secara otomatis. Dilengkapi dengan studi kasus dan perhitungan estimasi imbal hasil, artikel ini memberikan panduan lengkap bagi pembaca yang ingin mengurangi ketergantungan pada pendapatan aktif dan mencapai kebebasan finansial jangka panjang melalui optimalisasi berbagai peluang penghasilan pasif."),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    width < 600 ? 30.0 : 32.0, // left
                    35.0, // top
                    width < 600 ? 30.0 : 32.0, // right
                    0.0, // bottom
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<String>(
                        future: getUsername(),
                        builder: (context, snapshot) {
                          return Text(
                            'Hai, ${snapshot.data}',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500, fontSize: 30),
                          );
                        },
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Pendapatan dan Pengeluaran kamu bulan ini",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TransactionItem(),
                            TransactionItem(isPemasukan: false),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      _headerTransaksi(),
                      SizedBox(height: 20),
                      TransactionHistory(isHome: true),
                      SizedBox(height: 20),
                      _headerArtikel(),
                      ListView.builder(
                        padding: EdgeInsets.only(top: 20),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: article.length,
                        itemBuilder: (context, index) {
                          return ArticleItem(
                              id: article[index].id,
                              judul: article[index].judul,
                              subjudul: article[index].subjudul,
                              tanggalPosting: article[index].tanggalPosting,
                              isiArtikel: article[index].isiArtikel);
                        },
                      )
                    ],
                  )),
            )));
  }

  Widget _headerTransaksi() {
    return Row(
      children: [
        Image.asset('assets/icons/transaction_history.png',
            color: Color(0xFF3C7E53), width: 25, height: 25),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Transaksi",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 12)),
            Text("Transaksi anda selama ini",
                style: GoogleFonts.inter(fontSize: 12)),
          ],
        ),
      ],
    );
  }

  Widget _headerArtikel() {
    return Row(
      children: [
        Image.asset('assets/icons/article.png',
            color: Color(0xFF3C7E53), width: 25, height: 25),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Artikel",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 12)),
            Text("Artikel seputar ekonomi saat ini",
                style: GoogleFonts.inter(fontSize: 12)),
          ],
        ),
      ],
    );
  }

}
