class Laporan {
  final String name;
  final int bulan;
  final int tahun;
  final int hadir;
  final int tidakHadir;
  final int izin;
  final int sakit;
  final int cuti;
  final int tugas;
  final int izinTerlambat;
  final int izinPulangCepat;

  Laporan({
    required this.name,
    required this.bulan,
    required this.tahun,
    required this.hadir,
    required this.tidakHadir,
    required this.izin,
    required this.sakit,
    required this.cuti,
    required this.tugas,
    required this.izinTerlambat,
    required this.izinPulangCepat,
  });

  factory Laporan.fromJson(Map<String, dynamic> json) {
    return Laporan(
      name: json['name'],
      bulan: json['bulan'],
      tahun: json['tahun'],
      hadir: json['hadir'],
      tidakHadir: json['tidak_hadir'],
      izin: json['izin'],
      sakit: json['sakit'],
      cuti: json['cuti'],
      tugas: json['tugas'],
      izinTerlambat: json['izin_terlambat'],
      izinPulangCepat: json['izin_pulang_cepat'],
    );
  }
}
