import 'package:flutter/material.dart';

import '../model/article_model.dart';

class ListData {
  static List<DropdownMenuItem<String>> dropdownIncome = [
    DropdownMenuItem(value: "Gaji", child: Text("Gaji")),
    DropdownMenuItem(value: "Bonus", child: Text("Bonus")),
    DropdownMenuItem(value: "Hasil Investasi", child: Text("Hasil Investasi")),
    DropdownMenuItem(value: "Lainya", child: Text("Lainya")),
  ];

  static List<DropdownMenuItem<String>> dropdownSpending = [
    DropdownMenuItem(value: "Belanja", child: Text("Belanja")),
    DropdownMenuItem(value: "Bensin", child: Text("Bensin")),
    DropdownMenuItem(value: "Asuransi", child: Text("Asuransi")),
    DropdownMenuItem(value: "Edukasi", child: Text("Edukasi")),
    DropdownMenuItem(value: "Investasi", child: Text("Investasi")),
    DropdownMenuItem(value: "Kesehatan", child: Text("Kesehatan")),
    DropdownMenuItem(value: "Lainya", child: Text("Lainya")),
  ];

  static List<ArticleModel> article = [
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
  ];
}
