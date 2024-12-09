-- Membuat database jika belum ada
CREATE DATABASE IF NOT EXISTS `perpus_sederhana_nasywasuci`;

-- Memilih database yang akan digunakan
USE `perpus_sederhana_nasywasuci`;

-- Membuat tabel anggota
CREATE TABLE IF NOT EXISTS `anggota` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuat tabel buku
CREATE TABLE IF NOT EXISTS `buku` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuat tabel kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(50) NOT NULL,
  `deskripsi` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuat tabel peminjaman
CREATE TABLE IF NOT EXISTS `peminjaman` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date,
  `status_pinjam` varchar(20) NOT NULL,
  PRIMARY KEY (`loan_id`),
  FOREIGN KEY (`member_id`) REFERENCES `anggota`(`member_id`) ON DELETE CASCADE,
  FOREIGN KEY (`book_id`) REFERENCES `buku`(`book_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuat tabel petugas
CREATE TABLE IF NOT EXISTS `petugas` (
  `librarian_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `telepon` varchar(15),
  `email` varchar(100),
  `shift_kerja` varchar(20),
  PRIMARY KEY (`librarian_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuat tabel reservasi
CREATE TABLE IF NOT EXISTS `reservasi` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `tgl_reservasi` date NOT NULL,
  `status_reservasi` varchar(20) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  FOREIGN KEY (`member_id`) REFERENCES `anggota`(`member_id`) ON DELETE CASCADE,
  FOREIGN KEY (`book_id`) REFERENCES `buku`(`book_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
