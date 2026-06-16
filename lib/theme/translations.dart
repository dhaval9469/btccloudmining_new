import 'package:btccloudmining/theme/config.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    // TODO english Translation
    'en_US': {
      // home
      "bh": "Home",
      "bu": "Upgrade",
      "bl": "Leaderboard",
      "bs": "Setting",
      "hh": "Hello, @name",
      "hs": "Speed",
      "ham": "Active Miners",
      "hsmn": "Your cloud mining will pause when the timer ends. Restart manually to keep mining.",
      "hsm": "Start Mining",
      "hab": "Active Booster",
      "hdr": "Daily Reward",
      "hadboost": "Collect",
      "hqr": "Quick Reward",
      "hdqh": "Quick Ads Reward",
      "hdrcm": "This reward has already been collected. It will reopen tomorrow.",
      "hqrcm": "This reward has already been collected. It will reopen after 4 hours.",

      // store
      "swAdBoost": "Claim",
      "spn": "Upgrade Now",
      "swab": "Watch Ad & Boost",
      "scpeed": "Active Speed: ",
      "scfpb": "Free Speed Booster",
      "scfs": "Minute",
      "srz": "Reward Zone 🎉",
      "srct": "Reward Coin",
      "srzst": "Mine free Bitcoin by completing simple tasks",
      "srzh": "Reward Zone",
      "srzhst":
          "Complete simple tasks like watching ads and leaving reviews to earn Reward. Use your Reward to activate mining at no cost—no investment required.",
      "scht": "Meet RewardCoin — our special way of saying thank you for being part of our app.",
      "scab": "Available Balance",
      "scuscb": "Convert",
      "scone": "1 RewardCoin",
      "scn1":
      "RewardCoin is a bonus reward from us. To convert it into BTC, you must have a withdrawable @cbtcb BTC balance.",
      "sccer":"Sorry, you have insufficient balance to convert RewardCoin.",
      "rzar": "Available Rewards",
      "rwt": "Task:",
      "rwr": "Reward:",
      "rwcb": "Claim",
      "rwcdb": "Claimed",
      "rwcloseb": "Close",
      "hbrwd": "Watch this ad to unlock a bonus mining reward and earn more.\n@reward",
      "wad": "Watch Now",
      "rat":"Ready in @atime",
      's1': 'Enjoy 100% uptime with your dedicated miner—stay active even during system downtime.',
      's2':
      'By subscribing, you agree to automatic charges. Your plan renews at the same price and duration unless canceled. You also agree to our',


      // wallet
      "wh": "Wallet",

      // setting
      "sp": "Profile",
      "sep": "Edit Profile",
      "sg": "General",
      "scp": "Current Plan",
      "swb": "Withdraw BTC",
      "srs": "Restore Subscription",
      "srcrp": "Convert Reward Points",
      "so": "Other",
      "srf": "Refer Friends",
      "sl": "Language",
      "sru": "Rate Us",
      "ss": "Share",
      "sas": "Account & Support",
      "spp": "Privacy Policy",
      "scs": "Customer Support",
      "slo": "Log Out",
      "sda": "Delete Account",
      "sShareText":
          "🔐 Secure. Reliable. Efficient.\nMine Bitcoin with confidence using high-performance mining tools.\n📊 Transparent earnings tracking\n⚙️ Optimized mining performance\n🛡️ Built with security and stability in mind\n👇 Download ${AppConfig.appName} and start mining safely today.\n👉@shareAppLink",
      "sruf": "We’d love your feedback!",
      "srufText":
          "Thanks for being part of the ${AppConfig.appName} family 🫶 If you’re enjoying your mining journey, please take a moment to leave a ⭐️ rating. Your feedback helps us improve security, performance, and reliability for everyone.",
      "srufsb": "Submit",
      "slt": "Are you sure you want to log out of your account?",
      "slyb": "Yes",
      "slnb": "No",
      "sdh": "Are you sure you want to delete your account?",
      "sdsub": "This will permanently erase all your data. This action cannot be undone.",
      "sdstostm": "✅ Your account has been deleted and all data cleared.",
      "srsm":
          "Your subscription has been successfully restored. Your mining power is up, and you can continue earning without any interruptions.",
      "snasfua": "No active subscription found in your account.",

      // Edit Profile
      "epn": "Name",
      "epne": "Please enter your full name",
      "epe": "Email",
      "epee": "Enter a valid email address",
      "epp": "Phone Number",
      "eppe": "Enter a valid phone number",
      "epu": "Update",

      // Withdraw BTC
      "wbera": "Enter Recipient Address",
      "wberae": "Please enter a valid address",
      "wbwl": "withdrawal Limit: @limit BTC",
      "wbwle": "You must have at least @limitError BTC to withdraw.",
      "wbpb": "Proceed",
      "wbwh": "Withdrawal History",
      "wbydhapy": "You don’t have any payout history yet.",
      "wbcp": "You don’t have a plan yet.",

      // Refer Friends
      "rfyrc": "Your Referral Code",
      "rfcc": "Copy Code",
      "rfsc": "Share Code",
      "rfbr": "Benefits of Referrals",
      "rfgber": "Get @rBTC BTC for every referral",
      "rfyfghbsm": "Your friends get huge bonuses to start mining",
      "rfurimyw": "Unlimited referrals – invite as many as you want!",
      "rfct":
          "🔐 Join me on ${AppConfig.appName}\nI’m using this app to mine Bitcoin with secure, high-performance tools and clear earning tracking. It’s easy to get started and free to join.\n🎁 Use my invite code @referralCode to receive your bonus instantly.\n👇 Download the app and start mining today:\n👉 @siAppLink",

      // Customer Support
      "csym": "Your Massage",
      "cstymh": "Type your message here...",
      "csmr": "message is required.",
      "css": "Submit",

      // etc
      'srd': "Done",
      "epst":
          "Experience Effortless Bitcoin Mining with Advanced Cloud Mining Technology — Anytime, Anywhere.",

      // lock && unlock
      'lPh': "Lock",
      'lPlb': "ENABLE LOCK",
      'lPvl': "VAULT LOCKED",
      'lPsc':
          "Secure channel active Unlock the vault now to claim @lockbtc BTC Lock once. Relax always. Your Bitcoin stays protected.",
      "lPbsm": "Your mined @lockedbtc BTC is securely locked on a secure channel.",
      "lptl": "Watch this ad to secure your mined @tolockbtc BTC on a secure, encrypted channel.",
      'lUPh': "Unlock",
      'lUPlb': "UNLOCK VAULT",
      'lUPvl': "VAULT UNLOCKED",
      'lUPsc':
          "Secure channel engaged. Unlock the vault now to access your @unlockbtc BTC. Secure access. Full control.",
      'lUPbsm': "Your @unlockedbtc BTC is now unlocked and ready to claim.",
      'lUPtl':
          "Watch this ad to unlock your vault and access your mined @tounlockbtc BTC instantly.",

      // store info
      "sisa": "Mining Speed:",
      "sip": "Mining Power:",
      "sies": "Mining Boost:",
      "siods": "Mining Speed",
      "siode": "Mining Power",
      "siodn": "Mining Boost",
      "siot": "Duration",
      "siodd": "Discount",
      "siodp": "Total Price",
      "siodop": "Original Price",
      "siltos": "Get @discount% Off",
      "siap": "Activate Plan",
      "sisub":
          "Your subscription renews automatically according to your plan, unless you cancel. You can manage it anytime in Google Play.",
      "sissm": "Your @name plan @speed has been activated for @day days.",
      "sipsb": "Okey",
      "siod": "Order Details",

      // sing page
      "lh": "Hey! Welcome back 👋 Let’s get started",
      "lsub": "Fast and secure sign-in with Google",
      "lcwg": "Continue with Google",
      "ltou": "Terms of Use",
      "lsubText":
          "This app does not mine Bitcoin on your device. It simulates mining and lets you remotely manage cloud-based miners.",
      "lrc": "Referral Code",
      "lrsub": "Have a referral code? Unlock your rewards",
      "lrhint": "Enter Referral Code (Optional)",
      "lskip": "Skip",
      "lsubmit": "Submit",
      "src": "Congratulations",
      "srsubone": "As part of our commitment, we’ve added a free reward to get you started ",
      "srsubtwo": " cloud mining boost to your account!",
      "srls": "Let's Start",
      "srdh": "Watch this ad to claim your free @value BTC welcome bonus in your wallet.",
      "srdnt": "No Thanks",
      "cics": "Initializing Cloud Server",
      "cisc": "Setup Complete",
      "cisyr": "Select Your Region",
      "cicr": "Choose Region",
      "ci": "Initializing...",
      "csc": "All done! Your cloud mining server is ready in @selectedRegion region",
      "cscr": "You’ve received @reward of free cloud mining power to start your mining journey.",
      "cyrs": "Your cloud mining server will be initialized based on the region you choose.",
      "ccb": "Continue",
      "csre":"⚠️ Choose your region to continue",

      // utils
      "watchAdTitle": "Watch this ad to boost your mining power to @text for @adTime minutes ⚡",
      "watchAdN": "Not now",
      "watchAdY": "Watch Now",
      "swadt": "Watch an ad to activate cloud mining instantly \nYour current speed: @cs ⛏️",

      // FAQ
      'q1': "What is Bitcoin Cloud Mining?",
      'a1':
          "Bitcoin Cloud Mining is a remote mining method where users rent computing power from data centers to mine Bitcoin. It eliminates the need for physical hardware, setup, or maintenance. Users earn daily rewards based on the hash rate they purchase. This makes it a convenient and accessible option for anyone to start mining.",
      'q3': "Can I mine Bitcoin remotely?",
      'a3':
          "Yes, you can mine Bitcoin remotely through cloud mining. This allows you to rent mining power from data centers without owning any hardware. The mining process runs on remote servers, and you receive daily Bitcoin earnings based on your purchased hash rate.",
      'q4': "What is a Hashrate?",
      'a4':
          "Hashrate is the measurement of computing power used in Bitcoin mining. It represents how many calculations (or “hashes”) a system can perform per second to solve complex algorithms. A higher hashrate means faster mining and a better chance of earning Bitcoin rewards.",
      'q5': "Can You Earn Profit from Bitcoin Cloud Mining?",
      'a5':
          "Yes, with the right plan and consistent mining activity, Bitcoin cloud mining can generate steady earnings. Profitability depends on your hash rate, BTC price, and mining duration.",
      'q6': "Is It Possible to Increase Remote Bitcoin Mining Speed?",
      'a6':
          "Yes, by upgrading your cloud mining plan to a higher hash rate, you can boost your mining speed and earn Bitcoin more efficiently.",
      'q7': "How Long Will It Take to Reach the Withdrawal Limit?",
      'a7':
          "The time it takes depends on your mining speed (hash rate), plan type, and how consistently you mine. With a higher hash rate and daily activity, many users reach the withdrawal limit within a few weeks to a month.",
      'q8': "Is Bitcoin Mining Legal?",
      'a8':
          "Yes, Bitcoin mining is legal in many countries but restricted or banned in some. Always check your local regulations before mining.",
      "q0": "What is an CryptoRise Cloud?",
      "a0":
          "An CryptoRise Cloud refers to cloud-based cryptocurrency mining that leverages Application-Specific Integrated Circuit miners. Rather than purchasing and maintaining costly hardware, users can rent mining power from professional data centers equipped with high-performance machines optimized for Bitcoin mining.",
      "q9": "How do I start Bitcoin mining?",
      "a9":
          "To start Bitcoin mining, simply click the Start Mining button and the process will begin automatically.",
      "q10": "Can I try Bitcoin mining for free?",
      "a10":
          " Yes! New users can try BTC mining for free.Just register, watch ads, and start mining instantly.",
    },

    // TODO Malay Translation
    'ms_MY': {
      // home (laman utama)
      "bh": "Laman Utama",
      "bu": "Naik Taraf",
      "bl": "Papan Pendahulu",
      "bs": "Tetapan",
      "hh": "Halo, @name",
      "hs": "Kelajuan",
      "ham": "Pelombong Aktif",
      "hsmn": "Perlombongan awan anda akan berhenti apabila pemasa tamat. Mulakan semula secara manual untuk terus melombong.",
      "hsm": "Mula Melombong",
      "hab": "Booster Aktif",
      "hdr": "Ganjaran Harian",
      "hadboost": "Kumpul",
      "hqr": "Ganjaran Pantas",
      "hdqh": "Ganjaran Iklan Pantas",
      "hdrcm": "Ganjaran ini telah dikumpul. Ia akan dibuka semula esok.",
      "hqrcm": "Ganjaran ini telah dikumpul. Ia akan dibuka semula selepas 4 jam.",

      // store (kedai)
      "swAdBoost": "Tebus",
      "spn": "Naik Taraf Sekarang",
      "swab": "Tonton Iklan & Boost",
      "scpeed": "Kelajuan Aktif: ",
      "scfpb": "Booster Kelajuan Percuma",
      "scfs": "Minit",
      "srz": "Zon Ganjaran 🎉",
      "srct": "Reward Coin",
      "srzst": "Lombong Bitcoin percuma dengan melengkapkan tugasan mudah",
      "srzh": "Zon Ganjaran",
      "srzhst":
      "Lengkapkan tugasan mudah seperti menonton iklan dan meninggalkan ulasan untuk mendapat Ganjaran. Gunakan Ganjaran anda untuk mengaktifkan perlombongan tanpa kos—tiada pelaburan diperlukan.",
      "scht": "Kenali RewardCoin — cara istimewa kami mengucapkan terima kasih kerana menjadi sebahagian daripada aplikasi kami.",
      "scab": "Baki Tersedia",
      "scuscb": "Tukar",
      "scone": "1 RewardCoin",
      "scn1":
      "RewardCoin adalah ganjaran bonus daripada kami. Untuk menukarnya kepada BTC, anda mesti mempunyai baki BTC @cbtcb yang boleh dikeluarkan.",
      "sccer":"Maaf, baki anda tidak mencukupi untuk menukar RewardCoin.",
      "rzar": "Ganjaran Tersedia",
      "rwt": "Tugasan:",
      "rwr": "Ganjaran:",
      "rwcb": "Tebus",
      "rwcdb": "Ditebus",
      "rwcloseb": "Tutup",
      "hbrwd": "Tonton iklan ini untuk membuka ganjaran bonus perlombongan dan jana lebih banyak.\n@reward",
      "wad": "Tonton Sekarang",
      "rat":"Sedia dalam @atime",
      's1': 'Nikmati masa operasi 100% dengan pelombong khas anda—kekal aktif walaupun semasa sistem terhenti.',
      's2':
      'Dengan melanggan, anda bersetuju dengan caj automatik. Pelan anda diperbaharui pada harga dan tempoh yang sama melainkan dibatalkan. Anda juga bersetuju dengan kami',


      // wallet (dompet)
      "wh": "Dompet",

      // setting (tetapan)
      "sp": "Profil",
      "sep": "Edit Profil",
      "sg": "Umum",
      "scp": "Pelan Semasa",
      "swb": "Pengeluaran BTC",
      "srs": "Pulihkan Langganan",
      "srcrp": "Tukar Mata Ganjaran",
      "so": "Lain-lain",
      "srf": "Saran Rakan",
      "sl": "Bahasa",
      "sru": "Nilaikan Kami",
      "ss": "Kongsi",
      "sas": "Akaun & Sokongan",
      "spp": "Dasar Privasi",
      "scs": "Sokongan Pelanggan",
      "slo": "Log Keluar",
      "sda": "Padam Akaun",
      "sShareText":
      "🔐 Selamat. Dipercayai. Cekap.\nLombong Bitcoin dengan yakin menggunakan alatan perlombongan berprestasi tinggi.\n📊 Penjejakan pendapatan telus\n⚙️ Prestasi perlombongan dioptimumkan\n🛡️ Dibina dengan fokus pada keselamatan dan kestabilan\n👇 Muat turun ${AppConfig.appName} dan mula melombong dengan selamat hari ini.\n👉@shareAppLink",
      "sruf": "Kami menghargai maklum balas anda!",
      "srufText":
      "Terima kasih kerana menjadi sebahagian daripada keluarga ${AppConfig.appName} 🫶 Jika anda menikmati perjalanan perlombongan anda, sila luangkan masa untuk memberikan penarafan ⭐️. Maklum balas anda membantu kami meningkatkan keselamatan, prestasi, dan kebolehpercayaan untuk semua orang.",
      "srufsb": "Hantar",
      "slt": "Adakah anda pasti mahu log keluar daripada akaun anda?",
      "slyb": "Ya",
      "slnb": "Tidak",
      "sdh": "Adakah anda pasti mahu memadam akaun anda?",
      "sdsub": "Ini akan memadamkan semua data anda secara kekal. Tindakan ini tidak boleh dibatalkan.",
      "sdstostm": "✅ Akaun anda telah dipadamkan dan semua data telah dibersihkan.",
      "srsm":
      "Langganan anda telah berjaya dipulihkan. Kuasa perlombongan anda telah aktif, dan anda boleh terus menjana tanpa sebarang gangguan.",
      "snasfua": "Tiada langganan aktif ditemui dalam akaun anda.",

      // Edit Profile (Edit Profil)
      "epn": "Nama",
      "epne": "Sila masukkan nama penuh anda",
      "epe": "Emel",
      "epee": "Masukkan alamat emel yang sah",
      "epp": "Nombor Telefon",
      "eppe": "Masukkan nombor telefon yang sah",
      "epu": "Kemas Kini",

      // Withdraw BTC (Pengeluaran BTC)
      "wbera": "Masukkan Alamat Penerima",
      "wberae": "Sila masukkan alamat yang sah",
      "wbwl": "Had Pengeluaran: @limit BTC",
      "wbwle": "Anda mesti mempunyai sekurang-kurangnya @limitError BTC untuk pengeluaran.",
      "wbpb": "Teruskan",
      "wbwh": "Sejarah Pengeluaran",
      "wbydhapy": "Anda belum mempunyai sebarang sejarah pembayaran lagi.",
      "wbcp": "Anda belum mempunyai pelan lagi.",

      // Refer Friends (Saran Rakan)
      "rfyrc": "Kod Rujukan Anda",
      "rfcc": "Salin Kod",
      "rfsc": "Kongsi Kod",
      "rfbr": "Kelebihan Rujukan",
      "rfgber": "Dapatkan @rBTC BTC untuk setiap rujukan",
      "rfyfghbsm": "Rakan anda mendapat bonus besar untuk mula melombong",
      "rfurimyw": "Rujukan tanpa had – ajak seramai mana yang anda mahu!",
      "rfct":
      "🔐 Sertai saya di ${AppConfig.appName}\nSaya menggunakan aplikasi ini untuk melombong Bitcoin dengan alatan berprestasi tinggi yang selamat serta penjejakan pendapatan yang jelas. Ia mudah untuk bermula dan percuma untuk disertai.\n🎁 Gunakan kod jemputan saya @referralCode untuk menerima bonus anda serta-merta.\n👇 Muat turun aplikasi dan mula melombong hari ini:\n👉 @siAppLink",

      // Customer Support (Sokongan Pelanggan)
      "csym": "Mesej Anda",
      "cstymh": "Taip mesej anda di sini...",
      "csmr": "Mesej diperlukan.",
      "css": "Hantar",

      // etc (lain-lain)
      'srd': "Selesai",
      "epst":
      "Alami Perlombongan Bitcoin Tanpa Usaha dengan Teknologi Perlombongan Awan Termaju — Bila-bila Masa, Di Mana Jua.",

      // lock && unlock (kunci && buka)
      'lPh': "Kunci",
      'lPlb': "AKTIFKAN KUNCI",
      'lPvl': "BILIK KEBAL DIKUNCI",
      'lPsc':
      "Saluran selamat aktif. Buka kunci bilik kebal sekarang untuk menuntut @lockbtc BTC. Kunci sekali. Tenang sentiasa. Bitcoin anda kekal dilindungi.",
      "lPbsm": "BTC @lockedbtc anda yang dilombong dikunci dengan selamat di saluran yang dilindungi.",
      "lptl": "Tonton iklan ini untuk mengamankan BTC @tolockbtc anda di saluran yang selamat dan disulitkan.",
      'lUPh': "Buka Kunci",
      'lUPlb': "BUKA KUNCI BILIK KEBAL",
      'lUPvl': "BILIK KEBAL DIBUKA",
      'lUPsc':
      "Saluran selamat diaktifkan. Buka kunci bilik kebal sekarang untuk mengakses @unlockbtc BTC anda. Akses selamat. Kawalan penuh.",
      'lUPbsm': "BTC @unlockedbtc anda kini telah dibuka dan sedia untuk dituntut.",
      'lUPtl':
      "Tonton iklan ini untuk membuka bilik kebal anda dan mengakses BTC @tounlockbtc yang dilombong serta-merta.",

      // store info (maklumat kedai)
      "sisa": "Kelajuan Melombong:",
      "sip": "Kuasa Melombong:",
      "sies": "Boost Melombong:",
      "siods": "Kelajuan Melombong",
      "siode": "Kuasa Melombong",
      "siodn": "Boost Melombong",
      "siot": "Tempoh",
      "siodd": "Diskaun",
      "siodp": "Harga Keseluruhan",
      "siodop": "Harga Asal",
      "siltos": "Dapatkan Diskaun @discount%",
      "siap": "Aktifkan Pelan",
      "sisub":
      "Langganan anda diperbaharui secara automatik mengikut pelan anda, melainkan anda membatalkannya. Anda boleh mengurusnya pada bila-bila masa di Google Play.",
      "sissm": "Pelan @name anda @speed telah diaktifkan selama @day hari.",
      "sipsb": "Okey",
      "siod": "Butiran Pesanan",

      // sign page (laman log masuk)
      "lh": "Hei! Selamat kembali 👋 Mari mulakan",
      "lsub": "Log masuk pantas dan selamat dengan Google",
      "lcwg": "Teruskan dengan Google",
      "ltou": "Syarat Penggunaan",
      "lsubText":
      "Aplikasi ini tidak melombong Bitcoin pada peranti anda. Ia simulasi perlombongan dan membolehkan anda mengurus pelombong berasaskan awan secara jauh.",
      "lrc": "Kod Rujukan",
      "lrsub": "Ada kod rujukan? Buka kunci ganjaran anda",
      "lrhint": "Masukkan Kod Rujukan (Pilihan)",
      "lskip": "Langkau",
      "lsubmit": "Hantar",
      "src": "Tahniah",
      "srsubone": "Sebagai sebahagian daripada komitmen kami, kami telah menambah ganjaran percuma untuk anda bermula ",
      "srsubtwo": " boost perlombongan awan ke akaun anda!",
      "srls": "Mari Bermula",
      "srdh": "Tonton iklan ini untuk menuntut bonus selamat datang @value BTC percuma dalam dompet anda.",
      "srdnt": "Tidak, Terima Kasih",
      "cics": "Memulakan Pelayan Awan",
      "cisc": "Persediaan Selesai",
      "cisyr": "Pilih Wilayah Anda",
      "cicr": "Pilih Wilayah",
      "ci": "Memulakan...",
      "csc": "Semua selesai! Pelayan perlombongan awan anda sedia di wilayah @selectedRegion",
      "cscr": "Anda telah menerima @reward kuasa perlombongan awan percuma untuk memulakan perjalanan anda.",
      "cyrs": "Pelayan perlombongan awan anda akan dimulakan berdasarkan wilayah yang anda pilih.",
      "ccb": "Teruskan",
      "csre":"⚠️ Pilih wilayah anda untuk meneruskan",

      // utils
      "watchAdTitle": "Tonton iklan ini untuk meningkatkan kuasa perlombongan anda kepada @text selama @adTime minit ⚡",
      "watchAdN": "Bukan sekarang",
      "watchAdY": "Tonton Sekarang",
      "swadt":"Tonton iklan untuk aktifkan perlombongan awan serta-merta \nKelajuan semasa anda: @cs ⛏️",

      // FAQ (Soalan Lazim)
      'q1': "Apakah itu Perlombongan Awan Bitcoin?",
      'a1':
      "Perlombongan Awan Bitcoin adalah kaedah perlombongan jauh di mana pengguna menyewa kuasa pengkomputeran daripada pusat data untuk melombong Bitcoin. Ia menghapuskan keperluan untuk perkakasan fizikal, persediaan, atau penyelenggaraan. Pengguna mendapat ganjaran harian berdasarkan kadar hash yang dibeli. Ini menjadikannya pilihan yang mudah dan boleh diakses oleh sesiapa sahaja untuk mula melombong.",
      'q3': "Bolehkah saya melombong Bitcoin secara jauh?",
      'a3':
      "Ya, anda boleh melombong Bitcoin secara jauh melalui perlombongan awan. Ini membolehkan anda menyewa kuasa perlombongan daripada pusat data tanpa memiliki sebarang perkakasan. Proses perlombongan berjalan pada pelayan jauh, dan anda menerima pendapatan Bitcoin harian berdasarkan kadar hash yang anda beli.",
      'q4': "Apakah itu Hashrate?",
      'a4':
      "Hashrate adalah ukuran kuasa pengkomputeran yang digunakan dalam perlombongan Bitcoin. Ia mewakili berapa banyak pengiraan (atau “hash”) yang boleh dilakukan oleh sistem sesaat untuk menyelesaikan algoritma yang kompleks. Hashrate yang lebih tinggi bermakna perlombongan lebih pantas dan peluang yang lebih baik untuk mendapat ganjaran Bitcoin.",
      'q5': "Bolehkah Anda Mendapat Keuntungan daripada Perlombongan Awan Bitcoin?",
      'a5':
      "Ya, dengan pelan yang betul dan aktiviti perlombongan yang konsisten, perlombongan awan Bitcoin boleh menjana pendapatan yang stabil. Keuntungan bergantung pada kadar hash anda, harga BTC, dan tempoh perlombongan.",
      'q6': "Adakah Mungkin untuk Meningkatkan Kelajuan Perlombongan Bitcoin Jauh?",
      'a6':
      "Ya, dengan menaik taraf pelan perlombongan awan anda kepada kadar hash yang lebih tinggi, anda boleh meningkatkan kelajuan perlombongan anda dan melombong Bitcoin dengan lebih cekap.",
      'q7': "Berapa Lama Masa yang Diambil untuk Mencapai Had Pengeluaran?",
      'a7':
      "Masa yang diambil bergantung pada kelajuan perlombongan (kadar hash), jenis pelan, dan betapa konsisten anda melombong. Dengan kadar hash yang lebih tinggi dan aktiviti harian, ramai pengguna mencapai had pengeluaran dalam masa beberapa minggu hingga sebulan.",
      'q8': "Adakah Perlombongan Bitcoin Sah?",
      'a8':
      "Ya, perlombongan Bitcoin adalah sah di banyak negara tetapi dihadkan atau dilarang di sesetengah negara. Sentiasa periksa peraturan tempatan anda sebelum melombong.",
      "q0": "Apakah itu CryptoRise Cloud?",
      "a0":
      "CryptoRise Cloud merujuk kepada perlombongan mata wang kripto berasaskan awan yang menggunakan pelombong ASIC (Application-Specific Integrated Circuit). Daripada membeli dan menyelenggara perkakasan yang mahal, pengguna boleh menyewa kuasa perlombongan daripada pusat data profesional yang dilengkapi dengan mesin berprestasi tinggi yang dioptimumkan untuk perlombongan Bitcoin.",
      "q9": "Bagaimana cara saya mula melombong Bitcoin?",
      "a9":
      "Untuk mula melombong Bitcoin, hanya klik butang Mula Melombong dan proses tersebut akan bermula secara automatik.",
      "q10": "Bolehkah saya mencuba perlombongan Bitcoin secara percuma?",
      "a10":
      " Ya! Pengguna baharu boleh mencuba perlombongan BTC secara percuma. Hanya mendaftar, tonton iklan, dan mula melombong serta-merta.",
    },

    // TODO Filipino Translation
    'fil_PH': {
      // home
      "bh": "Home",
      "bu": "Upgrade",
      "bl": "Leaderboard",
      "bs": "Settings",
      "hh": "Kumusta, @name",
      "hs": "Bilis",
      "ham": "Aktibong Miners",
      "hsmn": "Hihinto ang iyong cloud mining kapag natapos ang timer. I-restart ito nang manual para ituloy ang pag-mine.",
      "hsm": "Simulan ang Pag-mine",
      "hab": "Aktibong Booster",
      "hdr": "Daily Reward",
      "hadboost": "Kolektahin",
      "hqr": "Mabilis na Reward",
      "hdqh": "Reward sa Mabilis na Ads",
      "hdrcm": "Nakolekta na ang reward na ito. Magbubukas itong muli bukas.",
      "hqrcm": "Nakolekta na ang reward na ito. Magbubukas itong muli pagkalipas ng 4 na oras.",

      // store
      "swAdBoost": "I-claim",
      "spn": "Mag-upgrade Ngayon",
      "swab": "Manood ng Ad at Mag-boost",
      "scpeed": "Aktibong Bilis: ",
      "scfpb": "Libreng Speed Booster",
      "scfs": "Minuto",
      "srz": "Reward Zone 🎉",
      "srct": "Reward Coin",
      "srzst": "Mag-mine ng libreng Bitcoin sa pamamagitan ng pagtapos ng mga simpleng task",
      "srzh": "Reward Zone",
      "srzhst":
      "Tapusin ang mga simpleng task tulad ng panonood ng ads at pag-iwan ng reviews para makakuha ng Reward. Gamitin ang iyong Reward para i-activate ang mining nang walang bayad—walang investment na kailangan.",
      "scht": "Kilalanin ang RewardCoin — ang aming espesyal na paraan ng pasasalamat sa pagiging bahagi ng aming app.",
      "scab": "Kasalukuyang Balance",
      "scuscb": "I-convert",
      "scone": "1 RewardCoin",
      "scn1":
      "Ang RewardCoin ay isang bonus reward mula sa amin. Para ma-convert ito sa BTC, dapat kang mayroong withdrawable na @cbtcb BTC balance.",
      "sccer":"Paumanhin, hindi sapat ang iyong balance para i-convert ang RewardCoin.",
      "rzar": "Mga Reward na Puwedeng Kunin",
      "rwt": "Task:",
      "rwr": "Reward:",
      "rwcb": "I-claim",
      "rwcdb": "Na-claim na",
      "rwcloseb": "Isara",
      "hbrwd": "Panoorin ang ad na ito para ma-unlock ang bonus mining reward at kumita pa nang higit.\n@reward",
      "wad": "Panoorin Ngayon",
      "rat":"Handa na sa loob ng @atime",
      's1': 'Mag-enjoy ng 100% uptime gamit ang iyong dedicated miner—manatiling aktibo kahit may system downtime.',
      's2':
      'Sa pag-subscribe, sumasang-ayon ka sa awtomatikong paniningil. Magpapatuloy ang iyong plan sa parehong presyo at tagal maliban kung ikansela. Sumasang-ayon ka rin sa aming',


      // wallet
      "wh": "Wallet",

      // setting
      "sp": "Profile",
      "sep": "I-edit ang Profile",
      "sg": "General",
      "scp": "Kasalukuyang Plan",
      "swb": "I-withdraw ang BTC",
      "srs": "Ibalik ang Subscription",
      "srcrp": "I-convert ang Reward Points",
      "so": "Iba pa",
      "srf": "Mag-refer ng Kaibigan",
      "sl": "Wika",
      "sru": "I-rate Kami",
      "ss": "Ibahagi",
      "sas": "Account at Suporta",
      "spp": "Privacy Policy",
      "scs": "Customer Support",
      "slo": "Log Out",
      "sda": "I-delete ang Account",
      "sShareText":
      "🔐 Ligtas. Maaasahan. Mahusay.\nMag-mine ng Bitcoin nang may tiwala gamit ang high-performance mining tools.\n📊 Transparent na pagsubaybay sa kita\n⚙️ Optimized na mining performance\n🛡️ Binuo nang may seguridad at katatagan sa isip\n👇 I-download ang ${AppConfig.appName} at simulan ang ligtas na pag-mine ngayon.\n👉@shareAppLink",
      "sruf": "Gusto naming malaman ang iyong feedback!",
      "srufText":
      "Salamat sa pagiging bahagi ng ${AppConfig.appName} family 🫶 Kung nag-e-enjoy ka sa iyong mining journey, mangyaring maglaan ng sandali para mag-iwan ng ⭐️ rating. Ang iyong feedback ay nakakatulong sa amin na mapabuti ang seguridad, performance, at pagiging maaasahan para sa lahat.",
      "srufsb": "I-submit",
      "slt": "Sigurado ka bang gusto mong mag-log out sa iyong account?",
      "slyb": "Oo",
      "slnb": "Hindi",
      "sdh": "Sigurado ka bang gusto mong i-delete ang iyong account?",
      "sdsub": "Permanente nitong buburahin ang lahat ng iyong data. Ang aksyong ito ay hindi na maaaring bawiin.",
      "sdstostm": "✅ Ang iyong account ay na-delete na at lahat ng data ay nabura na.",
      "srsm":
      "Matagumpay na naibalik ang iyong subscription. Aktibo na ang iyong mining power, at maaari kang magpatuloy sa kita nang walang anumang abala.",
      "snasfua": "Walang nahanap na aktibong subscription sa iyong account.",

      // Edit Profile
      "epn": "Pangalan",
      "epne": "Mangyaring ilagay ang iyong buong pangalan",
      "epe": "Email",
      "epee": "Maglagay ng valid na email address",
      "epp": "Numero ng Telepono",
      "eppe": "Maglagay ng valid na numero ng telepono",
      "epu": "I-update",

      // Withdraw BTC
      "wbera": "Ilagay ang Address ng Tatanggap",
      "wberae": "Mangyaring maglagay ng valid na address",
      "wbwl": "Limit sa Pag-withdraw: @limit BTC",
      "wbwle": "Dapat kang mayroong hindi bababa sa @limitError BTC para makapag-withdraw.",
      "wbpb": "Magpatuloy",
      "wbwh": "History ng Pag-withdraw",
      "wbydhapy": "Wala ka pang payout history sa ngayon.",
      "wbcp": "Wala ka pang plan sa ngayon.",

      // Refer Friends
      "rfyrc": "Iyong Referral Code",
      "rfcc": "Kopyahin ang Code",
      "rfsc": "Ibahagi ang Code",
      "rfbr": "Mga Benepisyo ng Referral",
      "rfgber": "Makakuha ng @rBTC BTC para sa bawat referral",
      "rfyfghbsm": "Ang iyong mga kaibigan ay makakakuha ng malalaking bonus para simulan ang pag-mine",
      "rfurimyw": "Walang limitasyong referrals – mag-imbita hangga't gusto mo!",
      "rfct":
      "🔐 Samahan mo ako sa ${AppConfig.appName}\nGinagamit ko ang app na ito para mag-mine ng Bitcoin gamit ang ligtas at high-performance tools at malinaw na pagsubaybay sa kita. Madali lang magsimula at libreng sumali.\n🎁 Gamitin ang aking invite code @referralCode para matanggap ang iyong bonus agad.\n👇 I-download ang app at simulan ang pag-mine ngayon:\n👉 @siAppLink",

      // Customer Support
      "csym": "Iyong Mensahe",
      "cstymh": "I-type ang iyong mensahe rito...",
      "csmr": "Kinakailangan ang mensahe.",
      "css": "I-submit",

      // etc
      'srd': "Tapos na",
      "epst":
      "Damhin ang Madaling Pag-mine ng Bitcoin gamit ang Advanced Cloud Mining Technology — Anumang Oras, Kahit Saan.",

      // lock && unlock
      'lPh': "I-lock",
      'lPlb': "I-ENABLE ANG LOCK",
      'lPvl': "NAKA-LOCK ANG VAULT",
      'lPsc':
      "Aktibo ang secure channel. I-unlock ang vault ngayon para ma-claim ang @lockbtc BTC. I-lock nang minsan. Mag-relax palagi. Ang iyong Bitcoin ay mananatiling protektado.",
      "lPbsm": "Ang iyong na-mine na @lockedbtc BTC ay ligtas na naka-lock sa isang secure channel.",
      "lptl": "Panoorin ang ad na ito para i-secure ang iyong na-mine na @tolockbtc BTC sa isang secure at encrypted na channel.",
      'lUPh': "I-unlock",
      'lUPlb': "I-UNLOCK ANG VAULT",
      'lUPvl': "NAKA-UNLOCK ANG VAULT",
      'lUPsc':
      "Nakakabit na ang secure channel. I-unlock ang vault ngayon para ma-access ang iyong @unlockbtc BTC. Ligtas na access. Ganap na kontrol.",
      'lUPbsm': "Ang iyong @unlockedbtc BTC ay naka-unlock na ngayon at handa nang i-claim.",
      'lUPtl':
      "Panoorin ang ad na ito para ma-unlock ang iyong vault at ma-access ang iyong na-mine na @tounlockbtc BTC agad.",

      // store info
      "sisa": "Bilis ng Pag-mine:",
      "sip": "Lakas ng Pag-mine:",
      "sies": "Boost sa Pag-mine:",
      "siods": "Bilis ng Pag-mine",
      "siode": "Lakas ng Pag-mine",
      "siodn": "Boost sa Pag-mine",
      "siot": "Tagal",
      "siodd": "Discount",
      "siodp": "Kabuuang Presyo",
      "siodop": "Orihinal na Presyo",
      "siltos": "Kumuha ng @discount% Off",
      "siap": "I-activate ang Plan",
      "sisub":
      "Awtomatikong magre-renew ang iyong subscription ayon sa iyong plan, maliban kung ikansela mo ito. Maaari mo itong i-manage anumang oras sa Google Play.",
      "sissm": "Ang iyong @name plan @speed ay na-activate na sa loob ng @day araw.",
      "sipsb": "Okey",
      "siod": "Detalye ng Order",

      // sing page
      "lh": "Hey! Welcome back 👋 Simulan na natin",
      "lsub": "Mabilis at ligtas na sign-in gamit ang Google",
      "lcwg": "Magpatuloy gamit ang Google",
      "ltou": "Terms of Use",
      "lsubText":
      "Ang app na ito ay hindi nag-mi-mine ng Bitcoin sa iyong device. Ginagaya nito ang mining at pinapayagan kang pamahalaan ang mga cloud-based miners nang malayuan.",
      "lrc": "Referral Code",
      "lrsub": "May referral code? I-unlock ang iyong mga reward",
      "lrhint": "Ilagay ang Referral Code (Optional)",
      "lskip": "Laktawan",
      "lsubmit": "I-submit",
      "src": "Pagbati!",
      "srsubone": "Bilang bahagi ng aming pangako, nagdagdag kami ng libreng reward para makapagsimula ka ",
      "srsubtwo": " cloud mining boost sa iyong account!",
      "srls": "Simulan Na",
      "srdh": "Panoorin ang ad na ito para ma-claim ang iyong libreng @value BTC welcome bonus sa iyong wallet.",
      "srdnt": "Huwag na lang",
      "cics": "Inihahanda ang Cloud Server",
      "cisc": "Tapos na ang Setup",
      "cisyr": "Pumili ng iyong Rehiyon",
      "cicr": "Pumili ng Rehiyon",
      "ci": "Inihahanda...",
      "csc": "Tapos na ang lahat! Ang iyong cloud mining server ay handa na sa @selectedRegion na rehiyon",
      "cscr": "Nakatanggap ka ng @reward na libreng cloud mining power para simulan ang iyong mining journey.",
      "cyrs": "Ang iyong cloud mining server ay ihahanda batay sa rehiyong pipiliin mo.",
      "ccb": "Magpatuloy",
      "csre":"⚠️ Pumili ng iyong rehiyon para magpatuloy",

      // utils
      "watchAdTitle": "Panoorin ang ad na ito para i-boost ang iyong mining power sa @text sa loob ng @adTime minuto ⚡",
      "watchAdN": "Hindi muna ngayon",
      "watchAdY": "Panoorin Ngayon",
      "swadt":"Manood ng ad para ma-activate agad ang cloud mining \nAng kasalukuyang bilis mo: @cs ⛏️",


      // FAQ
      'q1': "Ano ang Bitcoin Cloud Mining?",
      'a1':
      "Ang Bitcoin Cloud Mining ay isang paraan ng malayuang pag-mine kung saan ang mga gumagamit ay nagrerenta ng computing power mula sa mga data center para mag-mine ng Bitcoin. Inaalis nito ang pangangailangan para sa pisikal na hardware, setup, o maintenance. Ang mga gumagamit ay kumikita ng araw-araw na rewards batay sa hash rate na kanilang binili. Ginagawa nitong isang maginhawa at accessible na opsyon para sa sinuman na magsimulang mag-mine.",
      'q3': "Maaari ko bang i-mine ang Bitcoin nang malayuan?",
      'a3':
      "Oo, maaari kang mag-mine ng Bitcoin nang malayuan sa pamamagitan ng cloud mining. Binibigyang-daan ka nito na magrenta ng mining power mula sa mga data center nang hindi nagmamay-ari ng anumang hardware. Ang proseso ng mining ay tumatakbo sa mga remote server, at nakakatanggap ka ng araw-araw na kita ng Bitcoin batay sa iyong biniling hash rate.",
      'q4': "Ano ang Hashrate?",
      'a4':
      "Ang Hashrate ay ang pagsukat ng computing power na ginagamit sa pag-mine ng Bitcoin. Kinakatawan nito kung gaano karaming kalkulasyon (o “hashes”) ang maaaring gawin ng isang system bawat segundo para malutas ang mga kumplikadong algorithm. Ang mas mataas na hashrate ay nangangahulugan ng mas mabilis na pag-mine at mas magandang pagkakataon na makakuha ng Bitcoin rewards.",
      'q5': "Maaari ka bang Kumita mula sa Bitcoin Cloud Mining?",
      'a5':
      "Oo, sa tamang plan at pare-parehong aktibidad sa pag-mine, ang Bitcoin cloud mining ay maaaring makabuo ng matatag na kita. Ang kakayahang kumita ay depende sa iyong hash rate, presyo ng BTC, at tagal ng pag-mine.",
      'q6': "Posible bang Bilisan ang Malayuang Pag-mine ng Bitcoin?",
      'a6':
      "Oo, sa pamamagitan ng pag-upgrade ng iyong cloud mining plan sa isang mas mataas na hash rate, maaari mong pabilisin ang iyong pag-mine at kumita ng Bitcoin nang mas mahusay.",
      'q7': "Gaano Katagal Bago Maabot ang Limit sa Pag-withdraw?",
      'a7':
      "Ang tagal ay depende sa iyong bilis ng pag-mine (hash rate), uri ng plan, at kung gaano ka ka-consistent sa pag-mine. Sa mas mataas na hash rate at araw-araw na aktibidad, maraming gumagamit ang umaabot sa limit ng pag-withdraw sa loob ng ilang linggo hanggang isang buwan.",
      'q8': "Legal ba ang Pag-mine ng Bitcoin?",
      'a8':
      "Oo, ang pag-mine ng Bitcoin ay legal sa maraming bansa ngunit limitado o ipinagbabawal sa iba. Laging suriin ang iyong lokal na mga regulasyon bago mag-mine.",
      "q0": "Ano ang CryptoRise Cloud?",
      "a0":
      "Ang CryptoRise Cloud ay tumutukoy sa cloud-based cryptocurrency mining na gumagamit ng Application-Specific Integrated Circuit miners. Sa halip na bumili at magpanatili ng mamahaling hardware, ang mga gumagamit ay maaaring magrenta ng mining power mula sa mga propesyonal na data center na nilagyan ng mga makinang may mataas na performance na optimized para sa pag-mine ng Bitcoin.",
      "q9": "Paano ako magsisimulang mag-mine ng Bitcoin?",
      "a9":
      "Para magsimulang mag-mine ng Bitcoin, i-click lamang ang Start Mining button at awtomatikong magsisimula ang proseso.",
      "q10": "Maaari ko bang subukan ang pag-mine ng Bitcoin nang libre?",
      "a10":
      " Oo! Ang mga bagong gumagamit ay maaaring sumubok ng BTC mining nang libre. Mag-register lang, manood ng ads, at simulan ang pag-mine agad.",
    },

    // TODO French Translation
    'fr_FR': {
      // home
      "bh": "Accueil",
      "bu": "Améliorer",
      "bl": "Classement",
      "bs": "Paramètres",
      "hh": "Bonjour, @name",
      "hs": "Vitesse",
      "ham": "Mineurs Actifs",
      "hsmn": "Votre minage cloud s'arrêtera à la fin du minuteur. Redémarrez manuellement pour continuer à miner.",
      "hsm": "Démarrer le Minage",
      "hab": "Booster Actif",
      "hdr": "Récompense Quotidienne",
      "hadboost": "Récupérer",
      "hqr": "Récompense Rapide",
      "hdqh": "Récompense Pub Rapide",
      "hdrcm": "Cette récompense a déjà été récupérée. Elle sera de nouveau disponible demain.",
      "hqrcm": "Cette récompense a déjà été récupérée. Elle sera de nouveau disponible dans 4 heures.",

      // store
      "swAdBoost": "Réclamer",
      "spn": "Améliorer Maintenant",
      "swab": "Regarder une Pub & Booster",
      "scpeed": "Vitesse Active : ",
      "scfpb": "Booster de Vitesse Gratuit",
      "scfs": "Minute",
      "srz": "Zone de Récompense 🎉",
      "srct": "Reward Coin",
      "srzst": "Minez du Bitcoin gratuitement en accomplissant des tâches simples",
      "srzh": "Zone de Récompense",
      "srzhst":
      "Accomplissez des tâches simples comme regarder des publicités et laisser des avis pour gagner des Récompenses. Utilisez vos Récompenses pour activer le minage sans frais — aucun investissement requis.",
      "scht": "Découvrez RewardCoin — notre façon spéciale de vous remercier de faire partie de notre application.",
      "scab": "Solde Disponible",
      "scuscb": "Convertir",
      "scone": "1 RewardCoin",
      "scn1":
      "RewardCoin est une récompense bonus de notre part. Pour le convertir en BTC, vous devez avoir un solde BTC de @cbtcb retirable.",
      "sccer":"Désolé, votre solde est insuffisant pour convertir RewardCoin.",
      "rzar": "Récompenses Disponibles",
      "rwt": "Tâche :",
      "rwr": "Récompense :",
      "rwcb": "Réclamer",
      "rwcdb": "Réclamé",
      "rwcloseb": "Fermer",
      "hbrwd": "Regardez cette publicité pour débloquer un bonus de minage et gagner plus.\n@reward",
      "wad": "Regarder Maintenant",
      "rat":"Prêt dans @atime",
      's1': 'Profitez d\'une disponibilité de 100% avec votre mineur dédié — restez actif même pendant les interruptions du système.',
      's2':
      'En vous abonnant, vous acceptez les prélèvements automatiques. Votre forfait se renouvelle au même prix et pour la même durée, sauf annulation. Vous acceptez également nos',


      // wallet
      "wh": "Portefeuille",

      // setting
      "sp": "Profil",
      "sep": "Modifier le Profil",
      "sg": "Général",
      "scp": "Forfait Actuel",
      "swb": "Retirer BTC",
      "srs": "Restaurer l'Abonnement",
      "srcrp": "Convertir Points de Récompense",
      "so": "Autre",
      "srf": "Parrainer des Amis",
      "sl": "Langue",
      "sru": "Notez-nous",
      "ss": "Partager",
      "sas": "Compte & Support",
      "spp": "Politique de Confidentialité",
      "scs": "Service Client",
      "slo": "Déconnexion",
      "sda": "Supprimer le Compte",
      "sShareText":
      "🔐 Sécurisé. Fiable. Efficace.\nMinez du Bitcoin en toute confiance avec des outils de minage haute performance.\n📊 Suivi transparent des gains\n⚙️ Performance de minage optimisée\n🛡️ Conçu avec la sécurité et la stabilité à l'esprit\n👇 Téléchargez ${AppConfig.appName} et commencez à miner en toute sécurité dès aujourd'hui.\n👉@shareAppLink",
      "sruf": "Nous aimerions recevoir vos commentaires !",
      "srufText":
      "Merci de faire partie de la famille ${AppConfig.appName} 🫶 Si vous appréciez votre parcours de minage, veuillez prendre un moment pour laisser une note de ⭐️. Vos commentaires nous aident à améliorer la sécurité, la performance et la fiabilité pour tous.",
      "srufsb": "Soumettre",
      "slt": "Êtes-vous sûr de vouloir vous déconnecter de votre compte ?",
      "slyb": "Oui",
      "slnb": "Non",
      "sdh": "Êtes-vous sûr de vouloir supprimer votre compte ?",
      "sdsub": "Cela effacera définitivement toutes vos données. Cette action est irréversible.",
      "sdstostm": "✅ Votre compte a été supprimé et toutes les données effacées.",
      "srsm":
      "Votre abonnement a été restauré avec succès. Votre puissance de minage est active et vous pouvez continuer à gagner sans aucune interruption.",
      "snasfua": "Aucun abonnement actif trouvé pour votre compte.",

      // Edit Profile
      "epn": "Nom",
      "epne": "Veuillez entrer votre nom complet",
      "epe": "E-mail",
      "epee": "Entrez une adresse e-mail valide",
      "epp": "Numéro de Téléphone",
      "eppe": "Entrez un numéro de téléphone valide",
      "epu": "Mettre à jour",

      // Withdraw BTC
      "wbera": "Entrer l'Adresse du Destinataire",
      "wberae": "Veuillez entrer une adresse valide",
      "wbwl": "Limite de retrait : @limit BTC",
      "wbwle": "Vous devez avoir au moins @limitError BTC pour retirer.",
      "wbpb": "Continuer",
      "wbwh": "Historique des Retraits",
      "wbydhapy": "Vous n'avez pas encore d'historique de paiement.",
      "wbcp": "Vous n'avez pas encore de forfait.",

      // Refer Friends
      "rfyrc": "Votre Code de Parrainage",
      "rfcc": "Copier le Code",
      "rfsc": "Partager le Code",
      "rfbr": "Avantages du Parrainage",
      "rfgber": "Obtenez @rBTC BTC pour chaque parrainage",
      "rfyfghbsm": "Vos amis reçoivent d'énormes bonus pour commencer à miner",
      "rfurimyw": "Parrainages illimités – invitez autant de personnes que vous le souhaitez !",
      "rfct":
      "🔐 Rejoignez-moi sur ${AppConfig.appName}\nJ'utilise cette application pour miner du Bitcoin avec des outils sécurisés et performants et un suivi clair des gains. C'est facile de commencer et l'inscription est gratuite.\n🎁 Utilisez mon code d'invitation @referralCode pour recevoir votre bonus instantanément.\n👇 Téléchargez l'application et commencez à miner aujourd'hui :\n👉 @siAppLink",

      // Customer Support
      "csym": "Votre Message",
      "cstymh": "Tapez votre message ici...",
      "csmr": "Le message est obligatoire.",
      "css": "Soumettre",

      // etc
      'srd': "Terminé",
      "epst":
      "Découvrez le minage de Bitcoin sans effort grâce à la technologie avancée de Cloud Mining — n'importe quand, n'importe où.",

      // lock && unlock
      'lPh': "Verrouiller",
      'lPlb': "ACTIVER LE VERROUILLAGE",
      'lPvl': "COFFRE-FORT VERROUILLÉ",
      'lPsc':
      "Canal sécurisé actif. Déverrouillez le coffre-fort maintenant pour réclamer @lockbtc BTC. Verrouillez une fois. Restez serein. Votre Bitcoin reste protégé.",
      "lPbsm": "Vos @lockedbtc BTC minés sont verrouillés en toute sécurité sur un canal protégé.",
      "lptl": "Regardez cette publicité pour sécuriser vos @tolockbtc BTC minés sur un canal sécurisé et crypté.",
      'lUPh': "Déverrouiller",
      'lUPlb': "DÉVERROUILLER LE COFFRE",
      'lUPvl': "COFFRE-FORT DÉVERROUILLÉ",
      'lUPsc':
      "Canal sécurisé engagé. Déverrouillez le coffre-fort maintenant pour accéder à vos @unlockbtc BTC. Accès sécurisé. Contrôle total.",
      'lUPbsm': "Vos @unlockedbtc BTC sont maintenant déverrouillés et prêts à être réclamés.",
      'lUPtl':
      "Regardez cette publicité pour déverrouiller votre coffre et accéder instantanément à vos @tounlockbtc BTC minés.",

      // store info
      "sisa": "Vitesse de Minage :",
      "sip": "Puissance de Minage :",
      "sies": "Boost de Minage :",
      "siods": "Vitesse de Minage",
      "siode": "Puissance de Minage",
      "siodn": "Boost de Minage",
      "siot": "Durée",
      "siodd": "Remise",
      "siodp": "Prix Total",
      "siodop": "Prix Original",
      "siltos": "Obtenez @discount% de réduction",
      "siap": "Activer le Forfait",
      "sisub":
      "Votre abonnement se renouvelle automatiquement selon votre forfait, sauf annulation. Vous pouvez le gérer à tout moment dans Google Play.",
      "sissm": "Votre forfait @name @speed a été activé pour @day jours.",
      "sipsb": "D'accord",
      "siod": "Détails de la Commande",

      // sing page
      "lh": "Hé ! Bon retour 👋 Commençons",
      "lsub": "Connexion rapide et sécurisée avec Google",
      "lcwg": "Continuer avec Google",
      "ltou": "Conditions d'utilisation",
      "lsubText":
      "Cette application ne mine pas de Bitcoin sur votre appareil. Elle simule le minage et vous permet de gérer à distance des mineurs basés sur le cloud.",
      "lrc": "Code de Parrainage",
      "lrsub": "Vous avez un code de parrainage ? Débloquez vos récompenses",
      "lrhint": "Entrer le Code de Parrainage (Optionnel)",
      "lskip": "Passer",
      "lsubmit": "Soumettre",
      "src": "Félicitations",
      "srsubone": "Dans le cadre de notre engagement, nous avons ajouté une récompense gratuite pour vous aider à démarrer ",
      "srsubtwo": " boost de cloud mining sur votre compte !",
      "srls": "C'est parti",
      "srdh": "Regardez cette publicité pour réclamer votre bonus de bienvenue gratuit de @value BTC dans votre portefeuille.",
      "srdnt": "Non merci",
      "cics": "Initialisation du Serveur Cloud",
      "cisc": "Configuration Terminée",
      "cisyr": "Sélectionnez Votre Région",
      "cicr": "Choisir la Région",
      "ci": "Initialisation...",
      "csc": "Tout est prêt ! Votre serveur de cloud mining est prêt dans la région @selectedRegion",
      "cscr": "Vous avez reçu @reward de puissance de cloud mining gratuite pour commencer votre parcours de minage.",
      "cyrs": "Votre serveur de cloud mining sera initialisé en fonction de la région que vous choisissez.",
      "ccb": "Continuer",
      "csre":"⚠️ Choisissez votre région pour continuer",

      // utils
      "watchAdTitle": "Regardez cette publicité pour booster votre puissance de minage à @text pendant @adTime minutes ⚡",
      "watchAdN": "Pas maintenant",
      "watchAdY": "Regarder Maintenant",
      "swadt":"Regardez une publicité pour activer instantanément le cloud mining \nVotre vitesse actuelle : @cs ⛏️",

      // FAQ
      'q1': "Qu'est-ce que le Bitcoin Cloud Mining ?",
      'a1':
      "Le Bitcoin Cloud Mining est une méthode de minage à distance où les utilisateurs louent de la puissance de calcul auprès de centres de données pour miner du Bitcoin. Cela élimine le besoin de matériel physique, de configuration ou de maintenance. Les utilisateurs gagnent des récompenses quotidiennes basées sur le taux de hachage qu'ils achètent. Cela en fait une option pratique et accessible pour quiconque souhaite commencer à miner.",
      'q3': "Puis-je miner du Bitcoin à distance ?",
      'a3':
      "Oui, vous pouvez miner du Bitcoin à distance grâce au cloud mining. Cela vous permet de louer de la puissance de minage auprès de centres de données sans posséder de matériel. Le processus de minage s'exécute sur des serveurs distants et vous recevez des gains quotidiens en Bitcoin basés sur votre taux de hachage acheté.",
      'q4': "Qu'est-ce qu'un Hashrate ?",
      'a4':
      "Le hashrate est la mesure de la puissance de calcul utilisée dans le minage de Bitcoin. Il représente le nombre de calculs (ou « hachages ») qu'un système peut effectuer par seconde pour résoudre des algorithmes complexes. Un hashrate plus élevé signifie un minage plus rapide et de meilleures chances de gagner des récompenses en Bitcoin.",
      'q5': "Peut-on tirer profit du Bitcoin Cloud Mining ?",
      'a5':
      "Oui, avec le bon forfait et une activité de minage constante, le cloud mining de Bitcoin peut générer des gains réguliers. La rentabilité dépend de votre taux de hachage, du prix du BTC et de la durée du minage.",
      'q6': "Est-il possible d'augmenter la vitesse de minage de Bitcoin à distance ?",
      'a6':
      "Oui, en améliorant votre forfait de cloud mining pour un taux de hachage plus élevé, vous pouvez booster votre vitesse de minage et gagner du Bitcoin plus efficacement.",
      'q7': "Combien de temps faudra-t-il pour atteindre la limite de retrait ?",
      'a7':
      "Le temps nécessaire dépend de votre vitesse de minage (hashrate), du type de forfait et de la régularité de votre minage. Avec un hashrate plus élevé et une activité quotidienne, de nombreux utilisateurs atteignent la limite de retrait en quelques semaines ou un mois.",
      'q8': "Le minage de Bitcoin est-il légal ?",
      'a8':
      "Oui, le minage de Bitcoin est légal dans de nombreux pays mais restreint ou interdit dans certains. Vérifiez toujours vos réglementations locales avant de miner.",
      "q0": "Qu'est-ce que CryptoRise Cloud ?",
      "a0":
      "CryptoRise Cloud fait référence au minage de crypto-monnaies basé sur le cloud qui utilise des mineurs ASIC (Application-Specific Integrated Circuit). Plutôt que d'acheter et d'entretenir du matériel coûteux, les utilisateurs peuvent louer de la puissance de minage auprès de centres de données professionnels équipés de machines haute performance optimisées pour le minage de Bitcoin.",
      "q9": "Comment commencer le minage de Bitcoin ?",
      "a9":
      "Pour commencer le minage de Bitcoin, cliquez simplement sur le bouton Démarrer le Minage et le processus commencera automatiquement.",
      "q10": "Puis-je essayer le minage de Bitcoin gratuitement ?",
      "a10":
      " Oui ! Les nouveaux utilisateurs peuvent essayer le minage de BTC gratuitement. Il suffit de s'inscrire, de regarder des publicités et de commencer à miner instantanément.",
    },

    // TODO German Translation
    'de_DE': {
      // home
      "bh": "Home",
      "bu": "Upgrade",
      "bl": "Bestenliste",
      "bs": "Einstellungen",
      "hh": "Hallo, @name",
      "hs": "Geschwindigkeit",
      "ham": "Aktive Miner",
      "hsmn": "Dein Cloud-Mining pausiert, wenn der Timer abläuft. Starte manuell neu, um weiter zu minen.",
      "hsm": "Mining starten",
      "hab": "Aktiver Booster",
      "hdr": "Tägliche Belohnung",
      "hadboost": "Sammeln",
      "hqr": "Schnelle Belohnung",
      "hdqh": "Schnelle Werbebelohnung",
      "hdrcm": "Diese Belohnung wurde bereits abgeholt. Sie wird morgen wieder verfügbar sein.",
      "hqrcm": "Diese Belohnung wurde bereits abgeholt. Sie wird in 4 Stunden wieder verfügbar sein.",

      // store
      "swAdBoost": "Anfordern",
      "spn": "Jetzt upgraden",
      "swab": "Werbung ansehen & Boost",
      "scpeed": "Aktive Geschwindigkeit: ",
      "scfpb": "Kostenloser Geschwindigkeits-Booster",
      "scfs": "Minute",
      "srz": "Belohnungszone 🎉",
      "srct": "Reward Coin",
      "srzst": "Mine kostenlos Bitcoin durch das Abschließen einfacher Aufgaben",
      "srzh": "Belohnungszone",
      "srzhst":
      "Erledige einfache Aufgaben wie Werbung ansehen und Bewertungen hinterlassen, um Belohnungen zu verdienen. Nutze deine Belohnungen, um das Mining kostenlos zu aktivieren – keine Investition erforderlich.",
      "scht": "Lerne RewardCoin kennen – unsere besondere Art, Danke zu sagen, dass du Teil unserer App bist.",
      "scab": "Verfügbares Guthaben",
      "scuscb": "Umwandeln",
      "scone": "1 RewardCoin",
      "scn1":
      "RewardCoin ist eine Bonusbelohnung von uns. Um sie in BTC umzuwandeln, musst du ein auszahlbares Guthaben von @cbtcb BTC haben.",
      "sccer":"Entschuldigung, dein Guthaben reicht nicht aus, um RewardCoin umzuwandeln.",
      "rzar": "Verfügbare Belohnungen",
      "rwt": "Aufgabe:",
      "rwr": "Belohnung:",
      "rwcb": "Anfordern",
      "rwcdb": "Eingelöst",
      "rwcloseb": "Schließen",
      "hbrwd": "Sieh dir diese Werbung an, um eine Bonus-Mining-Belohnung freizuschalten und mehr zu verdienen.\n@reward",
      "wad": "Jetzt ansehen",
      "rat":"Bereit in @atime",
      's1': 'Genieße 100% Laufzeit mit deinem dedizierten Miner – bleibe auch bei Systemausfällen aktiv.',
      's2':
      'Mit dem Abonnieren erklärst du dich mit automatischen Abbuchungen einverstanden. Dein Plan verlängert sich zum gleichen Preis und für die gleiche Dauer, sofern er nicht gekündigt wird. Du stimmst außerdem unseren zu.',


      // wallet
      "wh": "Wallet",

      // setting
      "sp": "Profil",
      "sep": "Profil bearbeiten",
      "sg": "Allgemein",
      "scp": "Aktueller Plan",
      "swb": "BTC auszahlen",
      "srs": "Abonnement wiederherstellen",
      "srcrp": "Belohnungspunkte umwandeln",
      "so": "Sonstiges",
      "srf": "Freunde werben",
      "sl": "Sprache",
      "sru": "Bewerte uns",
      "ss": "Teilen",
      "sas": "Konto & Support",
      "spp": "Datenschutzerklärung",
      "scs": "Kundensupport",
      "slo": "Abmelden",
      "sda": "Konto löschen",
      "sShareText":
      "🔐 Sicher. Zuverlässig. Effizient.\nMine Bitcoin vertrauensvoll mit leistungsstarken Mining-Tools.\n📊 Transparente Gewinnverfolgung\n⚙️ Optimierte Mining-Leistung\n🛡️ Entwickelt mit Fokus auf Sicherheit und Stabilität\n👇 Lade ${AppConfig.appName} herunter und starte noch heute sicher mit dem Mining.\n👉@shareAppLink",
      "sruf": "Wir freuen uns über dein Feedback!",
      "srufText":
      "Danke, dass du Teil der ${AppConfig.appName}-Familie bist 🫶 Wenn dir deine Mining-Reise gefällt, nimm dir bitte einen Moment Zeit, um eine ⭐️-Bewertung zu hinterlassen. Dein Feedback hilft uns, Sicherheit, Leistung und Zuverlässigkeit für alle zu verbessern.",
      "srufsb": "Absenden",
      "slt": "Bist du sicher, dass du dich von deinem Konto abmelden möchtest?",
      "slyb": "Ja",
      "slnb": "Nein",
      "sdh": "Bist du sicher, dass du dein Konto löschen möchtest?",
      "sdsub": "Dies wird all deine Daten dauerhaft löschen. Diese Aktion kann nicht rückgängig gemacht werden.",
      "sdstostm": "✅ Dein Konto wurde gelöscht und alle Daten wurden entfernt.",
      "srsm":
      "Dein Abonnement wurde erfolgreich wiederhergestellt. Deine Mining-Power ist aktiv und du kannst ohne Unterbrechungen weiter verdienen.",
      "snasfua": "Kein aktives Abonnement in deinem Konto gefunden.",

      // Edit Profile
      "epn": "Name",
      "epne": "Bitte gib deinen vollständigen Namen ein",
      "epe": "E-Mail",
      "epee": "Gib eine gültige E-Mail-Adresse ein",
      "epp": "Telefonnummer",
      "eppe": "Gib eine gültige Telefonnummer ein",
      "epu": "Aktualisieren",

      // Withdraw BTC
      "wbera": "Empfängeradresse eingeben",
      "wberae": "Bitte gib eine gültige Adresse ein",
      "wbwl": "Auszahlungslimit: @limit BTC",
      "wbwle": "Du musst mindestens @limitError BTC für eine Auszahlung haben.",
      "wbpb": "Fortfahren",
      "wbwh": "Auszahlungshistorie",
      "wbydhapy": "Du hast noch keine Auszahlungshistorie.",
      "wbcp": "Du hast noch keinen Plan.",

      // Refer Friends
      "rfyrc": "Dein Empfehlungscode",
      "rfcc": "Code kopieren",
      "rfsc": "Code teilen",
      "rfbr": "Vorteile von Empfehlungen",
      "rfgber": "Erhalte @rBTC BTC für jede Empfehlung",
      "rfyfghbsm": "Deine Freunde erhalten riesige Boni zum Starten des Minings",
      "rfurimyw": "Unbegrenzte Empfehlungen – lade so viele ein, wie du willst!",
      "rfct":
      "🔐 Mach mit bei ${AppConfig.appName}\nIch nutze diese App, um Bitcoin mit sicheren, leistungsstarken Tools und klarer Gewinnverfolgung zu minen. Der Einstieg ist einfach und die Teilnahme kostenlos.\n🎁 Nutze meinen Einladungscode @referralCode, um sofort deinen Bonus zu erhalten.\n👇 Lade die App herunter und starte noch heute mit dem Mining:\n👉 @siAppLink",

      // Customer Support
      "csym": "Deine Nachricht",
      "cstymh": "Gib deine Nachricht hier ein...",
      "csmr": "Nachricht ist erforderlich.",
      "css": "Absenden",

      // etc
      'srd': "Erledigt",
      "epst":
      "Erlebe müheloses Bitcoin-Mining mit fortschrittlicher Cloud-Mining-Technologie – jederzeit und überall.",

      // lock && unlock
      'lPh': "Sperren",
      'lPlb': "SPERRE AKTIVIEREN",
      'lPvl': "TRESOR GESPERRT",
      'lPsc':
      "Sicherer Kanal aktiv. Entsperre den Tresor jetzt, um @lockbtc BTC zu beanspruchen. Einmal sperren. Immer entspannt sein. Dein Bitcoin bleibt geschützt.",
      "lPbsm": "Deine geminten @lockedbtc BTC sind sicher auf einem verschlüsselten Kanal gesperrt.",
      "lptl": "Sieh dir diese Werbung an, um deine geminten @tolockbtc BTC auf einem sicheren, verschlüsselten Kanal zu sichern.",
      'lUPh': "Entsperren",
      'lUPlb': "TRESOR ENTSPERREN",
      'lUPvl': "TRESOR ENTSPERRT",
      'lUPsc':
      "Sicherer Kanal verbunden. Entsperre den Tresor jetzt, um auf deine @unlockbtc BTC zuzugreifen. Sicherer Zugang. Volle Kontrolle.",
      'lUPbsm': "Deine @unlockedbtc BTC sind jetzt entsperrt und bereit zur Beanspruchung.",
      'lUPtl':
      "Sieh dir diese Werbung an, um deinen Tresor zu entsperren und sofort auf deine geminten @tounlockbtc BTC zuzugreifen.",

      // store info
      "sisa": "Mining-Geschwindigkeit:",
      "sip": "Mining-Power:",
      "sies": "Mining-Boost:",
      "siods": "Mining-Geschwindigkeit",
      "siode": "Mining-Power",
      "siodn": "Mining-Boost",
      "siot": "Dauer",
      "siodd": "Rabatt",
      "siodp": "Gesamtpreis",
      "siodop": "Originalpreis",
      "siltos": "Erhalte @discount% Rabatt",
      "siap": "Plan aktivieren",
      "sisub":
      "Dein Abonnement verlängert sich automatisch gemäß deinem Plan, sofern du nicht kündigst. Du kannst es jederzeit in Google Play verwalten.",
      "sissm": "Dein @name-Plan @speed wurde für @day Tage aktiviert.",
      "sipsb": "Okay",
      "siod": "Bestelldetails",

      // sing page
      "lh": "Hey! Willkommen zurück 👋 Lass uns anfangen",
      "lsub": "Schnelle und sichere Anmeldung mit Google",
      "lcwg": "Weiter mit Google",
      "ltou": "Nutzungsbedingungen",
      "lsubText":
      "Diese App mint kein Bitcoin auf deinem Gerät. Sie simuliert das Mining und ermöglicht es dir, Cloud-basierte Miner aus der Ferne zu verwalten.",
      "lrc": "Empfehlungscode",
      "lrsub": "Hast du einen Empfehlungscode? Schalte deine Belohnungen frei",
      "lrhint": "Empfehlungscode eingeben (Optional)",
      "lskip": "Überspringen",
      "lsubmit": "Absenden",
      "src": "Glückwunsch",
      "srsubone": "Als Teil unseres Engagements haben wir eine kostenlose Belohnung hinzugefügt, um dir den Einstieg zu erleichtern: ",
      "srsubtwo": " Cloud-Mining-Boost für dein Konto!",
      "srls": "Lass uns starten",
      "srdh": "Sieh dir diese Werbung an, um deinen kostenlosen Willkommensbonus von @value BTC in deiner Wallet zu beanspruchen.",
      "srdnt": "Nein danke",
      "cics": "Initialisierung des Cloud-Servers",
      "cisc": "Einrichtung abgeschlossen",
      "cisyr": "Wähle deine Region",
      "cicr": "Region wählen",
      "ci": "Initialisierung...",
      "csc": "Alles erledigt! Dein Cloud-Mining-Server ist in der Region @selectedRegion bereit",
      "cscr": "Du hast @reward kostenlose Cloud-Mining-Power erhalten, um deine Mining-Reise zu beginnen.",
      "cyrs": "Dein Cloud-Mining-Server wird basierend auf der von dir gewählten Region initialisiert.",
      "ccb": "Weiter",
      "csre":"⚠️ Wähle deine Region, um fortzufahren",

      // utils
      "watchAdTitle": "Sieh dir diese Werbung an, um deine Mining-Power für @adTime Minuten auf @text zu boosten ⚡",
      "watchAdN": "Nicht jetzt",
      "watchAdY": "Jetzt ansehen",
      "swadt":"Schau dir eine Anzeige an, um Cloud-Mining sofort zu aktivieren \nDeine aktuelle Geschwindigkeit: @cs ⛏️",

      // FAQ
      'q1': "Was ist Bitcoin Cloud Mining?",
      'a1':
      "Bitcoin Cloud Mining ist eine Remote-Mining-Methode, bei der Benutzer Rechenleistung von Rechenzentren mieten, um Bitcoin zu minen. Es macht physische Hardware, Einrichtung oder Wartung überflüssig. Benutzer verdienen tägliche Belohnungen basierend auf der Hashrate, die sie kaufen. Dies macht es zu einer bequemen und zugänglichen Option für jeden, um mit dem Mining zu beginnen.",
      'q3': "Kann ich Bitcoin aus der Ferne minen?",
      'a3':
      "Ja, du kannst Bitcoin über Cloud Mining aus der Ferne minen. Dies ermöglicht es dir, Mining-Power von Rechenzentren zu mieten, ohne eigene Hardware zu besitzen. Der Mining-Prozess läuft auf Remote-Servern, und du erhältst tägliche Bitcoin-Einnahmen basierend auf deiner gekauften Hashrate.",
      'q4': "Was ist eine Hashrate?",
      'a4':
      "Die Hashrate ist das Maß für die Rechenleistung, die beim Bitcoin-Mining verwendet wird. Sie gibt an, wie viele Berechnungen (oder „Hashes“) ein System pro Sekunde durchführen kann, um komplexe Algorithmen zu lösen. Eine höhere Hashrate bedeutet schnelleres Mining und eine bessere Chance, Bitcoin-Belohnungen zu verdienen.",
      'q5': "Kann man mit Bitcoin Cloud Mining Gewinn erzielen?",
      'a5':
      "Ja, mit dem richtigen Plan und konsistenter Mining-Aktivität kann Bitcoin Cloud Mining stetige Einnahmen generieren. Die Rentabilität hängt von deiner Hashrate, dem BTC-Preis und der Mining-Dauer ab.",
      'q6': "Ist es möglich, die Remote-Bitcoin-Mining-Geschwindigkeit zu erhöhen?",
      'a6':
      "Ja, indem du deinen Cloud-Mining-Plan auf eine höhere Hashrate upgradest, kannst du deine Mining-Geschwindigkeit steigern und Bitcoin effizienter verdienen.",
      'q7': "Wie lange dauert es, bis das Auszahlungslimit erreicht ist?",
      'a7':
      "Die benötigte Zeit hängt von deiner Mining-Geschwindigkeit (Hashrate), dem Plantyp und der Konsistenz deines Minings ab. Bei einer höheren Hashrate und täglicher Aktivität erreichen viele Benutzer das Auszahlungslimit innerhalb weniger Wochen bis zu einem Monat.",
      'q8': "Ist Bitcoin-Mining legal?",
      'a8':
      "Ja, Bitcoin-Mining ist in vielen Ländern legal, aber in einigen eingeschränkt oder verboten. Überprüfe immer deine lokalen Vorschriften, bevor du mit dem Mining beginnst.",
      "q0": "Was ist eine CryptoRise Cloud?",
      "a0":
      "Eine CryptoRise Cloud bezieht sich auf Cloud-basiertes Kryptowährungs-Mining, das Application-Specific Integrated Circuit (ASIC) Miner nutzt. Anstatt kostspielige Hardware zu kaufen und zu warten, können Benutzer Mining-Power von professionellen Rechenzentren mieten, die mit leistungsstarken, für das Bitcoin-Mining optimierten Maschinen ausgestattet sind.",
      "q9": "Wie beginne ich mit dem Bitcoin-Mining?",
      "a9":
      "Um mit dem Bitcoin-Mining zu beginnen, klicke einfach auf die Schaltfläche 'Mining starten' und der Prozess beginnt automatisch.",
      "q10": "Kann ich Bitcoin-Mining kostenlos ausprobieren?",
      "a10":
      " Ja! Neue Benutzer können BTC-Mining kostenlos ausprobieren. Registriere dich einfach, sieh dir Werbung an und starte sofort mit dem Mining.",
    },

    // TODO Spanish Translation
    'es_ES': {
      // home
      "bh": "Inicio",
      "bu": "Mejorar",
      "bl": "Tabla de clasificación",
      "bs": "Ajustes",
      "hh": "Hola, @name",
      "hs": "Velocidad",
      "ham": "Mineros activos",
      "hsmn": "Tu minería en la nube se detendrá cuando el temporizador termine. Reinicia manualmente para seguir minando.",
      "hsm": "Empezar minería",
      "hab": "Potenciador activo",
      "hdr": "Recompensa diaria",
      "hadboost": "Recoger",
      "hqr": "Recompensa rápida",
      "hdqh": "Recompensa por anuncio rápido",
      "hdrcm": "Esta recompensa ya ha sido recogida. Se reabrirá mañana.",
      "hqrcm": "Esta recompensa ya ha sido recogida. Se reabrirá después de 4 horas.",

      // store
      "swAdBoost": "Reclamar",
      "spn": "Mejorar ahora",
      "swab": "Ver anuncio y potenciar",
      "scpeed": "Velocidad activa: ",
      "scfpb": "Potenciador de velocidad gratis",
      "scfs": "Minuto",
      "srz": "Zona de recompensas 🎉",
      "srct": "Moneda de recompensa",
      "srzst": "Mina Bitcoin gratis completando tareas sencillas",
      "srzh": "Zona de recompensas",
      "srzhst":
      "Completa tareas sencillas como ver anuncios y dejar reseñas para ganar recompensas. Usa tus recompensas para activar la minería sin costo, sin necesidad de inversión.",
      "scht": "Conoce RewardCoin: nuestra forma especial de darte las gracias por formar parte de nuestra aplicación.",
      "scab": "Saldo disponible",
      "scuscb": "Convertir",
      "scone": "1 RewardCoin",
      "scn1":
      "RewardCoin es una recompensa de bonificación nuestra. Para convertirla a BTC, debes tener un saldo de BTC de @cbtcb retirable.",
      "sccer":"Lo sentimos, no tienes saldo suficiente para convertir RewardCoin.",
      "rzar": "Recompensas disponibles",
      "rwt": "Tarea:",
      "rwr": "Recompensa:",
      "rwcb": "Reclamar",
      "rwcdb": "Reclamado",
      "rwcloseb": "Cerrar",
      "hbrwd": "Mira este anuncio para desbloquear una bonificación de minería y ganar más.\n@reward",
      "wad": "Ver ahora",
      "rat":"Listo en @atime",
      's1': 'Disfruta de un tiempo de actividad del 100% con tu minero dedicado: mantente activo incluso durante las caídas del sistema.',
      's2':
      'Al suscribirte, aceptas los cargos automáticos. Tu plan se renueva al mismo precio y duración a menos que se cancele. También aceptas nuestra',


      // wallet
      "wh": "Billetera",

      // setting
      "sp": "Perfil",
      "sep": "Editar perfil",
      "sg": "General",
      "scp": "Plan actual",
      "swb": "Retirar BTC",
      "srs": "Restaurar suscripción",
      "srcrp": "Convertir puntos de recompensa",
      "so": "Otros",
      "srf": "Referir amigos",
      "sl": "Idioma",
      "sru": "Califícanos",
      "ss": "Compartir",
      "sas": "Cuenta y soporte",
      "spp": "Política de privacidad",
      "scs": "Atención al cliente",
      "slo": "Cerrar sesión",
      "sda": "Eliminar cuenta",
      "sShareText":
      "🔐 Seguro. Fiable. Eficiente.\nMina Bitcoin con confianza usando herramientas de minería de alto rendimiento.\n📊 Seguimiento transparente de ganancias\n⚙️ Rendimiento de minería optimizado\n🛡️ Construido con la seguridad y estabilidad en mente\n👇 Descarga ${AppConfig.appName} y comienza a minar de forma segura hoy mismo.\n👉@shareAppLink",
      "sruf": "¡Nos encantaría conocer tu opinión!",
      "srufText":
      "Gracias por formar parte de la familia ${AppConfig.appName} 🫶 Si estás disfrutando de tu viaje minero, por favor tómate un momento para dejar una calificación de ⭐️. Tu opinión nos ayuda a mejorar la seguridad, el rendimiento y la fiabilidad para todos.",
      "srufsb": "Enviar",
      "slt": "¿Estás seguro de que quieres cerrar sesión?",
      "slyb": "Sí",
      "slnb": "No",
      "sdh": "¿Estás seguro de que quieres eliminar tu cuenta?",
      "sdsub": "Esto borrará permanentemente todos tus datos. Esta acción no se puede deshacer.",
      "sdstostm": "✅ Tu cuenta ha sido eliminada y todos los datos borrados.",
      "srsm":
      "Tu suscripción se ha restaurado correctamente. Tu potencia de minería ha subido y puedes seguir ganando sin interrupciones.",
      "snasfua": "No se encontró ninguna suscripción activa en tu cuenta.",

      // Edit Profile
      "epn": "Nombre",
      "epne": "Por favor, introduce tu nombre completo",
      "epe": "Correo electrónico",
      "epee": "Introduce un correo electrónico válido",
      "epp": "Número de teléfono",
      "eppe": "Introduce un número de teléfono válido",
      "epu": "Actualizar",

      // Withdraw BTC
      "wbera": "Introduce la dirección del destinatario",
      "wberae": "Por favor, introduce una dirección válida",
      "wbwl": "Límite de retiro: @limit BTC",
      "wbwle": "Debes tener al menos @limitError BTC para retirar.",
      "wbpb": "Continuar",
      "wbwh": "Historial de retiros",
      "wbydhapy": "Aún no tienes historial de pagos.",
      "wbcp": "Aún no tienes un plan.",

      // Refer Friends
      "rfyrc": "Tu código de referido",
      "rfcc": "Copiar código",
      "rfsc": "Compartir código",
      "rfbr": "Beneficios de los referidos",
      "rfgber": "Consigue @rBTC BTC por cada referido",
      "rfyfghbsm": "Tus amigos obtienen grandes bonificaciones para empezar a minar",
      "rfurimyw": "Referidos ilimitados: ¡invita a todos los que quieras!",
      "rfct":
      "🔐 Únete a mí en ${AppConfig.appName}\nEstoy usando esta app para minar Bitcoin con herramientas seguras de alto rendimiento y seguimiento de ganancias claro. Es fácil empezar y gratis unirse.\n🎁 Usa mi código de invitación @referralCode para recibir tu bono al instante.\n👇 Descarga la app y empieza a minar hoy mismo:\n👉 @siAppLink",

      // Customer Support
      "csym": "Tu mensaje",
      "cstymh": "Escribe tu mensaje aquí...",
      "csmr": "El mensaje es obligatorio.",
      "css": "Enviar",

      // etc
      'srd': "Hecho",
      "epst":
      "Experimenta la minería de Bitcoin sin esfuerzo con la tecnología avanzada de minería en la nube, en cualquier momento y en cualquier lugar.",

      // lock && unlock
      'lPh': "Bloquear",
      'lPlb': "ACTIVAR BLOQUEO",
      'lPvl': "BÓVEDA BLOQUEADA",
      'lPsc':
      "Canal seguro activo. Desbloquea la bóveda ahora para reclamar @lockbtc BTC. Bloquea una vez. Relájate siempre. Tu Bitcoin permanece protegido.",
      "lPbsm": "Tus @lockedbtc BTC minados están bloqueados de forma segura en un canal seguro.",
      "lptl": "Mira este anuncio para asegurar tus @tolockbtc BTC minados en un canal seguro y encriptado.",
      'lUPh': "Desbloquear",
      'lUPlb': "DESBLOQUEAR BÓVEDA",
      'lUPvl': "BÓVEDA DESBLOQUEADA",
      'lUPsc':
      "Canal seguro activado. Desbloquea la bóveda ahora para acceder a tus @unlockbtc BTC. Acceso seguro. Control total.",
      'lUPbsm': "Tus @unlockedbtc BTC ya están desbloqueados y listos para reclamar.",
      'lUPtl':
      "Mira este anuncio para desbloquear tu bóveda y acceder a tus @tounlockbtc BTC minados al instante.",

      // store info
      "sisa": "Velocidad de minería:",
      "sip": "Potencia de minería:",
      "sies": "Potenciador de minería:",
      "siods": "Velocidad de minería",
      "siode": "Potencia de minería",
      "siodn": "Potenciador de minería",
      "siot": "Duración",
      "siodd": "Descuento",
      "siodp": "Precio total",
      "siodop": "Precio original",
      "siltos": "Consigue un @discount% de descuento",
      "siap": "Activar plan",
      "sisub":
      "Tu suscripción se renueva automáticamente según tu plan, a menos que la canceles. Puedes gestionarla en cualquier momento en Google Play.",
      "sissm": "Tu plan @name @speed ha sido activado por @day días.",
      "sipsb": "Aceptar",
      "siod": "Detalles del pedido",

      // sing page
      "lh": "¡Hola! Bienvenido de nuevo 👋 Empecemos",
      "lsub": "Inicio de sesión rápido y seguro con Google",
      "lcwg": "Continuar con Google",
      "ltou": "Términos de uso",
      "lsubText":
      "Esta aplicación no mina Bitcoin en tu dispositivo. Simula la minería y te permite gestionar de forma remota mineros basados en la nube.",
      "lrc": "Código de referido",
      "lrsub": "¿Tienes un código de referido? Desbloquea tus recompensas",
      "lrhint": "Introduce el código de referido (Opcional)",
      "lskip": "Saltar",
      "lsubmit": "Enviar",
      "src": "¡Felicidades!",
      "srsubone": "Como parte de nuestro compromiso, hemos añadido una recompensa gratuita para que empieces: ",
      "srsubtwo": " ¡potenciador de minería en la nube a tu cuenta!",
      "srls": "Vamos a empezar",
      "srdh": "Mira este anuncio para reclamar tu bono de bienvenida de @value BTC gratis en tu billetera.",
      "srdnt": "No, gracias",
      "cics": "Inicializando servidor en la nube",
      "cisc": "Configuración completada",
      "cisyr": "Selecciona tu región",
      "cicr": "Elegir región",
      "ci": "Inicializando...",
      "csc": "¡Todo listo! Tu servidor de minería en la nube está listo en la región @selectedRegion",
      "cscr": "Has recibido @reward de potencia de minería en la nube gratis para empezar tu viaje.",
      "cyrs": "Tu servidor de minería en la nube se inicializará según la región que elijas.",
      "ccb": "Continuar",
      "csre":"⚠️ Elige tu región para continuar",

      // utils
      "watchAdTitle": "Mira este anuncio para potenciar tu minería a @text durante @adTime minutos ⚡",
      "watchAdN": "Ahora no",
      "watchAdY": "Ver ahora",
      "swadt":"Mira un anuncio para activar la minería en la nube al instante \nTu velocidad actual: @cs ⛏️",

      // FAQ
      'q1': "¿Qué es la minería de Bitcoin en la nube?",
      'a1':
      "La minería de Bitcoin en la nube es un método de minería remota donde los usuarios alquilan potencia de computación de centros de datos para minar Bitcoin. Elimina la necesidad de hardware físico, configuración o mantenimiento. Los usuarios ganan recompensas diarias basadas en la tasa de hash que compran. Esto lo convierte en una opción conveniente y accesible para que cualquiera empiece a minar.",
      'q3': "¿Puedo minar Bitcoin de forma remota?",
      'a3':
      "Sí, puedes minar Bitcoin de forma remota a través de la minería en la nube. Esto te permite alquilar potencia de minería de centros de datos sin poseer hardware. El proceso de minería se ejecuta en servidores remotos y recibes ganancias diarias de Bitcoin basadas en la tasa de hash comprada.",
      'q4': "¿Qué es el Hashrate?",
      'a4':
      "El hashrate es la medida de la potencia de computación utilizada en la minería de Bitcoin. Representa cuántos cálculos (o 'hashes') puede realizar un sistema por segundo para resolver algoritmos complejos. Un hashrate más alto significa una minería más rápida y una mejor oportunidad de ganar recompensas de Bitcoin.",
      'q5': "¿Se puede obtener beneficios con la minería en la nube?",
      'a5':
      "Sí, con el plan adecuado y una actividad de minería constante, la minería en la nube puede generar ganancias constantes. La rentabilidad depende de tu tasa de hash, el precio de BTC y la duración de la minería.",
      'q6': "¿Es posible aumentar la velocidad de minería remota?",
      'a6':
      "Sí, al mejorar tu plan de minería en la nube a una tasa de hash más alta, puedes potenciar tu velocidad y ganar Bitcoin de manera más eficiente.",
      'q7': "¿Cuánto tiempo se tarda en alcanzar el límite de retiro?",
      'a7':
      "El tiempo depende de tu velocidad de minería (hashrate), tipo de plan y la constancia. Con un hashrate alto y actividad diaria, muchos usuarios alcanzan el límite en unas pocas semanas o un mes.",
      'q8': "¿Es legal la minería de Bitcoin?",
      'a8':
      "Sí, la minería de Bitcoin es legal en muchos países, pero está restringida o prohibida en algunos. Consulta siempre las regulaciones locales antes de minar.",
      "q0": "¿Qué es CryptoRise Cloud?",
      "a0":
      "CryptoRise Cloud se refiere a la minería de criptomonedas basada en la nube que aprovecha mineros ASIC. En lugar de comprar y mantener hardware costoso, los usuarios pueden alquilar potencia de centros de datos profesionales equipados con máquinas de alto rendimiento optimizadas para la minería de Bitcoin.",
      "q9": "¿Cómo empiezo a minar Bitcoin?",
      "a9":
      "Para empezar a minar Bitcoin, simplemente haz clic en el botón 'Empezar minería' y el proceso comenzará automáticamente.",
      "q10": "¿Puedo probar la minería de Bitcoin gratis?",
      "a10":
      " ¡Sí! Los nuevos usuarios pueden probar la minería de BTC gratis. Solo regístrate, mira anuncios y empieza a minar al instante.",
    },

    // TODO Swahili Translation
    'sw_KE': {
      // home
      "bh": "Nyumbani",
      "bu": "Boresha",
      "bl": "Wanaoongoza",
      "bs": "Mipangilio",
      "hh": "Habari, @name",
      "hs": "Kasi",
      "ham": "Wachimba Migodi Amilifu",
      "hsmn": "Uchimba migodi wako wa cloud utasimama wakati muda utakapoisha. Anzisha upya mwenyewe ili kuendelea na uchimbaji.",
      "hsm": "Anza Kuchimba",
      "hab": "Booster Amilifu",
      "hdr": "Tuzo ya Kila Siku",
      "hadboost": "Kusanya",
      "hqr": "Tuzo ya Haraka",
      "hdqh": "Tuzo ya Matangazo ya Haraka",
      "hdrcm": "Tuzo hii tayari imekusanywa. Itafunguliwa tena kesho.",
      "hqrcm": "Tuzo hii tayari imekusanywa. Itafunguliwa tena baada ya saa 4.",

      // store
      "swAdBoost": "Dai",
      "spn": "Boresha Sasa",
      "swab": "Tazama Tangazo & Ongeza Kasi",
      "scpeed": "Kasi Amilifu: ",
      "scfpb": "Ongezeko la Kasi la Bure",
      "scfs": "Dakika",
      "srz": "Eneo la Tuzo 🎉",
      "srct": "Reward Coin",
      "srzst": "Chimba Bitcoin bure kwa kukamilisha kazi rahisi",
      "srzh": "Eneo la Tuzo",
      "srzhst":
      "Kamilisha kazi rahisi kama kutazama matangazo na kuacha maoni ili upate Tuzo. Tumia Tuzo zako kuamsha uchimbaji bila malipo—hakuna uwekezaji unaohitajika.",
      "scht": "Kutana na RewardCoin — njia yetu maalum ya kusema asante kwa kuwa sehemu ya programu yetu.",
      "scab": "Salio Linalopatikana",
      "scuscb": "Badilisha",
      "scone": "1 RewardCoin",
      "scn1":
      "RewardCoin ni tuzo ya ziada kutoka kwetu. Ili kuibadilisha kuwa BTC, lazima uwe na salio la BTC la @cbtcb linaloweza kutolewa.",
      "sccer":"Samahani, huna salio la kutosha kubadilisha RewardCoin.",
      "rzar": "Tuzo Zinazopatikana",
      "rwt": "Kazi:",
      "rwr": "Tuzo:",
      "rwcb": "Dai",
      "rwcdb": "Imedaiwa",
      "rwcloseb": "Funga",
      "hbrwd": "Tazama tangazo hili ili kufungua tuzo ya ziada ya uchimbaji na upate zaidi.\n@reward",
      "wad": "Tazama Sasa",
      "rat":"Tayari baada ya @atime",
      's1': 'Furahia upatikanaji wa 100% na mchimba migodi wako maalum—endelea kuwa amilifu hata wakati wa hitilafu za mfumo.',
      's2':
      'Kwa kujiandikisha, unakubali makato ya kiotomatiki. Mpango wako utajifanya upya kwa bei na muda ule ule isipokuwa ughairi. Pia unakubaliana na yetu',


      // wallet
      "wh": "Mkoba",

      // setting
      "sp": "Wasifu",
      "sep": "Hariri Wasifu",
      "sg": "Jumla",
      "scp": "Mpango wa Sasa",
      "swb": "Toa BTC",
      "srs": "Rejesha Usajili",
      "srcrp": "Badilisha Pointi za Tuzo",
      "so": "Nyingine",
      "srf": "Pendekeza Marafiki",
      "sl": "Lugha",
      "sru": "Tupe Nyota",
      "ss": "Shiriki",
      "sas": "Akaunti & Usaidizi",
      "spp": "Sera ya Faragha",
      "scs": "Usaidizi kwa Wateja",
      "slo": "Ondoka",
      "sda": "Futa Akaunti",
      "sShareText":
      "🔐 Salama. Inaaminika. Inafanya kazi vizuri.\nChimba Bitcoin kwa ujasiri ukitumia zana za uchimbaji zenye utendaji wa juu.\n📊 Ufuatiliaji wa mapato ulio wazi\n⚙️ Utendaji wa uchimbaji ulioboreshwa\n🛡️ Imeundwa kwa kuzingatia usalama na uthabiti\n👇 Pakua ${AppConfig.appName} na uanze kuchimba kwa usalama leo.\n👉@shareAppLink",
      "sruf": "Tungependa kupata maoni yako!",
      "srufText":
      "Asante kwa kuwa sehemu ya familia ya ${AppConfig.appName} 🫶 Ikiwa unafurahia safari yako ya uchimbaji, tafadhali chukua muda kutupa tathmini ya ⭐️. Maoni yako yanatusaidia kuboresha usalama, utendaji, na uaminifu kwa kila mtu.",
      "srufsb": "Wasilisha",
      "slt": "Je, una uhakika unataka kuondoka kwenye akaunti yako?",
      "slyb": "Ndiyo",
      "slnb": "Hapana",
      "sdh": "Je, una uhakika unataka kufuta akaunti yako?",
      "sdsub": "Hii itafuta data zako zote kabisa. Kitendo hiki hakiwezi kutenguliwa.",
      "sdstostm": "✅ Akaunti yako imefutwa na data zote zimeondolewa.",
      "srsm":
      "Usajili wako umerejeshwa kwa mafanikio. Nguvu yako ya uchimbaji imepanda, na unaweza kuendelea kupata mapato bila usumbufu wowote.",
      "snasfua": "Hakuna usajili amilifu uliopatikana kwenye akaunti yako.",

      // Edit Profile
      "epn": "Jina",
      "epne": "Tafadhali ingiza jina lako kamili",
      "epe": "Barua Pepe",
      "epee": "Ingiza barua pepe sahihi",
      "epp": "Namba ya Simu",
      "eppe": "Ingiza namba ya simu sahihi",
      "epu": "Sasisha",

      // Withdraw BTC
      "wbera": "Ingiza Anwani ya Mpokeaji",
      "wberae": "Tafadhali ingiza anwani sahihi",
      "wbwl": "Kikomo cha kutoa: @limit BTC",
      "wbwle": "Lazima uwe na angalau @limitError BTC ili kutoa.",
      "wbpb": "Endelea",
      "wbwh": "Historia ya Kutoa",
      "wbydhapy": "Bado huna historia ya malipo.",
      "wbcp": "Bado huna mpango.",

      // Refer Friends
      "rfyrc": "Nambari yako ya Rufaa",
      "rfcc": "Nakili Nambari",
      "rfsc": "Shiriki Nambari",
      "rfbr": "Faida za Rufaa",
      "rfgber": "Pata @rBTC BTC kwa kila rufaa",
      "rfyfghbsm": "Marafiki zako wanapata bonasi kubwa kuanza uchimbaji",
      "rfurimyw": "Rufaa zisizo na kikomo – mualike yeyote unayetaka!",
      "rfct":
      "🔐 Jiunge nami kwenye ${AppConfig.appName}\nNatumia programu hii kuchimba Bitcoin kwa zana salama, zenye utendaji wa juu na ufuatiliaji wazi wa mapato. Ni rahisi kuanza na ni bure kujiunga.\n🎁 Tumia nambari yangu ya mwaliko @referralCode kupokea bonasi yako papo hapo.\n👇 Pakua programu na uanze kuchimba leo:\n👉 @siAppLink",

      // Customer Support
      "csym": "Ujumbe Wako",
      "cstymh": "Andika ujumbe wako hapa...",
      "csmr": "Ujumbe unahitajika.",
      "css": "Wasilisha",

      // etc
      'srd': "Imekamilika",
      "epst":
      "Pata uzoefu wa uchimbaji wa Bitcoin bila juhudi ukitumia teknolojia ya hali ya juu ya Cloud Mining — Wakati wowote, Mahali popote.",

      // lock && unlock
      'lPh': "Funga",
      'lPlb': "WASHA KUFUNGUA",
      'lPvl': "VAULT IMEFUNGWA",
      'lPsc':
      "Njia salama imewashwa. Fungua vault sasa ili kudai @lockbtc BTC. Funga mara moja. Tulia kila wakati. Bitcoin yako inabaki salama.",
      "lPbsm": "Bitcoin zako @lockedbtc ulizochimba zimefungwa kwa usalama kwenye njia iliyosimbwa.",
      "lptl": "Tazama tangazo hili ili kulinda Bitcoin zako @tolockbtc ulizochimba kwenye njia salama na iliyosimbwa.",
      'lUPh': "Fungua",
      'lUPlb': "FUNGUA VAULT",
      'lUPvl': "VAULT IMEFUNGULIWA",
      'lUPsc':
      "Njia salama imeunganishwa. Fungua vault sasa ili kufikia @unlockbtc BTC zako. Ufikiaji salama. Udhibiti kamili.",
      'lUPbsm': "Bitcoin zako @unlockedbtc sasa zimefunguliwa na zipo tayari kudaiwa.",
      'lUPtl':
      "Tazama tangazo hili ili kufungua vault yako na kufikia Bitcoin zako @tounlockbtc ulizochimba papo hapo.",

      // store info
      "sisa": "Kasi ya Uchimbaji:",
      "sip": "Nguvu ya Uchimbaji:",
      "sies": "Ongezeko la Uchimbaji:",
      "siods": "Kasi ya Uchimbaji",
      "siode": "Nguvu ya Uchimbaji",
      "siodn": "Ongezeko la Uchimbaji",
      "siot": "Muda",
      "siodd": "Punguzo",
      "siodp": "Bei Jumla",
      "siodop": "Bei ya Awali",
      "siltos": "Pata Punguzo la @discount%",
      "siap": "Amalisha Mpango",
      "sisub":
      "Usajili wako unajifanya upya kiotomatiki kulingana na mpango wako, isipokuwa ughairi. Unaweza kuudhibiti wakati wowote kwenye Google Play.",
      "sissm": "Mpango wako wa @name @speed umeamshwa kwa siku @day.",
      "sipsb": "Sawa",
      "siod": "Maelezo ya Agizo",

      // sing page
      "lh": "Habari! Karibu tena 👋 Tuanze",
      "lsub": "Ingia haraka na salama kwa Google",
      "lcwg": "Endelea na Google",
      "ltou": "Masharti ya Matumizi",
      "lsubText":
      "Programu hii haichimbi Bitcoin kwenye kifaa chako. Inaiga uchimbaji na inakuwezesha kudhibiti wachimbaji wa cloud kwa mbali.",
      "lrc": "Nambari ya Rufaa",
      "lrsub": "Una nambari ya rufaa? Fungua tuzo zako",
      "lrhint": "Ingiza Nambari ya Rufaa (Hiari)",
      "lskip": "Ruka",
      "lsubmit": "Wasilisha",
      "src": "Hongera",
      "srsubone": "Kama sehemu ya ahadi yetu, tumeongeza tuzo ya bure ili uanze ",
      "srsubtwo": " ongezeko la uchimbaji wa cloud kwenye akaunti yako!",
      "srls": "Tuanze",
      "srdh": "Tazama tangazo hili ili kudai bonasi yako ya bure ya kukaribishwa ya @value BTC kwenye mkoba wako.",
      "srdnt": "Hapana asante",
      "cics": "Inaanzisha Seva ya Cloud",
      "cisc": "Usanidi Umekamilika",
      "cisyr": "Chagua Eneo Lako",
      "cicr": "Chagua Eneo",
      "ci": "Inaanzisha...",
      "csc": "Yote yamekamilika! Seva yako ya uchimbaji wa cloud iko tayari katika eneo la @selectedRegion",
      "cscr": "Umepokea @reward ya nguvu ya bure ya uchimbaji wa cloud ili kuanza safari yako ya uchimbaji.",
      "cyrs": "Seva yako ya uchimbaji wa cloud itaanzishwa kulingana na eneo unalochagua.",
      "ccb": "Endelea",
      "csre":"⚠️ Chagua eneo lako ili kuendelea",

      // utils
      "watchAdTitle": "Tazama tangazo hili ili kuongeza nguvu yako ya uchimbaji hadi @text kwa dakika @adTime ⚡",
      "watchAdN": "Si sasa",
      "watchAdY": "Tazama Sasa",
      "swadt":"Tazama tangazo ili uanzishe uchimbaji wa madini kwenye wingu papo hapo \nKasi yako ya sasa: @cs ⛏️",

      // FAQ
      'q1': "Bitcoin Cloud Mining ni nini?",
      'a1':
      "Bitcoin Cloud Mining ni njia ya uchimbaji wa mbali ambapo watumiaji hukodisha nguvu ya kompyuta kutoka kwenye vituo vya data ili kuchimba Bitcoin. Inaondoa hitaji la vifaa vya kimwili, usanidi, au matengenezo. Watumiaji hupata tuzo za kila siku kulingana na hash rate wanayonunua. Hii inafanya kuwa chaguo rahisi na linalofikika kwa yeyote kuanza uchimbaji.",
      'q3': "Je, naweza kuchimba Bitcoin nikiwa mbali?",
      'a3':
      "Ndiyo, unaweza kuchimba Bitcoin ukiwa mbali kupitia cloud mining. Hii inakuwezesha kukodisha nguvu ya uchimbaji kutoka kwenye vituo vya data bila kumiliki vifaa vyovyote. Mchakato wa uchimbaji huendeshwa kwenye seva za mbali, na unapokea mapato ya kila siku ya Bitcoin kulingana na hash rate uliyonunua.",
      'q4': "Hashrate ni nini?",
      'a4':
      "Hashrate ni kipimo cha nguvu ya kompyuta inayotumika katika uchimbaji wa Bitcoin. Inawakilisha ni mahesabu mangapi (au “hashes”) mfumo unaweza kufanya kwa sekunde ili kutatua kanuni tata. Hashrate ya juu inamaanisha uchimbaji wa haraka na nafasi nzuri ya kupata tuzo za Bitcoin.",
      'q5': "Je, unaweza kupata faida kutoka kwa Bitcoin Cloud Mining?",
      'a5':
      "Ndiyo, ukiwa na mpango sahihi na shughuli ya uchimbaji thabiti, uchimbaji wa cloud wa Bitcoin unaweza kuzalisha mapato thabiti. Faida inategemea hash rate yako, bei ya BTC, na muda wa uchimbaji.",
      'q6': "Je, inawezekana kuongeza kasi ya uchimbaji wa mbali wa Bitcoin?",
      'a6':
      "Ndiyo, kwa kuboresha mpango wako wa uchimbaji wa cloud hadi hash rate ya juu, unaweza kuongeza kasi yako ya uchimbaji na kupata Bitcoin kwa ufanisi zaidi.",
      'q7': "Itachukua muda gani kufikia kikomo cha kutoa?",
      'a7':
      "Muda unategemea kasi yako ya uchimbaji (hash rate), aina ya mpango, na jinsi unavyochimba mara kwa mara. Kwa hash rate ya juu na shughuli ya kila siku, watumiaji wengi hufikia kikomo cha kutoa ndani ya wiki chache hadi mwezi mmoja.",
      'q8': "Je, uchimbaji wa Bitcoin ni halali?",
      'a8':
      "Ndiyo, uchimbaji wa Bitcoin ni halali katika nchi nyingi lakini umezuiwa au kupigwa marufuku katika baadhi. Daima kagua kanuni za eneo lako kabla ya kuanza uchimbaji.",
      "q0": "CryptoRise Cloud ni nini?",
      "a0":
      "CryptoRise Cloud inahusu uchimbaji wa sarafu ya kidijitali unaotumia seva za cloud kupitia wachimbaji wa ASIC. Badala ya kununua na kutunza vifaa vya bei ghali, watumiaji wanaweza kukodisha nguvu ya uchimbaji kutoka kwenye vituo vya data vya kitaalamu vilivyo na mashine zenye utendaji wa juu zilizoboreshwa kwa uchimbaji wa Bitcoin.",
      "q9": "Naanzaje uchimbaji wa Bitcoin?",
      "a9":
      "Ili kuanza uchimbaji wa Bitcoin, bonyeza tu kitufe cha Anza Kuchimba na mchakato utaanza kiotomatiki.",
      "q10": "Naweza kujaribu uchimbaji wa Bitcoin bure?",
      "a10":
      " Ndiyo! Watumiaji wapya wanaweza kujaribu uchimbaji wa BTC bure. Jisajili tu, tazama matangazo, na uanze kuchimba papo hapo.",
    },

    // TODO Hausa Translation
    'ha_NG': {
      // home
      "bh": "Gida",
      "bu": "Haɓaka",
      "bl": "Wadanda Suka Fi Kowa",
      "bs": "Saituna",
      "hh": "Sannu, @name",
      "hs": "Gudun Haka",
      "ham": "Masu Haka Masu Aiki",
      "hsmn": "Hakar ku ta yanar gizo (cloud mining) za ta tsaya idan lokaci ya ƙare. Sake farawa da kanku don ci gaba da haka.",
      "hsm": "Fara Haka",
      "hab": "Injin Ƙarfafawa",
      "hdr": "Kyautar Kullum",
      "hadboost": "Karɓa",
      "hqr": "Kyauta Mai Sauri",
      "hdqh": "Kyautar Kallon Talla",
      "hdrcm": "An riga an karɓi wannan kyautar. Za a sake buɗe ta gobe.",
      "hqrcm": "An riga an karɓi wannan kyautar. Za a sake buɗe ta bayan sa'o'i 4.",

      // store
      "swAdBoost": "Karɓa",
      "spn": "Haɓaka Yanzu",
      "swab": "Kalli Talla & Haɓaka",
      "scpeed": "Gudun da Ake Kai: ",
      "scfpb": "Injin Ƙarin Gudu Kyauta",
      "scfs": "Minti",
      "srz": "Wurin Kyauta 🎉",
      "srct": "Reward Coin",
      "srzst": "Sami Bitcoin kyauta ta hanyar kammala ayyuka masu sauƙi",
      "srzh": "Wurin Kyauta",
      "srzhst":
      "Kammala ayyuka masu sauƙi kamar kallon tallace-tallace da barin sharhi don samun Kyauta. Yi amfani da Kyautar ku don fara hakar Bitcoin ba tare da biyan ko sisi ba.",
      "scht": "Sadu da RewardCoin — hanyarmu ta musamman ta nuna godiya gare ku da kuke tare da mu.",
      "scab": "Abin da Ke Akwai",
      "scuscb": "Canzawa",
      "scone": "RewardCoin 1",
      "scn1":
      "RewardCoin kyauta ce daga gare mu. Don canza shi zuwa BTC, dole ne ku kasance kuna da rarar BTC @cbtcb da za a iya cira.",
      "sccer":"Yi haƙuri, rarar ku ba ta isa a canza RewardCoin ba.",
      "rzar": "Kyaututtukan da Ke Akwai",
      "rwt": "Aiki:",
      "rwr": "Kyauta:",
      "rwcb": "Karɓa",
      "rwcdb": "An Karɓa",
      "rwcloseb": "Rufe",
      "hbrwd": "Kalli wannan tallan don buɗe kyautar hakar Bitcoin da samun ƙarin kuɗi.\n@reward",
      "wad": "Kalla Yanzu",
      "rat":"Zai kasance a shirye nan da @atime",
      's1': 'Ji daɗin aiki 100% tare da injin hakar ku na musamman—ku kasance masu aiki koda tsarin ya samu matsala.',
      's2':
      'Ta hanyar biyan kuɗi, kun amince da cire kuɗi ta atomatik. Shirin ku zai sabunta kansa akan farashi da lokaci guda sai dai idan kun fasa. Kun kuma amince da namu',


      // wallet
      "wh": "Wajen Kuɗi",

      // setting
      "sp": "Bayanai",
      "sep": "Gyara Bayanai",
      "sg": "Gabaɗaya",
      "scp": "Shirin Yanzu",
      "swb": "Cire BTC",
      "srs": "Maido da Biyan Kuɗi",
      "srcrp": "Canza Points na Kyauta",
      "so": "Wasu",
      "srf": "Gayyaci Abokai",
      "sl": "Harshe",
      "sru": "Ba Mu Tauraro",
      "ss": "Rarraba",
      "sas": "Asusu & Taimako",
      "spp": "Manufar Sirri",
      "scs": "Sabis na Abokan Ciniki",
      "slo": "Fita",
      "sda": "Goge Asusu",
      "sShareText":
      "🔐 Amintacce. Abin Dogaro. Mai Kyau.\nYi hakar Bitcoin da kwarin gwiwa ta amfani da injina masu ƙarfi.\n📊 Bibiyar kuɗin shiga a sarari\n⚙️ Injin hakar da aka inganta\n🛡️ An gina shi da tsaro da kwanciyar hankali a rai\n👇 Sauke ${AppConfig.appName} kuma fara hakar Bitcoin cikin aminci yanzu.\n👉@shareAppLink",
      "sruf": "Muna son jin ra'ayin ku!",
      "srufText":
      "Godiya da kasancewa cikin iyalin ${AppConfig.appName} 🫶 Idan kuna jin daɗin hakar Bitcoin, don Allah ku ɗauki lokaci ku ba mu ⭐️ tauraro. Ra'ayin ku yana taimaka mana inganta tsaro da aiki ga kowa da kowa.",
      "srufsb": "Tura",
      "slt": "Shin kun tabbata kuna son fita daga asusun ku?",
      "slyb": "Haka ne",
      "slnb": "A'a",
      "sdh": "Shin kun tabbata kuna son goge asusun ku?",
      "sdsub": "Wannan zai goge duk bayanan ku har abada. Ba za a iya dawo da su ba.",
      "sdstostm": "✅ An goge asusun ku kuma an share duk bayanai.",
      "srsm":
      "An yi nasarar maido da biyan kuɗin ku. Gudun hakar ku ya ƙaru, kuma kuna iya ci gaba da samun kuɗi ba tare da tsayawa ba.",
      "snasfua": "Ba a sami wani biyan kuɗi mai aiki a asusun ku ba.",

      // Edit Profile
      "epn": "Suna",
      "epne": "Da fatan za a saka cikakken sunan ku",
      "epe": "Email",
      "epee": "Saka adireshin email mai kyau",
      "epp": "Lambar Waya",
      "eppe": "Saka lambar waya mai kyau",
      "epu": "Sabunta",

      // Withdraw BTC
      "wbera": "Saka Adireshin Mai Karɓa",
      "wberae": "Da fatan za a saka adireshin da yake daidai",
      "wbwl": "Iyakar Cire Kuɗi: @limit BTC",
      "wbwle": "Dole ne ku sami aƙalla @limitError BTC kafin ku iya cirewa.",
      "wbpb": "Ci gaba",
      "wbwh": "Tarihin Cire Kuɗi",
      "wbydhapy": "Ba ku da tarihin biyan kuɗi tukunna.",
      "wbcp": "Ba ku da wani shiri tukunna.",

      // Refer Friends
      "rfyrc": "Lambar Gayyatar ku",
      "rfcc": "Kwafi Lambar",
      "rfsc": "Rarraba Lambar",
      "rfbr": "Amfanin Gayyata",
      "rfgber": "Sami @rBTC BTC akan kowane mutum daya da ka gayyata",
      "rfyfghbsm": "Abokan ku za su sami kyauta mai yawa don fara hakar Bitcoin",
      "rfurimyw": "Gayyata marar iyaka – gayyaci duk mutanen da kuke so!",
      "rfct":
      "🔐 Kasance tare da ni a ${AppConfig.appName}\nIna amfani da wannan manhaja don hakar Bitcoin tare da amintattun injina da bibiyar kuɗi a sarari. Yana da sauƙin farawa kuma shiga kyauta ne.\n🎁 Yi amfani da lambar gayyata ta @referralCode don karɓar kyautar ku nan take.\n👇 Sauke manhajar kuma fara hakar Bitcoin yanzu:\n👉 @siAppLink",

      // Customer Support
      "csym": "Saƙon ku",
      "cstymh": "Rubuta saƙon ku a nan...",
      "csmr": "Dole ne a saka saƙo.",
      "css": "Tura",

      // etc
      'srd': "An Gama",
      "epst":
      "Samu sauƙin hakar Bitcoin tare da fasahar hakar yanar gizo (Cloud Mining) ta zamani — kowane lokaci, a kowane wuri.",

      // lock && unlock
      'lPh': "Kulle",
      'lPlb': "KUNNA KULLE",
      'lPvl': "AN KULLE WAJEN AJIYA",
      'lPsc':
      "Hanyar tsaro tana aiki. Buɗe wajen ajiyar yanzu don karɓar @lockbtc BTC. Kulle sau ɗaya, kwanta da daɗi. Bitcoin ɗin ku yana nan a adane.",
      "lPbsm": "Bitcoin ɗin ku @lockedbtc da kuka haƙa yana nan a kulle cikin aminci.",
      "lptl": "Kalli wannan tallan don kare Bitcoin ɗin ku @tolockbtc da kuka haƙa a hanyar da take da tsaro.",
      'lUPh': "Buɗe",
      'lUPlb': "BUƊE WAJEN AJIYA",
      'lUPvl': "AN BUƊE WAJEN AJIYA",
      'lUPsc':
      "Hanyar tsaro ta haɗu. Buɗe wajen ajiyar yanzu don samun damar shiga Bitcoin ɗin ku @unlockbtc. Tsaro mai ƙarfi.",
      'lUPbsm': "Bitcoin ɗin ku @unlockedbtc yanzu an buɗe shi kuma yana shirye don karɓa.",
      'lUPtl':
      "Kalli wannan tallan don buɗe wajen ajiyar ku kuma ku karɓi Bitcoin ɗin ku @tounlockbtc nan take.",

      // store info
      "sisa": "Gudun Haka:",
      "sip": "Ƙarfin Injin:",
      "sies": "Ƙarin Ƙarfi:",
      "siods": "Gudun Haka",
      "siode": "Ƙarfin Injin",
      "siodn": "Ƙarin Ƙarfi",
      "siot": "Tsawon Lokaci",
      "siodd": "Ragi",
      "siodp": "Jimillar Farashi",
      "siodop": "Asalin Farashi",
      "siltos": "Sami Ragi na @discount%",
      "siap": "Fara Shirin",
      "sisub":
      "Biyan kuɗin ku zai sabunta kansa gwargwadon shirin ku, sai dai idan kun fasa. Kuna iya sarrafa shi a kowane lokaci a Google Play.",
      "sissm": "An fara shirin ku na @name mai gudun @speed na tsawon kwanaki @day.",
      "sipsb": "Yayi",
      "siod": "Bayanin Oda",

      // sing page
      "lh": "Sannu! Barka da dawowa 👋 Bari mu fara",
      "lsub": "Shiga cikin sauri da aminci tare da Google",
      "lcwg": "Ci gaba da Google",
      "ltou": "Sharuddan Amfani",
      "lsubText":
      "Wannan manhajar ba ta amfani da na'urarku wajen hakar Bitcoin. Tana kwaikwayon hakar ne kawai ta hanyar amfani da injina na yanar gizo (cloud).",
      "lrc": "Lambar Gayyata",
      "lrsub": "Kuna da lambar gayyata? Buɗe kyautar ku",
      "lrhint": "Saka Lambar Gayyata (Idan akwai)",
      "lskip": "Wuce",
      "lsubmit": "Tura",
      "src": "Taya Murna",
      "srsubone": "A matsayin hanyar nuna godiya, mun ƙara muku kyauta don ku fara hakar Bitcoin: ",
      "srsubtwo": " ƙarin ƙarfin hakar yanar gizo a asusun ku!",
      "srls": "Bari Mu Fara",
      "srdh": "Kalli wannan tallan don karɓar kyautar maraba ta @value BTC kyauta a wajen kuɗin ku.",
      "srdnt": "A'a Nagode",
      "cics": "Ana Haɗa Injin Yanar Gizo",
      "cisc": "An Gama Saiti",
      "cisyr": "Zaɓi Yankin ku",
      "cicr": "Zaɓi Yanki",
      "ci": "Ana farawa...",
      "csc": "An gama komai! Injin hakar ku na yanar gizo yana nan a shirye a yankin @selectedRegion",
      "cscr": "Kun sami @reward na ƙarfin hakar yanar gizo kyauta don fara hakar Bitcoin ɗin ku.",
      "cyrs": "Za a samar da injin hakar ku ne gwargwadon yankin da kuka zaɓa.",
      "ccb": "Ci gaba",
      "csre":"⚠️ Zaɓi yankin ku don ci gaba",

      // utils
      "watchAdTitle": "Kalli wannan tallan don haɓaka ƙarfin hakar ku zuwa @text na tsawon mintuna @adTime ⚡",
      "watchAdN": "Ba yanzu ba",
      "watchAdY": "Kalla Yanzu",
      "swadt":"Kalli talla domin fara hakar ma'adinai a gajimare nan take \nSaurinka na yanzu: @cs ⛏️",

      // FAQ
      'q1': "Menene Bitcoin Cloud Mining?",
      'a1':
      "Bitcoin Cloud Mining wata hanya ce ta hakar Bitcoin ta yanar gizo inda mutane ke haya injina daga manyan wuraren ajiya (data centers). Ba kwa buƙatar siyan injin hakar da kanku. Kuna samun kyauta kullum gwargwadon ƙarfin da kuka saya.",
      'q3': "Zan iya hakar Bitcoin daga nesa?",
      'a3':
      "Haka ne, za ku iya hakar Bitcoin daga nesa ta hanyar cloud mining. Wannan yana ba ku damar yin haya injina ba tare da kuna da su a gidan ku ba. Ana yin hakar ne a manyan injina na yanar gizo.",
      'q4': "Menene Hashrate?",
      'a4':
      "Hashrate shine ma'aunin ƙarfin injin da ake amfani da shi wajen hakar Bitcoin. Idan hashrate ɗin ku yana da yawa, hakan yana nufin hakar ku za ta yi sauri kuma za ku sami ƙarin Bitcoin.",
      'q5': "Ana samun riba a Bitcoin Cloud Mining?",
      'a5':
      "Haka ne, idan kuna da shiri mai kyau kuma kuna hakar Bitcoin akai-akai, za ku iya samun riba mai kyau. Ribar ta dogara ne da ƙarfin injin ku da kuma farashin Bitcoin.",
      'q6': "Zan iya ƙara gudun hakar Bitcoin na?",
      'a6':
      "Haka ne, ta hanyar haɓaka shirin ku zuwa mai hashrate mai yawa, za ku iya ƙara gudun hakar ku kuma ku sami Bitcoin cikin sauri.",
      'q7': "Wane lokaci zan kai iyakar cire kuɗi?",
      'a7':
      "Lokacin ya dogara ne da gudun hakar ku da kuma yawan yin haka akai-akai. Yawancin mutane suna kaiwa cikin makonni kaɗan zuwa wata guda.",
      'q8': "Hakar Bitcoin ya dace da doka?",
      'a8':
      "Haka ne, hakar Bitcoin ya dace da doka a ƙasashe da dama, amma akwai ƙasashen da aka hana ko aka sanya wa takunkumi. Koyaushe ku duba dokokin ƙasarku.",
      "q0": "Menene CryptoRise Cloud?",
      "a0":
      "CryptoRise Cloud wani tsari ne na hakar Bitcoin ta yanar gizo ta hanyar amfani da injina na zamani (ASIC miners). Maimakon ku sayi injina masu tsada, kuna iya haya daga manyan wuraren ajiya masu ƙarfin gaske.",
      "q9": "Yaya zan fara hakar Bitcoin?",
      "a9":
      "Don fara hakar Bitcoin, kawai ku danna maɓallin 'Fara Haka' kuma komai zai fara tafiya da kansa.",
      "q10": "Zan iya gwada hakar Bitcoin kyauta?",
      "a10":
      " Haka ne! Sabbin mambobi suna iya gwada hakar Bitcoin kyauta. Kawai ku yi rajista, ku kalli talla, sannan ku fara hakar Bitcoin nan take.",
    },

    // TODO Portuguese Translation
    'pt_BR': {
      // home
      "bh": "Início",
      "bu": "Upgrade",
      "bl": "Ranking",
      "bs": "Configurações",
      "hh": "Olá, @name",
      "hs": "Velocidade",
      "ham": "Mineradores Ativos",
      "hsmn": "Sua mineração em nuvem irá pausar quando o cronômetro terminar. Reinicie manualmente para continuar minerando.",
      "hsm": "Começar Mineração",
      "hab": "Booster Ativo",
      "hdr": "Recompensa Diária",
      "hadboost": "Coletar",
      "hqr": "Recompensa Rápida",
      "hdqh": "Recompensa de Anúncio Rápido",
      "hdrcm": "Esta recompensa já foi coletada. Ela estará disponível novamente amanhã.",
      "hqrcm": "Esta recompensa já foi coletada. Ela estará disponível novamente após 4 horas.",

      // store
      "swAdBoost": "Resgatar",
      "spn": "Fazer Upgrade Agora",
      "swab": "Ver Anúncio e Boost",
      "scpeed": "Velocidade Ativa: ",
      "scfpb": "Booster de Velocidade Grátis",
      "scfs": "Minuto",
      "srz": "Zona de Recompensa 🎉",
      "srct": "Reward Coin",
      "srzst": "Mine Bitcoin grátis completando tarefas simples",
      "srzh": "Zona de Recompensa",
      "srzhst":
      "Complete tarefas simples, como assistir a anúncios e deixar avaliações, para ganhar Recompensas. Use suas Recompensas para ativar a mineração sem custo — nenhum investimento é necessário.",
      "scht": "Conheça o RewardCoin — nossa maneira especial de agradecer por você fazer parte do nosso app.",
      "scab": "Saldo Disponível",
      "scuscb": "Converter",
      "scone": "1 RewardCoin",
      "scn1":
      "RewardCoin é uma recompensa bônus nossa. Para convertê-lo em BTC, você deve ter um saldo de BTC @cbtcb disponível para saque.",
      "sccer":"Desculpe, você não tem saldo suficiente para converter RewardCoin.",
      "rzar": "Recompensas Disponíveis",
      "rwt": "Tarefa:",
      "rwr": "Recompensa:",
      "rwcb": "Resgatar",
      "rwcdb": "Resgatado",
      "rwcloseb": "Fechar",
      "hbrwd": "Assista a este anúncio para desbloquear um bônus de mineração e ganhar mais.\n@reward",
      "wad": "Assistir Agora",
      "rat":"Pronto em @atime",
      's1': 'Aproveite 100% de tempo de atividade com seu minerador dedicado — permaneça ativo mesmo durante manutenções do sistema.',
      's2':
      'Ao assinar, você concorda com cobranças automáticas. Seu plano é renovado pelo mesmo preço e duração, a menos que seja cancelado. Você também concorda com nossos',


      // wallet
      "wh": "Carteira",

      // setting
      "sp": "Perfil",
      "sep": "Editar Perfil",
      "sg": "Geral",
      "scp": "Plano Atual",
      "swb": "Sacar BTC",
      "srs": "Restaurar Assinatura",
      "srcrp": "Converter Pontos de Recompensa",
      "so": "Outros",
      "srf": "Indicar Amigos",
      "sl": "Idioma",
      "sru": "Avalie-nos",
      "ss": "Compartilhar",
      "sas": "Conta e Suporte",
      "spp": "Política de Privacidade",
      "scs": "Suporte ao Cliente",
      "slo": "Sair",
      "sda": "Excluir Conta",
      "sShareText":
      "🔐 Seguro. Confiável. Eficiente.\nMine Bitcoin com confiança usando ferramentas de mineração de alta performance.\n📊 Rastreamento transparente de ganhos\n⚙️ Desempenho de mineração otimizado\n🛡️ Construído com foco em segurança e estabilidade\n👇 Baixe o ${AppConfig.appName} e comece a minerar com segurança hoje mesmo.\n👉@shareAppLink",
      "sruf": "Gostaríamos de receber seu feedback!",
      "srufText":
      "Obrigado por fazer parte da família ${AppConfig.appName} 🫶 Se você está gostando da sua jornada de mineração, reserve um momento para deixar uma avaliação ⭐️. Seu feedback nos ajuda a melhorar a segurança, o desempenho e a confiabilidade para todos.",
      "srufsb": "Enviar",
      "slt": "Tem certeza de que deseja sair da sua conta?",
      "slyb": "Sim",
      "slnb": "Não",
      "sdh": "Tem certeza de que deseja excluir sua conta?",
      "sdsub": "Isso apagará permanentemente todos os seus dados. Esta ação não pode ser desfeita.",
      "sdstostm": "✅ Sua conta foi excluída e todos os dados foram limpos.",
      "srsm":
      "Sua assinatura foi restaurada com sucesso. Seu poder de mineração está ativo e você pode continuar ganhando sem interrupções.",
      "snasfua": "Nenhuma assinatura ativa encontrada em sua conta.",

      // Edit Profile
      "epn": "Nome",
      "epne": "Por favor, insira seu nome completo",
      "epe": "E-mail",
      "epee": "Insira um endereço de e-mail válido",
      "epp": "Número de Telefone",
      "eppe": "Insira um número de telefone válido",
      "epu": "Atualizar",

      // Withdraw BTC
      "wbera": "Inserir Endereço do Destinatário",
      "wberae": "Por favor, insira um endereço válido",
      "wbwl": "Limite de Saque: @limit BTC",
      "wbwle": "Você deve ter pelo menos @limitError BTC para sacar.",
      "wbpb": "Prosseguir",
      "wbwh": "Histórico de Saques",
      "wbydhapy": "Você ainda não tem histórico de pagamentos.",
      "wbcp": "Você ainda não possui um plano.",

      // Refer Friends
      "rfyrc": "Seu Código de Indicação",
      "rfcc": "Copiar Código",
      "rfsc": "Compartilhar Código",
      "rfbr": "Benefícios das Indicações",
      "rfgber": "Ganhe @rBTC BTC para cada indicação",
      "rfyfghbsm": "Seus amigos ganham bônus enormes para começar a minerar",
      "rfurimyw": "Indicações ilimitadas – convide quantos quiser!",
      "rfct":
      "🔐 Junte-se a mim no ${AppConfig.appName}\nEstou usando este app para minerar Bitcoin com ferramentas seguras, de alta performance e acompanhamento claro de ganhos. É fácil começar e grátis para participar.\n🎁 Use meu código de convite @referralCode para receber seu bônus instantaneamente.\n👇 Baixe o app e comece a minerar hoje mesmo:\n👉 @siAppLink",

      // Customer Support
      "csym": "Sua Mensagem",
      "cstymh": "Digite sua mensagem aqui...",
      "csmr": "A mensagem é obrigatória.",
      "css": "Enviar",

      // etc
      'srd': "Concluído",
      "epst":
      "Experimente a mineração de Bitcoin sem esforço com tecnologia avançada de Mineração em Nuvem — a qualquer hora, em qualquer lugar.",

      // lock && unlock
      'lPh': "Bloquear",
      'lPlb': "ATIVAR BLOQUEIO",
      'lPvl': "COFRE BLOQUEADO",
      'lPsc':
      "Canal seguro ativo. Desbloqueie o cofre agora para resgatar @lockbtc BTC. Bloqueie uma vez. Relaxe sempre. Seu Bitcoin permanece protegido.",
      "lPbsm": "Seu @lockedbtc BTC minerado está bloqueado com segurança em um canal seguro.",
      "lptl": "Assista a este anúncio para proteger seu @tolockbtc BTC minerado em um canal seguro e criptografado.",
      'lUPh': "Desbloquear",
      'lUPlb': "DESBLOQUEAR COFRE",
      'lUPvl': "COFRE DESBLOQUEADO",
      'lUPsc':
      "Canal seguro estabelecido. Desbloqueie o cofre agora para acessar seu @unlockbtc BTC. Acesso seguro. Controle total.",
      'lUPbsm': "Seu @unlockedbtc BTC está agora desbloqueado e pronto para resgate.",
      'lUPtl':
      "Assista a este anúncio para desbloquear seu cofre e acessar seu @tounlockbtc BTC minerado instantaneamente.",

      // store info
      "sisa": "Velocidade de Mineração:",
      "sip": "Poder de Mineração:",
      "sies": "Boost de Mineração:",
      "siods": "Velocidade de Mineração",
      "siode": "Poder de Mineração",
      "siodn": "Boost de Mineração",
      "siot": "Duração",
      "siodd": "Desconto",
      "siodp": "Preço Total",
      "siodop": "Preço Original",
      "siltos": "Ganhe @discount% de Desconto",
      "siap": "Ativar Plano",
      "sisub":
      "Sua assinatura é renovada automaticamente de acordo com seu plano, a menos que você cancele. Você pode gerenciá-la a qualquer momento no Google Play.",
      "sissm": "Seu plano @name @speed foi ativado por @day dias.",
      "sipsb": "Ok",
      "siod": "Detalhes do Pedido",

      // sing page
      "lh": "Ei! Bem-vindo de volta 👋 Vamos começar",
      "lsub": "Login rápido e seguro com o Google",
      "lcwg": "Continuar com o Google",
      "ltou": "Termos de Uso",
      "lsubText":
      "Este aplicativo não minera Bitcoin no seu dispositivo. Ele simula a mineração e permite que você gerencie remotamente mineradores baseados em nuvem.",
      "lrc": "Código de Indicação",
      "lrsub": "Tem um código de indicação? Desbloqueie suas recompensas",
      "lrhint": "Inserir Código de Indicação (Opcional)",
      "lskip": "Pular",
      "lsubmit": "Enviar",
      "src": "Parabéns",
      "srsubone": "Como parte do nosso compromisso, adicionamos uma recompensa gratuita para você começar ",
      "srsubtwo": " boost de mineração em nuvem na sua conta!",
      "srls": "Vamos Começar",
      "srdh": "Assista a este anúncio para resgatar seu bônus de boas-vindas gratuito de @value BTC na sua carteira.",
      "srdnt": "Não, Obrigado",
      "cics": "Inicializando Servidor em Nuvem",
      "cisc": "Configuração Concluída",
      "cisyr": "Selecione Sua Região",
      "cicr": "Escolher Região",
      "ci": "Inicializando...",
      "csc": "Tudo pronto! Seu servidor de mineração em nuvem está pronto na região @selectedRegion",
      "cscr": "Você recebeu @reward de poder de mineração em nuvem gratuito para começar sua jornada.",
      "cyrs": "Seu servidor de mineração em nuvem será inicializado com base na região que você escolher.",
      "ccb": "Continuar",
      "csre":"⚠️ Escolha sua região para continuar",

      // utils
      "watchAdTitle": "Assista a este anúncio para aumentar seu poder de mineração para @text por @adTime minutos ⚡",
      "watchAdN": "Agora não",
      "watchAdY": "Assistir Agora",
      "swadt":"Assista a um anúncio para ativar a mineração em nuvem instantaneamente \nSua velocidade atual: @cs ⛏️",

      // FAQ
      'q1': "O que é Mineração em Nuvem de Bitcoin?",
      'a1':
      "A Mineração em Nuvem de Bitcoin é um método de mineração remota onde os usuários alugam poder de computação de centros de dados para minerar Bitcoin. Isso elimina a necessidade de hardware físico, configuração ou manutenção. Os usuários ganam recompensas diárias com base na taxa de hash que compram. Isso torna a mineração uma opção conveniente e acessível para qualquer pessoa.",
      'q3': "Posso minerar Bitcoin remotamente?",
      'a3':
      "Sim, você pode minerar Bitcoin remotamente através da mineração em nuvem. Isso permite que você alugue poder de mineração de centros de dados sem possuir nenhum hardware. O processo de mineração ocorre em servidores remotos e você recebe ganhos diários de Bitcoin com base na sua taxa de hash contratada.",
      'q4': "O que é Hashrate?",
      'a4':
      "Hashrate é a medida do poder de computação usado na mineração de Bitcoin. Ele representa quantos cálculos (ou “hashes”) um sistema pode realizar por segundo para resolver algoritmos complexos. Um hashrate mais alto significa uma mineração mais rápida e uma chance melhor de ganhar recompensas em Bitcoin.",
      'q5': "É possível obter lucro com a Mineração em Nuvem de Bitcoin?",
      'a5':
      "Sim, com o plano certo e atividade de mineração consistente, a mineração em nuvem de Bitcoin pode gerar ganhos constantes. A lucratividade depende da sua taxa de hash, do preço do BTC e da duração da mineração.",
      'q6': "É possível aumentar a velocidade de mineração remota de Bitcoin?",
      'a6':
      "Sim, ao fazer o upgrade do seu plano de mineração em nuvem para uma taxa de hash mais alta, você pode aumentar sua velocidade de mineração e ganhar Bitcoin de forma mais eficiente.",
      'q7': "Quanto tempo levará para atingir o limite de saque?",
      'a7':
      "O tempo necessário depende da sua velocidade de mineração (hashrate), do tipo de plano e da frequência com que você minera. Com um hashrate mais alto e atividade diária, muitos usuários atingem o limite de saque dentro de algumas semanas a um mês.",
      'q8': "A mineração de Bitcoin é legal?",
      'a8':
      "Sim, a mineração de Bitcoin é legal em muitos países, mas restrita ou proibida em alguns. Sempre verifique as regulamentações locais antes de minerar.",
      "q0": "O que é a CryptoRise Cloud?",
      "a0":
      "A CryptoRise Cloud refere-se à mineração de criptomoeda baseada em nuvem que utiliza mineradores ASIC. Em vez de comprar e manter hardware caro, os usuários podem alugar poder de mineração de centros de dados profissionais equipados com máquinas de alta performance otimizadas para a mineração de Bitcoin.",
      "q9": "Como começo a minerar Bitcoin?",
      "a9":
      "Para começar a minerar Bitcoin, basta clicar no botão 'Começar Mineração' e o processo começará automaticamente.",
      "q10": "Posso testar a mineração de Bitcoin gratuitamente?",
      "a10":
      " Sim! Novos usuários podem testar a mineração de BTC gratuitamente. Basta se registrar, assistir aos anúncios e começar a minerar instantaneamente.",
    },
  };
}
