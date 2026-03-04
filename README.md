# wb-inews
V6.0 news
Job Wartawan v6.1
By & Bae

Deskripsi Singkat:
- Menu F6 untuk akses semua fitur
- NUI koran digital & editor berita (publish headline + deskripsi)
- Live streaming simulasi (overlay "LIVE", bonus viewers, broadcast server-wide)
- Patrol visible di map + blip activity kriminal netral
- Drone, heli, paparazzi mode, live cam, studio di van
- Expose aktivitas kriminal (netral, tidak menyebut nama gang tertentu)
- Reward scaling berdasarkan jumlah player online (cocok peak 2k+)

Script ini lightweight (event-based, no loop berat), (cooldown server-side, cleanup otomatis), (pure natives FiveM + optional ox_lib).

Cara Instalasi (5 menit):
1. Masukkan folder "wb-inews" ke dalam resources server.
2. Tambahkan baris ini di server.cfg (setelah framework seperti ESX/QB dan ox_lib kalau pakai):
   ensure wb-inews
3. Restart server atau jalankan command: refresh lalu restart wb-inews
4. Berikan job reporter ke player test: /setjob [id] reporter 0 (atau sesuai framework)

Cara Menggunakan (untuk Reporter / Wartawan):
1. Masuk ke server sebagai reporter (job reporter/wartawan).
2. Ketik /news atau tekan F6 → muncul menu native HUD (kotak hitam dengan opsi).
   - Pilih nomor untuk spawn van/heli/drone, patrol, go live, edit berita, dll.
   - Off Duty: Pilih "Off Duty" untuk matikan semua fitur.
3. Command penting:
   - /news          → Buka menu F6
   - /newspaper     → Buka koran digital NUI (semua player bisa baca berita yang sudah dipublish)
   - /golive        → Shortcut toggle live streaming (opsional, bisa dari menu)
4. Fitur utama & contoh pakai:
   - Spawn News Van/Heli/Drone: Dekat HQ (Weazel News), lalu gunakan untuk liputan.
   - Patrol Surface: Aktifkan → blip reporter gerak di map semua player + scan activity kriminal otomatis.
   - Go Live: Aktifkan → overlay "LIVE" muncul, broadcast server-wide, bonus $ tiap menit kalau ada viewer dekat.
   - Edit & Publish Berita: Pilih di menu → NUI muncul → isi judul + deskripsi → publish → muncul di koran semua player.
   - Expose Kriminal: Saat patrol atau foto scoop → broadcast netral "Aktivitas Kriminal Tertangkap!" + particle efek.
   - Paparazzi / Live Cam / Studio: Untuk liputan lebih kreatif (interview, chase celeb in-RP, dll.).

Reward:
- Base + scaling per player online (misal di 2k players bisa ratusan ribu per aksi).
- Bonus khusus live streaming (per viewer dekat) & publish berita.

Catatan Penting:
- Script pakai natives FiveM + optional ox_lib (untuk notif lebih cantik). Kalau tidak pakai ox_lib, notif fallback ke native.
- Reward uang perlu hook manual ke ESX/QB (contoh sudah ada comment di server.lua).
- Kalau ada error atau butuh tweak (warna, posisi NUI, tambah fitur), bilang aja – siap revisi.

Semoga script ini bermanfaat dan bikin job wartawanlebih hidup & seru!
Terima kasih atas server-nya yang keren.

By By & Bae 🐸🐸
