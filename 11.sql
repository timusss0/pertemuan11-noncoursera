
praktikum halaman 26 - 52

Membuat Stored Procedure untuk Menampilkan Data Mahasiswa Berdasarkan Ketua Jurusan
DELIMITER //

CREATE PROCEDURE TampilMahasiswaBerdasarkanKetua(jurusanKetua VARCHAR(255))
BEGIN
    SELECT m.id_mahasiswa, m.nama_mahasiswa, j.nama_jurusan, j.ketua_jurusan
    FROM mahasiswa m
    JOIN jurusan j ON m.id_jurusan = j.id_jurusan
    WHERE j.ketua_jurusan = jurusanKetua;
END //

DELIMITER ;

CALL TampilMahasiswaBerdasarkanKetua('Nama Ketua Jurusan');


 Membuat Stored Procedure untuk Mencari Nama Ketua Jurusan dengan Nama Tertentu
 DELIMITER //

CREATE PROCEDURE CariKetuaJurusan(namaJurusan VARCHAR(255))
BEGIN
    SELECT nama_jurusan, ketua_jurusan
    FROM jurusan
    WHERE nama_jurusan = namaJurusan;
END //

DELIMITER ;
CALL CariKetuaJurusan('Nama Jurusan');


Membuat Trigger pada Basis Data "Mahasiswa"
DELIMITER //

CREATE TRIGGER after_insert_mahasiswa
AFTER INSERT ON mahasiswa
FOR EACH ROW
BEGIN
    UPDATE jurusan
    SET jumlah_mahasiswa = jumlah_mahasiswa + 1
    WHERE id_jurusan = NEW.id_jurusan;
END //

DELIMITER ;


Menciptakan Tabel jurusan
CREATE TABLE jurusan (
    kd_jurusan INT,
    nama_jurusan VARCHAR(20),
    PRIMARY KEY (kd_jurusan)
);

 Menghapus Tabel jurusan
 DROP TABLE jurusan;
 
 Menambahkan Data ke Tabel jurusan
 INSERT INTO jurusan (kd_jurusan, nama_jurusan)
VALUES (1, 'Teknik Elektro');

Memodifikasi Data dalam Tabel jurusan
UPDATE jurusan
SET nama_jurusan = 'Teknik Informatika'
WHERE kd_jurusan = 1;


Query untuk Seleksi Data
SELECT * FROM matakuliah
WHERE sks = 2 AND semester = 3;

Data dengan sks <= 2
SELECT * FROM matakuliah
WHERE sks <= 2;

Data dengan nama_mk diawali dengan kata "Sistem"
SELECT * FROM matakuliah
WHERE nama_mk LIKE 'Sistem%';

 Mendapatkan kode_mk, nama_mk, sks, dan semester dengan matakuliah yang berakhiran "Data":
 SELECT kode_mk, nama_mk, sks, semester
FROM matakuliah
WHERE nama_mk LIKE '%Data';

Mendapatkan kode_mk, nama_mk, sks, dan semester dengan nama matakuliah yang mengandung kata "Basis":
SELECT kode_mk, nama_mk, sks, semester
FROM matakuliah
WHERE nama_mk LIKE '%Basis%';


Membuat tabel mahasiswa_min
CREATE TABLE mahasiswa_min (
    nim VARCHAR(15) PRIMARY KEY,
    nama VARCHAR(50),
    jenis_kelamin VARCHAR(10),
    tempat_lahir VARCHAR(50),
    tanggal_lahir DATE,
    alamat VARCHAR(100)
);

Memasukkan data ke dalam tabel mahasiswa_min:
INSERT INTO mahasiswa_min (nim, nama, jenis_kelamin, tempat_lahir, tanggal_lahir, alamat)
VALUES
('140533601613', 'Cintya', 'Perempuan', 'Batu', '1998-09-07', 'Jalan Apel'),
('14053360644', 'Lugas', 'Laki-Laki', 'Batu', '1995-05-19', 'Jalan Mangga'),
('160533608100', 'Dera', 'Laki-Laki', 'Surabaya', '1997-05-17', 'Jalan Melon'),
('160533608101', 'Budi', 'Laki-Laki', 'Medan', '1998-10-29', 'Jalan Apel'),
('160533608135', 'Fahmi', 'Laki-Laki', 'Jombang', '1996-09-11', 'Jalan Sirsat'),
('160533608158', 'Dona', 'Perempuan', 'Bandung', '1998-05-16', 'Jalan Jeruk'),
('160533608189', 'Erni', 'Perempuan', 'Bandung', '1998-10-20', 'Jalan Anggur'),
('160533608203', 'Dewi', 'Perempuan', 'Jogjakarta', '1998-04-18', 'Jalan Markisa');


 Mendapatkan data mahasiswa berdasarkan kode tahun angkatan = 16
 SELECT *
FROM mahasiswa_min
WHERE nim LIKE '16%'
ORDER BY nama ASC;

Mendapatkan kode_mk, nama_mk, sks, dan semester dengan matakuliah yang berakhiran "Data":
SELECT kode_mk, nama_mk, sks, semester
FROM matakuliah
WHERE nama_mk LIKE '%Data';

Mendapatkan kode_mk, nama_mk, sks, dan semester dengan nama matakuliah yang mengandung kata "Basis":
SELECT kode_mk, nama_mk, sks, semester
FROM matakuliah
WHERE nama_mk LIKE '%Basis%';





