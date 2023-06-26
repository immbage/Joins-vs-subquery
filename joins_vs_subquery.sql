CREATE DATABASE univ2;

CREATE TABLE mahasiswa (
	nama_mahasiswa VARCHAR (50),
    nilai_ujian INTEGER,
    kelas VARCHAR (1),
    gender VARCHAR (1)
);

INSERT INTO mahasiswa
VALUES
	('Amanda', 65, 'A', 'W'),
	('Ashari', 90, 'A', 'P'),
	('Nadia', 60, 'A', 'W'),
	('Andi', 40, 'B', 'P'),
	('Diana', 75, 'B', 'W'),
	('Nisa', 70, 'B', 'W'),
	('Aruman', 80, 'C', 'P'),
	('Gilang', 85, 'C', 'P'),
	('Reza', 90, 'C', 'P');

CREATE TABLE wali_kelas (
	nama_wali_keals VARCHAR (50),
    kelas VARCHAR (1)
);

INSERT INTO wali_kelas
VALUES
	('Sutarno', 'A'),
    ('Jonathan', 'B'),
    ('Vania', 'C'),
    ('Raissa', 'D');

-- Mahasiswa yang nilai nya diatas rata-rata (avg = 72)
SELECT nama_mahasiswa, nilai_ujian 
FROM mahasiswa
WHERE nilai_ujian > (SELECT AVG(nilai_ujian) from mahasiswa)
ORDER BY nilai_ujian desc;

-- Siapakah mahasiswa pak Jonathan yng mendapat nilai diatas 70?
SELECT nama_mahasiswa, nilai_ujian
FROM mahasiswa
WHERE kelas = (SELECT kelas FROM wali_kelas WHERE nama_wali_keals = 'Jonathan')
AND nilai_ujian > 70;

-- Siapakah mahasiswa pak Jonathan yng mendapat nilai diatas 70? (Use inner join)
SELECT nama_mahasiswa, nilai_ujian
FROM mahasiswa INNER JOIN wali_kelas
ON mahasiswa.kelas = wali_kelas.kelas
WHERE nilai_ujian > 70 AND nama_wali_keals = 'Jonathan';