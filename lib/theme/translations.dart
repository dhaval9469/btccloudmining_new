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
      "hmp": "CLOUD MINING PANEL",
      "hmph": "Mining Process ?",
      "hmpsub":
          "To keep your miner running, activate it daily. Once active, it automatically mines Bitcoin on our cloud servers, and you’ll get real-time updates. Mining power gradually decreases over time, but you can reduce this by completing ad-based tasks. You can also boost your mining power by watching ads or instantly increase it by purchasing a mining plan.",
      "ham": "Active Miners",
      "hsmn": "Your cloud mining will pause when the timer ends. Restart manually to keep mining.",
      "hsm": "Start Mining",
      "hab": "Active Booster",
      "hdr": "Daily Reward",
      "hdah": "Daily Ads Reward",
      "hlb": "Lock Mined BTC",
      "hlbsub": "Watch this ad to lock your mined BTC safely.",
      "hlbssmag": "✅ Locked Successfully!",
      "hdasub": "⚡ @dailyReward GH/s Standard Boost Renews automatically every 24 hours — plus claim your daily reward! 🎁",
      "hadboost": "Ad & Boost",
      "hqr": "Quick Reward",
      "hdqh": "Quick Ads Reward",
      "hdqsub": "⚡ @quickReward GH/s Quick Reward Auto-renews every 4 hours 🔄 — collect your quick reward each time! 🎁",

      // store
      "sm": "Marketplace",
      "sva": "View All",
      "swAdBoost": "Watch Ad & Boost",
      "spn": "Upgrade Now",
      "spsub":
          "With ASIC cloud mining, you gain the advantage of low energy costs, fully managed equipment in the cloud, and steady returns—without the burden of technical complexities.",

      // wallet
      "wtc": "Total BTC",
      "wmb": "Mined Balance",
      "wrb": "Referral Balance",
      "wpayout": "Payout",
      "wvh": "View History",
      "wbwa": "BTC Wallet Address",
      "wwl": "withdrawal Limit: @btc",
      "wwlError": "withdrawal Limit: @btcLimit BTC to withdraw.",
      "wpr": "Payout Request",
      "wnh": "Please read carefully before proceeding.",
      "wnsubone":
          "Transaction fees are necessary for blockchain transactions and are not controlled by this platform. Fees may vary based on blockchain network conditions. Please refer to the specific fees; the amount credited will be the withdrawal amount minus the blockchain fees. Transaction fees for the BTC network and BEP-20 network are relatively high. You can verify these fees on the blockchain.",
      "wnsubtwo":
          "Please ensure you use a secure and reliable BTC wallet, and double-check the wallet address to ensure the safety of your funds.",
      "wfash": "Finish Account Setup",
      "wfassub": "Finish your account setup by adding the required details to enable withdrawals.",
      "wfsb": "Finish Setup",
      "wwh": "Your withdrawal request has been processed. Funds will arrive shortly.",
      "wwb": "Okay",
      "wweh": "⚠ BTC amount doesn’t match!",
      "weem": "Expected: @massage",
      "wer": "Received: @balance",
      "wc": "Close",

      // setting
      "sah": "Settinge",
      "sresub": "Earn free BTC by referring friends — you’ll get @btcValue BTC each time!",
      "smr": "Mining Record",
      "svaa": "Current Plan",
      "stm": "Top Miner",
      "sp": "Edit Profile",
      "sru": "Rate Us",
      "sre": "Refer Friends",
      "ss": "Share",
      "sl": "Language",
      "spp": "Privacy Policy",
      "scs": "Customer Support",
      "slo": "Log Out",
      "sda": "Delete Account",
      "sbtc": "Withdraw BTC",
      "sShareText":
          "⚡ Mine BTC effortlessly with high-speed mining! 📈 Track your earnings and boost performance. 🔓 Unlock premium tools and earn faster. 👇 Download the Bitcoin Mining (ASIC Miner) app and start mining now: @shareAppLink",
      "sfh": "Feedback",
      "sfText":
          "Thanks for being part of the Bitcoin Mining (ASIC Miner) family! 🫶 If you’re enjoying your mining journey, we’d love your ⭐️ rating. Your feedback makes us stronger!",
      "sfsb": "Submit",
      "slt": "Are you sure you want to log out of your account?",
      "slyb": "Yes",
      "slnb": "No",
      "sdh": "Are you sure you want to delete your account?",
      "sdsub": "This will permanently erase all your data. This action cannot be undone.",
      "sdstostm": "✅ Your account has been deleted and all data cleared.",
      "sifText":
          "🚀 Join me in mining Bitcoin with this powerful Bitcoin Mining (ASIC Miner) app! 💸 I'm earning crypto daily — it's easy, fast, and free to start. 🎁 Use my invite code: '@referralCode' to claim your bonus instantly. 👇 Tap below to download and start mining together: @siAppLink",

      // etc
      "mrEmpty": "Your mining journey hasn’t begun. Start mining today!",
      "mdp": "Daily Progress",
      "aas": "Active ASICs",
      "aaEmpty": "No Antminers rented yet — start your first rental today!",
      "pnError": "Name is required.",
      "peError": "Email is required.",
      "pmnumberError": "Phone number is required",
      "pwaError": "wallet address is required.",
      "pub": "UPDATE",
      "css": "SUBMIT",

      // store info
      "sihd": "Hardware Details",
      "sitp": "Time Period",
      "siod": "Order Details",
      "siap": "Activate Plan",
      "sisub":
          "Your subscription renews automatically according to your plan, unless you cancel. You can manage it anytime in Google Play.",
      "sissm": "🎉 Congratulations! Your @name (@hashrate) has been Successfully Subscribed for @day days.",

      // sing page
      "lh": "Hey There! Welcome Back 👋",
      "lsub": "One tap to get started — sign in with Google",
      "lcwg": "Continue with Google",
      "ltou": "Terms of Use",
      "lsubText":
          "This app does not mine Bitcoin on your device. It simulates mining and allows users to remotely manage cloud-based miners.",
      "lrc": "Referral Code",
      "lrsub": "Unlock Rewards with a Referral Code",
      "lrhint": "Enter Referral Code (Optional)",
      "lskip": "Skip",
      "lsubmit": "Submit",
      "src": "Congratulations",
      "srsubone": "As part of our commitment, we’ve added a free reward to get you started ",
      "srsubtwo": " cloud mining boost to your account!",
      "srls": "Let's Start",
      "srdh": "Watch this ad to claim your free @value BTC welcome bonus in your wallet.",
      "srdnt": "No Thanks",

      // utils
      "watchAdTitle": "Watch this ad to unlock @text mining power for @adTime minutes.",
      "watchAdN": "Not now",
      "watchAdY": "Watch Now",

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
      "q0": "What is an ASIC Cloud?",
      "a0":
          "An ASIC Cloud refers to cloud-based cryptocurrency mining that leverages Application-Specific Integrated Circuit (ASIC) miners. Rather than purchasing and maintaining costly hardware, users can rent mining power from professional data centers equipped with high-performance ASIC machines optimized for Bitcoin mining.",
      "q9": "How do I start Bitcoin mining?",
      "a9": "To start Bitcoin mining, simply click the Start Mining button and the process will begin automatically.",
      "q10": "Can I try Bitcoin mining for free?",
      "a10": "Yes! New users can try BTC mining for free. Just register, watch ads, and start mining instantly.",
    },

    // TODO Malay Translation
    'ms_MY': {
      // home
      "hmp": "PANEL MELOMBONG",
      "hmph": "Proses Melombong ?",
      "hmpsub":
          "Untuk memastikan pelombong anda terus berfungsi, aktifkannya setiap hari. Setelah aktif, ia secara automatik melombong Bitcoin pada pelayan awan kami, dan anda akan mendapat kemas kini masa nyata. Kuasa melombong secara beransur-ansur berkurangan dari masa ke masa, tetapi anda boleh mengurangkannya dengan menyelesaikan tugas berasaskan iklan. Anda juga boleh meningkatkan kuasa melombong anda dengan menonton iklan atau meningkatkannya serta-merta dengan membeli pelan melombong.",
      "ham": "Pelombong Aktif",
      "hsmn":
          "Perlombongan awan anda akan berhenti seketika apabila pemasa tamat. Mulakan semula secara manual untuk terus melombong.",
      "hsm": "Mula Melombong",
      "hab": "Penggalak Aktif",
      "hdr": "Ganjaran Harian",
      "hdah": "Ganjaran Iklan Harian",
      "hlb": "Kunci BTC yang Dilombong",
      "hlbsub": "Tonton iklan ini untuk mengunci BTC yang anda lombong dengan selamat.",
      "hlbssmag": "✅ Berjaya Dikunci!",
      "hdasub":
          "⚡ @dailyReward GH/s Peningkatan Standard Diperbaharui secara automatik setiap 24 jam — serta tuntut ganjaran harian anda! 🎁",
      "hadboost": "Iklan & Peningkatan",
      "hqr": "Ganjaran Pantas",
      "hdqh": "Ganjaran Iklan Pantas",
      "hdqsub":
          "⚡ @quickReward GH/s Ganjaran Pantas Diperbaharui secara automatik setiap 4 jam 🔄 — kumpulkan ganjaran pantas anda setiap kali! 🎁",

      // store
      "sm": "Pasaran",
      "sva": "Lihat Semua",
      "swAdBoost": "Tonton Iklan & Peningkatan",
      "spn": "Beli Sekarang",
      "spsub":
          "Dengan perlombongan awan ASIC, anda mendapat kelebihan kos tenaga yang rendah, peralatan yang diurus sepenuhnya dalam awan, dan pulangan yang stabil—tanpa beban kerumitan teknikal.",

      // wallet
      "wtc": "Jumlah BTC",
      "wmb": "Baki Dilombong",
      "wrb": "Baki Rujukan",
      "wpayout": "Bayaran",
      "wvh": "Lihat Sejarah",
      "wbwa": "Alamat Dompet BTC",
      "wwl": "Had Pengeluaran: @btc",
      "wwlError": "Had Pengeluaran: @btcLimit BTC untuk dikeluarkan.",
      "wpr": "Permintaan Bayaran",
      "wnh": "Sila baca dengan teliti sebelum meneruskan.",
      "wnsubone":
          "Yuran transaksi adalah perlu untuk transaksi rantaian blok dan tidak dikawal oleh platform ini. Yuran mungkin berbeza-beza berdasarkan keadaan rangkaian rantaian blok. Sila rujuk yuran tertentu; jumlah yang dikreditkan akan menjadi jumlah pengeluaran tolak yuran rantaian blok. Yuran transaksi untuk rangkaian BTC dan rangkaian BEP-20 adalah agak tinggi. Anda boleh mengesahkan yuran ini pada rantaian blok.",
      "wnsubtwo":
          "Sila pastikan anda menggunakan dompet BTC yang selamat dan boleh dipercayai, dan semak semula alamat dompet untuk memastikan keselamatan dana anda.",
      "wfash": "Selesaikan Persediaan Akaun",
      "wfassub": "Selesaikan persediaan akaun anda dengan menambah butiran yang diperlukan untuk membolehkan pengeluaran.",
      "wfsb": "Selesaikan Persediaan",
      "wwh": "Permintaan pengeluaran anda telah diproses. Dana akan tiba tidak lama lagi.",
      "wwb": "Baik",
      "wweh": "⚠ Jumlah BTC tidak sepadan!",
      "weem": "Dijangka: @massage",
      "wer": "Diterima: @balance",
      "wc": "Tutup",

      // setting
      "sah": "Tetapan",
      "sresub": "Dapatkan BTC percuma dengan merujuk rakan-rakan — anda akan mendapat @btcValue BTC setiap kali!",
      "smr": "Rekod Perlombongan",
      "svaa": "Lihat ASIC Aktif",
      "stm": "Pelombong Teratas",
      "sp": "Profil",
      "sru": "Nilaikan Kami",
      "sre": "Rujuk & Jana Pendapatan",
      "ss": "Kongsi",
      "sl": "Bahasa",
      "spp": "Dasar Privasi",
      "scs": "Sokongan Pelanggan",
      "slo": "Log Keluar",
      "sda": "Padam Akaun",
      "sShareText":
          "⚡ Lombong BTC tanpa usaha dengan perlombongan berkelajuan tinggi! 📈 Jejaki pendapatan anda dan tingkatkan prestasi. 🔓 Buka kunci alat premium dan jana pendapatan lebih pantas. 👇 Muat turun aplikasi Bitcoin Mining (ASIC Miner) dan mula melombong sekarang: @shareAppLink",
      "sfh": "Maklum Balas",
      "sfText":
          "Terima kasih kerana menjadi sebahagian daripada keluarga Bitcoin Mining (ASIC Miner)! 🫶 Jika anda menikmati perjalanan melombong anda, kami ingin mendapatkan penilaian ⭐️ anda. Maklum balas anda menjadikan kami lebih kuat!",
      "sfsb": "Hantar",
      "slt": "Adakah anda pasti ingin log keluar dari akaun anda?",
      "slyb": "Ya",
      "slnb": "Tidak",
      "sdh": "Adakah anda pasti ingin memadamkan akaun anda?",
      "sdsub": "Ini akan memadamkan semua data anda secara kekal. Tindakan ini tidak boleh dibatalkan.",
      "sdstostm": "✅ Akaun anda telah dipadamkan dan semua data telah dikosongkan.",
      "sifText":
          "🚀 Sertai saya melombong Bitcoin dengan aplikasi Bitcoin Mining (ASIC Miner) yang hebat ini! 💸 Saya menjana pendapatan kripto setiap hari — ia mudah, cepat, dan percuma untuk bermula. 🎁 Gunakan kod jemputan saya: '@referralCode' untuk menuntut bonus anda dengan serta-merta. 👇 Ketik di bawah untuk memuat turun dan mula melombong bersama: @siAppLink",

      // etc
      "mrEmpty": "Perjalanan perlombongan anda belum bermula. Mula melombong hari ini!",
      "mdp": "Kemajuan Harian",
      "aas": "ASIC Aktif",
      "aaEmpty": "Tiada Antminers disewa lagi — mulakan sewaan pertama anda hari ini!",
      "pnError": "Nama diperlukan.",
      "peError": "E-mel diperlukan.",
      "pmnumberError": "Nombor telefon diperlukan.",
      "pwaError": "Alamat dompet diperlukan.",
      "pub": "KEMASKINI",
      "css": "HANTAR",

      // store info
      "sihd": "Butiran Perkakasan",
      "sitp": "Tempoh Masa",
      "siod": "Butiran Pesanan",
      "siap": "Aktifkan Pelan",
      "sisub":
          "Langganan anda diperbaharui secara automatik mengikut pelan anda, melainkan anda membatalkannya. Anda boleh menguruskannya pada bila-bila masa di Google Play.",
      "sissm": "🎉 Tahniah! @name (@hashrate) anda telah Berjaya Langgan selama @day hari.",

      // sing page
      "lh": "Hai! Selamat Kembali 👋",
      "lsub": "Satu ketikan untuk bermula — log masuk dengan Google",
      "lcwg": "Teruskan dengan Google",
      "ltou": "Syarat Penggunaan",
      "lsubText":
          "Aplikasi ini tidak melombong Bitcoin pada peranti anda. Ia hanya mensimulasikan perlombongan dan membolehkan pengguna menguruskan pelombong berasaskan awan dari jauh.",
      "lrc": "Kod Rujukan",
      "lrsub": "Buka Kunci Ganjaran dengan Kod Rujukan",
      "lrhint": "Masukkan Kod Rujukan (Pilihan)",
      "lskip": "Langkau",
      "lsubmit": "Hantar",
      "src": "Tahniah",
      "srsubone": "Sebagai sebahagian daripada komitmen kami, kami telah menambah ganjaran percuma untuk anda bermula ",
      "srsubtwo": " peningkatan perlombongan awan ke akaun anda!",
      "srls": "Mari Mulakan",
      "srdh": "Tonton iklan ini untuk menuntut bonus alu-aluan BTC @value percuma anda dalam dompet anda.",
      "srdnt": "Tidak Terima Kasih",

      // utils
      "watchAdTitle": "Tonton iklan ini untuk membuka kunci kuasa melombong @text selama @adTime minit.",
      "watchAdN": "Tidak sekarang",
      "watchAdY": "Tonton Sekarang",

      // FAQ
      "q1": "Apakah itu Perlombongan Awan Bitcoin?",
      "a1":
          "Perlombongan Awan Bitcoin adalah kaedah perlombongan jarak jauh di mana pengguna menyewa kuasa pengkomputeran daripada pusat data untuk melombong Bitcoin. Ia menghapuskan keperluan untuk perkakasan fizikal, persediaan, atau penyelenggaraan. Pengguna mendapat ganjaran harian berdasarkan kadar hash yang mereka beli. Ini menjadikannya pilihan yang mudah dan boleh diakses untuk sesiapa sahaja untuk mula melombong.",
      "q3": "Bolehkah saya melombong Bitcoin dari jarak jauh?",
      "a3":
          "Ya, anda boleh melombong Bitcoin dari jarak jauh melalui perlombongan awan. Ini membolehkan anda menyewa kuasa melombong daripada pusat data tanpa memiliki sebarang perkakasan. Proses perlombongan berjalan pada pelayan jarak jauh, dan anda menerima pendapatan Bitcoin harian berdasarkan kadar hash yang anda beli.",
      "q4": "Apakah itu Kadar Hash?",
      "a4":
          "Kadar Hash ialah ukuran kuasa pengkomputeran yang digunakan dalam perlombongan Bitcoin. Ia mewakili berapa banyak pengiraan (atau “hash”) yang boleh dilakukan oleh sistem setiap saat untuk menyelesaikan algoritma yang kompleks. Kadar hash yang lebih tinggi bermakna perlombongan yang lebih cepat dan peluang yang lebih baik untuk mendapatkan ganjaran Bitcoin.",
      "q5": "Bolehkah Anda Mendapat Keuntungan dari Perlombongan Awan Bitcoin?",
      "a5":
          "Ya, dengan pelan yang betul dan aktiviti perlombongan yang konsisten, perlombongan awan Bitcoin boleh menjana pendapatan yang stabil. Keuntungan bergantung pada kadar hash anda, harga BTC, dan tempoh perlombongan.",
      "q6": "Adakah Mungkin untuk Meningkatkan Kelajuan Perlombongan Bitcoin Jarak Jauh?",
      "a6":
          "Ya, dengan menaik taraf pelan perlombongan awan anda kepada kadar hash yang lebih tinggi, anda boleh meningkatkan kelajuan perlombongan anda dan mendapat Bitcoin dengan lebih cekap.",
      "q7": "Berapa Lama Masa yang Diambil untuk Mencapai Had Pengeluaran?",
      "a7":
          "Masa yang diambil bergantung pada kelajuan perlombongan anda (kadar hash), jenis pelan, dan seberapa konsisten anda melombong. Dengan kadar hash yang lebih tinggi dan aktiviti harian, ramai pengguna mencapai had pengeluaran dalam beberapa minggu hingga sebulan.",
      "q8": "Adakah Perlombongan Bitcoin Sah di Sisi Undang-undang?",
      "a8":
          "Ya, perlombongan Bitcoin adalah sah di sisi undang-undang di banyak negara tetapi disekat atau diharamkan di beberapa negara. Sentiasa periksa peraturan tempatan anda sebelum melombong.",
      "q0": "Apakah itu Awan ASIC?",
      "a0":
          "Awan ASIC merujuk kepada perlombongan mata wang kripto berasaskan awan yang memanfaatkan pelombong Litar Bersepadu Khusus Aplikasi (ASIC). Daripada membeli dan menyelenggara perkakasan yang mahal, pengguna boleh menyewa kuasa melombong dari pusat data profesional yang dilengkapi dengan mesin ASIC berprestasi tinggi yang dioptimumkan untuk melombong Bitcoin.",
      "q9": "Bagaimana saya mula melombong Bitcoin?",
      "a9": "Untuk memulakan perlombongan Bitcoin, cuma klik butang Mula Melombong dan proses akan bermula secara automatik.",
      "q10": "Bolehkah saya cuba melombong Bitcoin secara percuma?",
      "a10":
          "Ya! Pengguna baharu boleh cuba melombong BTC secara percuma. Hanya daftar, tonton iklan, dan mulakan perlombongan dengan serta-merta.",
    },

    // TODO Filipino Translation
    'fil_PH': {
      // home
      "hmp": "MINING PANEL",
      "hmph": "Proses ng Pagmimina?",
      "hmpsub":
          "Para patuloy na gumana ang iyong miner, i-activate ito araw-araw. Kapag aktibo, awtomatiko itong magmimina ng Bitcoin sa aming cloud servers, at makakakuha ka ng real-time na update. Unti-unting bumababa ang lakas ng pagmimina sa paglipas ng panahon, ngunit maaari mo itong bawasan sa pamamagitan ng pagkumpleto ng mga ad-based na gawain. Maaari mo ring palakasin ang iyong mining power sa pamamagitan ng panonood ng mga ad o agad itong dagdagan sa pagbili ng mining plan.",
      "ham": "Mga Aktibong Miners",
      "hsmn": "Hihinto ang iyong cloud mining kapag natapos ang timer. Manwal na i-restart para magpatuloy sa pagmimina.",
      "hsm": "Simulan ang Pagmimina",
      "hab": "Aktibong Booster",
      "hdr": "Pang-araw-araw na Ganti",
      "hdah": "Pang-araw-araw na Ganti sa Ads",
      "hlb": "I-lock ang Naminang BTC",
      "hlbsub": "Panoorin ang ad na ito para ligtas na mai-lock ang namina mong BTC.",
      "hlbssmag": "✅ Matagumpay na Naka-lock!",
      "hdasub":
          "⚡ @dailyReward GH/s Standard Boost Awtomatikong nagre-renew bawat 24 oras — at i-claim ang iyong pang-araw-araw na ganti! 🎁",
      "hadboost": "Ad & Boost",
      "hqr": "Mabilis na Ganti",
      "hdqh": "Mabilis na Ganti sa Ads",
      "hdqsub":
          "⚡ @quickReward GH/s Mabilis na Ganti Awtomatikong nagre-renew bawat 4 na oras 🔄 — kolektahin ang iyong mabilis na ganti sa bawat pagkakataon! 🎁",

      // store
      "sm": "Marketplace",
      "sva": "Tingnan Lahat",
      "swAdBoost": "Manood ng Ad & Boost",
      "spn": "Bumili Ngayon",
      "spsub":
          "Sa ASIC cloud mining, nakukuha mo ang bentahe ng mababang gastos sa kuryente, ganap na pinamamahalaang kagamitan sa cloud, at tuloy-tuloy na kita—nang walang pasanin ng mga teknikal na kumplikasyon.",

      // wallet
      "wtc": "Kabuuang BTC",
      "wmb": "Mined Balance",
      "wrb": "Referral Balance",
      "wpayout": "Payout",
      "wvh": "Tingnan ang Kasaysayan",
      "wbwa": "Address ng BTC Wallet",
      "wwl": "Hangganan ng Pag-withdraw: @btc",
      "wwlError": "Hangganan ng Pag-withdraw: @btcLimit BTC para i-withdraw.",
      "wpr": "Payout Request",
      "wnh": "Mangyaring basahin nang maingat bago magpatuloy.",
      "wnsubone":
          "Ang mga transaction fee ay kinakailangan para sa mga blockchain transaction at hindi kontrolado ng platform na ito. Maaaring mag-iba ang mga fee batay sa kondisyon ng blockchain network. Mangyaring sumangguni sa mga partikular na fee; ang halagang ikredito ay ang withdrawal amount minus ang mga blockchain fee. Ang mga transaction fee para sa BTC network at BEP-20 network ay medyo mataas. Maaari mong i-verify ang mga fee na ito sa blockchain.",
      "wnsubtwo":
          "Pakitiyak na gumamit ka ng secure at maaasahang BTC wallet, at i-double-check ang wallet address para matiyak ang kaligtasan ng iyong pondo.",
      "wfash": "Tapusin ang Pag-setup ng Account",
      "wfassub":
          "Tapusin ang pag-setup ng iyong account sa pamamagitan ng pagdaragdag ng mga kinakailangang detalye para paganahin ang mga withdrawal.",
      "wfsb": "Tapusin ang Pag-setup",
      "wwh": "Na-proseso na ang iyong withdrawal request. Darating na ang pondo sa lalong madaling panahon.",
      "wwb": "Sige",
      "wweh": "⚠ Hindi tugma ang halaga ng BTC!",
      "weem": "Inaasahan: @massage",
      "wer": "Natanggap: @balance",
      "wc": "Isara",

      // setting
      "sah": "Setting",
      "sresub": "Kumita ng libreng BTC sa pamamagitan ng pag-refer sa mga kaibigan — makakakuha ka ng @btcValue BTC bawat beses!",
      "smr": "Rekord ng Pagmimina",
      "svaa": "Tingnan ang Aktibong ASICs",
      "stm": "Nangungunang Miner",
      "sp": "Profile",
      "sru": "I-rate Kami",
      "sre": "Mag-refer & Kumita",
      "ss": "Ibahagi",
      "sl": "Wika",
      "spp": "Patakaran sa Privacy",
      "scs": "Customer Support",
      "slo": "Mag-log Out",
      "sda": "Burahin ang Account",
      "sShareText":
          "⚡ Magmina ng BTC nang walang kahirap-hirap na may high-speed mining! 📈 Subaybayan ang iyong mga kinita at palakasin ang performance. 🔓 I-unlock ang mga premium na tool at kumita nang mas mabilis. 👇 I-download ang Bitcoin Mining (ASIC Miner) app at simulan na ang pagmimina ngayon: @shareAppLink",
      "sfh": "Feedback",
      "sfText":
          "Salamat sa pagiging bahagi ng pamilya ng Bitcoin Mining (ASIC Miner)! 🫶 Kung nae-enjoy mo ang iyong mining journey, gusto namin ang iyong ⭐️ rating. Ang iyong feedback ang nagpapalakas sa amin!",
      "sfsb": "Isumite",
      "slt": "Sigurado ka bang gusto mong mag-log out sa iyong account?",
      "slyb": "Oo",
      "slnb": "Hindi",
      "sdh": "Sigurado ka bang gusto mong burahin ang iyong account?",
      "sdsub": "Ito ay permanenteng magbubura ng lahat ng iyong data. Hindi ito maaaring bawiin.",
      "sdstostm": "✅ Nabura na ang iyong account at na-clear na ang lahat ng data.",
      "sifText":
          "🚀 Samahan ako sa pagmimina ng Bitcoin gamit ang malakas na app na ito ng Bitcoin Mining (ASIC Miner)! 💸 Kumikita ako ng crypto araw-araw — madali, mabilis, at libreng magsimula. 🎁 Gamitin ang aking invite code: '@referralCode' para i-claim agad ang iyong bonus. 👇 I-tap sa ibaba para mag-download at magsimula nang magmina nang magkasama: @siAppLink",

      // etc
      "mrEmpty": "Hindi pa nagsisimula ang iyong mining journey. Simulan ang pagmimina ngayon!",
      "mdp": "Pang-araw-araw na Pag-unlad",
      "aas": "Aktibong ASICs",
      "aaEmpty": "Wala pang Antminers na narentahan — simulan ang iyong unang rental ngayon!",
      "pnError": "Kinakailangan ang pangalan.",
      "peError": "Kinakailangan ang email.",
      "pmnumberError": "Kinakailangan ang numero ng telepono",
      "pwaError": "Kinakailangan ang wallet address.",
      "pub": "I-UPDATE",
      "css": "ISUMITE",

      // store info
      "sihd": "Mga Detalye ng Hardware",
      "sitp": "Tagal ng Panahon",
      "siod": "Mga Detalye ng Order",
      "siap": "I-activate ang Plano",
      "sisub":
          "Awtomatikong magre-renew ang iyong subscription ayon sa iyong plano, maliban na lang kung kakanselahin mo. Maaari mo itong pamahalaan anumang oras sa Google Play.",
      "sissm": "🎉 Congratulations! Matagumpay na Naka-subscribe ang @name (@hashrate) mo sa loob ng @day araw.",

      // sing page
      "lh": "Kumusta! Welcome Back 👋",
      "lsub": "Isang tap lang para magsimula — mag-sign in gamit ang Google",
      "lcwg": "Magpatuloy sa Google",
      "ltou": "Mga Tuntunin sa Paggamit",
      "lsubText":
          "Ang app na ito ay hindi nagmimina ng Bitcoin sa iyong device. Ginagaya lang nito ang pagmimina at pinapayagan ang mga user na malayuang pamahalaan ang mga cloud-based na miner.",
      "lrc": "Referral Code",
      "lrsub": "I-unlock ang mga Rewards gamit ang Referral Code",
      "lrhint": "Ilagay ang Referral Code (Opsyonal)",
      "lskip": "Laktawan",
      "lsubmit": "Isumite",
      "src": "Binabati Kita",
      "srsubone": "Bilang bahagi ng aming pangako, nagdagdag kami ng libreng reward para makapagsimula ka ",
      "srsubtwo": " cloud mining boost sa iyong account!",
      "srls": "Magsimula Na",
      "srdh": "Manood ng ad na ito para i-claim ang iyong libreng @value BTC welcome bonus sa iyong wallet.",
      "srdnt": "Hindi Salamat",

      // utils
      "watchAdTitle": "Manood ng ad na ito para i-unlock ang @text mining power sa loob ng @adTime minuto.",
      "watchAdN": "Huwag muna ngayon",
      "watchAdY": "Manood Ngayon",

      // FAQ
      "q1": "Ano ang Bitcoin Cloud Mining?",
      "a1":
          "Ang Bitcoin Cloud Mining ay isang remote na paraan ng pagmimina kung saan ang mga user ay nag-aarkila ng computing power mula sa mga data center upang magmina ng Bitcoin. Inaalis nito ang pangangailangan para sa pisikal na hardware, setup, o pagpapanatili. Ang mga user ay kumikita ng pang-araw-araw na gantimpala batay sa hashrate na binili nila. Ginagawa nitong maginhawa at madaling ma-access na opsyon para sa sinuman na magsimulang magmina.",
      "q3": "Maaari ba akong magmina ng Bitcoin nang malayuan?",
      "a3":
          "Oo, maaari kang magmina ng Bitcoin nang malayuan sa pamamagitan ng cloud mining. Pinapayagan ka nitong mag-arkila ng mining power mula sa mga data center nang walang anumang hardware. Ang proseso ng pagmimina ay tumatakbo sa mga remote server, at nakakatanggap ka ng pang-araw-araw na kita ng Bitcoin batay sa binili mong hashrate.",
      "q4": "Ano ang Hashrate?",
      "a4":
          "Ang Hashrate ay ang sukat ng computing power na ginagamit sa Bitcoin mining. Ito ay kumakatawan sa kung gaano karaming mga kalkulasyon (o “hashes”) ang maaaring gawin ng isang sistema bawat segundo upang malutas ang mga kumplikadong algorithm. Ang mas mataas na hashrate ay nangangahulugang mas mabilis na pagmimina at mas magandang pagkakataon na kumita ng mga gantimpala ng Bitcoin.",
      "q5": "Maaari Ka Bang Kumita ng Kita mula sa Bitcoin Cloud Mining?",
      "a5":
          "Oo, sa tamang plano at tuloy-tuloy na aktibidad sa pagmimina, ang Bitcoin cloud mining ay maaaring makabuo ng tuloy-tuloy na kita. Ang kakayahang kumita ay depende sa iyong hashrate, presyo ng BTC, at tagal ng pagmimina.",
      "q6": "Posible bang Taasan ang Bilis ng Remote na Bitcoin Mining?",
      "a6":
          "Oo, sa pamamagitan ng pag-upgrade ng iyong cloud mining plan sa mas mataas na hashrate, maaari mong palakasin ang bilis ng iyong pagmimina at kumita ng Bitcoin nang mas mahusay.",
      "q7": "Gaano Katagal Bago Maabot ang Withdrawal Limit?",
      "a7":
          "Ang oras na aabutin ay depende sa bilis ng iyong pagmimina (hashrate), uri ng plano, at kung gaano ka ka-konsistent sa pagmimina. Sa mas mataas na hashrate at pang-araw-araw na aktibidad, maraming user ang umaabot sa withdrawal limit sa loob ng ilang linggo hanggang isang buwan.",
      "q8": "Legal ba ang Bitcoin Mining?",
      "a8":
          "Oo, ang Bitcoin mining ay legal sa maraming bansa ngunit pinaghihigpitan o ipinagbabawal sa ilan. Palaging tingnan ang iyong mga lokal na regulasyon bago magmina.",
      "q0": "Ano ang ASIC Cloud?",
      "a0":
          "Ang ASIC Cloud ay tumutukoy sa cloud-based na cryptocurrency mining na gumagamit ng Application-Specific Integrated Circuit (ASIC) miners. Sa halip na bumili at mag-maintain ng mamahaling hardware, maaaring umarkila ang mga user ng mining power mula sa mga professional data center na may mga high-performance na ASIC machine na na-optimize para sa Bitcoin mining.",
      "q9": "Paano ako magsisimula sa pagmimina ng Bitcoin?",
      "a9":
          "Upang magsimulang magmina ng Bitcoin, i-click lamang ang pindutan ng Start Mining at awtomatikong magsisimula ang proseso.",
      "q10": "Maaari ko bang subukan ang Bitcoin mining nang libre?",
      "a10":
          "Oo! Maaaring subukan ng mga bagong user ang pagmimina ng BTC nang libre. Mag-rehistro lang, manood ng mga ad, at magsimulang magmina kaagad.",
    },

    // TODO French Translation
    'fr_FR': {
      // home
      "hmp": "PANNEAU DE MINAGE",
      "hmph": "Processus de minage ?",
      "hmpsub":
          "Pour que votre mineur continue de fonctionner, activez-le quotidiennement. Une fois actif, il mine automatiquement du Bitcoin sur nos serveurs cloud, et vous recevrez des mises à jour en temps réel. La puissance de minage diminue progressivement avec le temps, mais vous pouvez réduire cela en accomplissant des tâches basées sur des publicités. Vous pouvez également augmenter votre puissance de minage en regardant des publicités ou l'augmenter instantanément en achetant un plan de minage.",
      "ham": "Mineurs Actifs",
      "hsmn":
          "Votre minage cloud se mettra en pause lorsque le minuteur se termine. Redémarrez manuellement pour continuer le minage.",
      "hsm": "Démarrer le minage",
      "hab": "Booster Actif",
      "hdr": "Récompense Quotidienne",
      "hdah": "Récompense Publicitaire Quotidienne",
      "hlb": "Verrouiller les BTC minés",
      "hlbsub": "Regardez cette publicité pour verrouiller vos BTC minés en toute sécurité.",
      "hlbssmag": "✅ Verrouillé avec succès !",
      "hdasub":
          "⚡ @dailyReward GH/s Boost Standard Se renouvelle automatiquement toutes les 24 heures — et réclamez votre récompense quotidienne ! 🎁",
      "hadboost": "Publicité & Boost",
      "hqr": "Récompense Rapide",
      "hdqh": "Récompense Publicitaire Rapide",
      "hdqsub":
          "⚡ @quickReward GH/s Récompense Rapide Se renouvelle automatiquement toutes les 4 heures 🔄 — collectez votre récompense rapide à chaque fois ! 🎁",

      // store
      "sm": "Marché",
      "sva": "Voir tout",
      "swAdBoost": "Regarder la publicité & Booster",
      "spn": "Acheter maintenant",
      "spsub":
          "Avec le cloud mining ASIC, vous bénéficiez de faibles coûts énergétiques, d'un équipement entièrement géré dans le cloud et de rendements stables, sans le fardeau des complexités techniques.",

      // wallet
      "wtc": "Total BTC",
      "wmb": "Solde Miné",
      "wrb": "Solde de Parrainage",
      "wpayout": "Paiement",
      "wvh": "Voir l'historique",
      "wbwa": "Adresse du portefeuille BTC",
      "wwl": "Limite de retrait : @btc",
      "wwlError": "Limite de retrait : @btcLimit BTC pour retirer.",
      "wpr": "Demande de Paiement",
      "wnh": "Veuillez lire attentivement avant de continuer.",
      "wnsubone":
          "Les frais de transaction sont nécessaires pour les transactions blockchain et ne sont pas contrôlés par cette plateforme. Les frais peuvent varier en fonction des conditions du réseau blockchain. Veuillez vous référer aux frais spécifiques ; le montant crédité sera le montant du retrait moins les frais de la blockchain. Les frais de transaction pour le réseau BTC et le réseau BEP-20 sont relativement élevés. Vous pouvez vérifier ces frais sur la blockchain.",
      "wnsubtwo":
          "Veuillez vous assurer d'utiliser un portefeuille BTC sécurisé et fiable, et de vérifier deux fois l'adresse du portefeuille pour assurer la sécurité de vos fonds.",
      "wfash": "Terminer la configuration du compte",
      "wfassub": "Terminez la configuration de votre compte en ajoutant les détails requis pour activer les retraits.",
      "wfsb": "Terminer la configuration",
      "wwh": "Votre demande de retrait a été traitée. Les fonds arriveront sous peu.",
      "wwb": "D'accord",
      "wweh": "⚠ Le montant de BTC ne correspond pas !",
      "weem": "Attendu : @massage",
      "wer": "Reçu : @balance",
      "wc": "Fermer",

      // setting
      "sah": "Paramètres",
      "sresub": "Gagnez des BTC gratuits en parrainant des amis — vous obtiendrez @btcValue BTC à chaque fois !",
      "smr": "Historique de minage",
      "svaa": "Voir les ASIC actifs",
      "stm": "Meilleur Mineur",
      "sp": "Profil",
      "sru": "Évaluez-nous",
      "sre": "Parrainer et Gagner",
      "ss": "Partager",
      "sl": "Langue",
      "spp": "Politique de confidentialité",
      "scs": "Support client",
      "slo": "Se déconnecter",
      "sda": "Supprimer le compte",
      "sShareText":
          "⚡ Minez du BTC sans effort avec un minage à haute vitesse ! 📈 Suivez vos gains et boostez vos performances. 🔓 Débloquez des outils premium et gagnez plus vite. 👇 Téléchargez l'application Bitcoin Mining (ASIC Miner) et commencez à miner maintenant : @shareAppLink",
      "sfh": "Retour d'expérience",
      "sfText":
          "Merci de faire partie de la famille Bitcoin Mining (ASIC Miner) ! 🫶 Si vous appréciez votre parcours de minage, nous aimerions votre note ⭐️. Votre avis nous rend plus forts !",
      "sfsb": "Soumettre",
      "slt": "Êtes-vous sûr de vouloir vous déconnecter de votre compte ?",
      "slyb": "Oui",
      "slnb": "Non",
      "sdh": "Êtes-vous sûr de vouloir supprimer votre compte ?",
      "sdsub": "Cela effacera définitivement toutes vos données. Cette action ne peut pas être annulée.",
      "sdstostm": "✅ Votre compte a été supprimé et toutes les données ont été effacées.",
      "sifText":
          "🚀 Rejoignez-moi pour miner du Bitcoin avec cette puissante application Bitcoin Mining (ASIC Miner) ! 💸 Je gagne de la crypto quotidiennement — c'est facile, rapide et gratuit pour commencer. 🎁 Utilisez mon code d'invitation : '@referralCode' pour réclamer votre bonus instantanément. 👇 Appuyez ci-dessous pour télécharger et commencer à miner ensemble : @siAppLink",

      // etc
      "mrEmpty": "Votre parcours de minage n'a pas encore commencé. Commencez à miner aujourd'hui !",
      "mdp": "Progrès Quotidien",
      "aas": "ASIC actifs",
      "aaEmpty": "Aucun Antminer n'a encore été loué — commencez votre première location aujourd'hui !",
      "pnError": "Le nom est requis.",
      "peError": "L'email est requis.",
      "pmnumberError": "Le numéro de téléphone est requis",
      "pwaError": "L'adresse du portefeuille est requise.",
      "pub": "METTRE À JOUR",
      "css": "SOUMETTRE",

      // store info
      "sihd": "Détails du matériel",
      "sitp": "Période de temps",
      "siod": "Détails de la commande",
      "siap": "Activer le plan",
      "sisub":
          "Votre abonnement se renouvelle automatiquement selon votre plan, sauf si vous l'annulez. Vous pouvez le gérer à tout moment dans Google Play.",
      "sissm": "🎉 Félicitations ! Votre @name (@hashrate) a été abonné avec succès pour @day jours.",

      // sing page
      "lh": "Salut ! Bienvenue de retour 👋",
      "lsub": "Un simple toucher pour commencer — connectez-vous avec Google",
      "lcwg": "Continuer avec Google",
      "ltou": "Conditions d'utilisation",
      "lsubText":
          "Cette application ne mine pas de Bitcoin sur votre appareil. Elle simule le minage et permet aux utilisateurs de gérer à distance des mineurs basés sur le cloud.",
      "lrc": "Code de Parrainage",
      "lrsub": "Débloquez des récompenses avec un code de parrainage",
      "lrhint": "Entrez le Code de Parrainage (Facultatif)",
      "lskip": "Passer",
      "lsubmit": "Soumettre",
      "src": "Félicitations",
      "srsubone": "Dans le cadre de notre engagement, nous avons ajouté une récompense gratuite pour vous aider à démarrer",
      "srsubtwo": "un boost de minage cloud sur votre compte !",
      "srls": "Commençons",
      "srdh": "Regardez cette publicité pour réclamer votre bonus de bienvenue BTC gratuit @value dans votre portefeuille.",
      "srdnt": "Non merci",

      // utils
      "watchAdTitle": "Regardez cette publicité pour débloquer la puissance de minage @text pendant @adTime minutes.",
      "watchAdN": "Pas maintenant",
      "watchAdY": "Regarder maintenant",

      // FAQ
      "q1": "Qu'est-ce que le Minage de Bitcoin en Nuage?",
      "a1":
          "Le Minage de Bitcoin en Nuage est une méthode de minage à distance où les utilisateurs louent de la puissance de calcul auprès de centres de données pour miner du Bitcoin. Il élimine le besoin de matériel physique, de configuration ou d'entretien. Les utilisateurs gagnent des récompenses quotidiennes basées sur le taux de hachage qu'ils achètent. Cela en fait une option pratique et accessible pour quiconque souhaite commencer à miner.",
      "q3": "Puis-je miner du Bitcoin à distance?",
      "a3":
          "Oui, vous pouvez miner du Bitcoin à distance via le minage en nuage. Cela vous permet de louer de la puissance de minage auprès de centres de données sans posséder de matériel. Le processus de minage s'exécute sur des serveurs distants, et vous recevez des gains quotidiens en Bitcoin en fonction de votre taux de hachage acheté.",
      "q4": "Qu'est-ce qu'un Taux de Hachage?",
      "a4":
          "Le Taux de Hachage est la mesure de la puissance de calcul utilisée dans le minage de Bitcoin. Il représente le nombre de calculs (ou “hachages”) qu'un système peut effectuer par seconde pour résoudre des algorithmes complexes. Un taux de hachage plus élevé signifie un minage plus rapide et une meilleure chance de gagner des récompenses en Bitcoin.",
      "q5": "Peut-on Gagner de l'Argent avec le Minage de Bitcoin en Nuage?",
      "a5":
          "Oui, avec le bon plan et une activité de minage constante, le minage de Bitcoin en nuage peut générer des gains stables. La rentabilité dépend de votre taux de hachage, du prix du BTC et de la durée du minage.",
      "q6": "Est-il Possible d'Augmenter la Vitesse du Minage de Bitcoin à Distance?",
      "a6":
          "Oui, en passant à un plan de minage en nuage avec un taux de hachage plus élevé, vous pouvez augmenter votre vitesse de minage et gagner du Bitcoin plus efficacement.",
      "q7": "Combien de Temps Faut-il pour Atteindre la Limite de Retrait?",
      "a7":
          "Le temps nécessaire dépend de votre vitesse de minage (taux de hachage), du type de plan et de la constance de votre minage. Avec un taux de hachage plus élevé et une activité quotidienne, de nombreux utilisateurs atteignent la limite de retrait en quelques semaines à un mois.",
      "q8": "Le Minage de Bitcoin est-il Légal?",
      "a8":
          "Oui, le minage de Bitcoin est légal dans de nombreux pays, mais restreint ou interdit dans certains. Vérifiez toujours la réglementation locale avant de miner.",
      "q0": "Qu'est-ce qu'un Cloud ASIC?",
      "a0":
          "Un Cloud ASIC fait référence au minage de cryptomonnaie basé sur le cloud qui utilise des mineurs Application-Specific Integrated Circuit (ASIC). Au lieu d'acheter et d'entretenir du matériel coûteux, les utilisateurs peuvent louer de la puissance de minage auprès de centres de données professionnels équipés de machines ASIC haute performance optimisées pour le minage de Bitcoin.",
      "q9": "Comment puis-je commencer à miner du Bitcoin?",
      "a9":
          "Pour commencer à miner du Bitcoin, cliquez simplement sur le bouton « Démarrer le minage » et le processus commencera automatiquement.",
      "q10": "Puis-je essayer le minage de Bitcoin gratuitement?",
      "a10":
          "Oui ! Les nouveaux utilisateurs peuvent essayer le minage de BTC gratuitement. Il suffit de s'inscrire, de regarder des publicités et de commencer à miner instantanément.",
    },

    // TODO Spanish Translation
    'es_ES': {
      // home
      "hmp": "PANEL DE MINERÍA",
      "hmph": "¿Proceso de minería?",
      "hmpsub":
          "Para mantener tu minero funcionando, actívalo a diario. Una vez activo, automáticamente minará Bitcoin en nuestros servidores en la nube, y recibirás actualizaciones en tiempo real. La potencia de minería disminuye gradualmente con el tiempo, pero puedes reducir esto completando tareas basadas en anuncios. También puedes aumentar tu potencia de minería viendo anuncios o incrementarla instantáneamente comprando un plan de minería.",
      "ham": "Mineros Activos",
      "hsmn": "Tu minería en la nube se pausará cuando el temporizador termine. Reinicia manualmente para seguir minando.",
      "hsm": "Iniciar minería",
      "hab": "Potenciador Activo",
      "hdr": "Recompensa Diaria",
      "hdah": "Recompensa de Anuncios Diaria",
      "hdasub":
          "⚡ @dailyReward GH/s Potenciador Estándar Se renueva automáticamente cada 24 horas — ¡además, reclama tu recompensa diaria! 🎁",
      "hadboost": "Anuncio y Potenciador",
      "hqr": "Recompensa Rápida",
      "hdqh": "Recompensa de Anuncios Rápida",
      "hlb": "Bloquear BTC Minados",
      "hlbsub": "Ve este anuncio para bloquear tus BTC minados de forma segura.",
      "hlbssmag": "✅ ¡Bloqueado con éxito!",
      "hdqsub":
          "⚡ @quickReward GH/s Recompensa Rápida Se renueva automáticamente cada 4 horas 🔄 — ¡recoge tu recompensa rápida cada vez! 🎁",

      // store
      "sm": "Mercado",
      "sva": "Ver todo",
      "swAdBoost": "Ver Anuncio y Potenciador",
      "spn": "Comprar ahora",
      "spsub":
          "Con la minería en la nube ASIC, obtienes la ventaja de bajos costos de energía, equipo completamente gestionado en la nube y rendimientos constantes, sin la carga de las complejidades técnicas.",

      // wallet
      "wtc": "Total de BTC",
      "wmb": "Saldo Minado",
      "wrb": "Saldo de Referidos",
      "wpayout": "Pago",
      "wvh": "Ver Historial",
      "wbwa": "Dirección de la Billetera BTC",
      "wwl": "Límite de retiro: @btc",
      "wwlError": "Límite de retiro: @btcLimit BTC para retirar.",
      "wpr": "Solicitud de Pago",
      "wnh": "Por favor, lee con atención antes de continuar.",
      "wnsubone":
          "Las tarifas de transacción son necesarias para las transacciones de blockchain y no son controladas por esta plataforma. Las tarifas pueden variar según las condiciones de la red blockchain. Por favor, consulta las tarifas específicas; la cantidad acreditada será el monto del retiro menos las tarifas de la blockchain. Las tarifas de transacción para la red BTC y la red BEP-20 son relativamente altas. Puedes verificar estas tarifas en la blockchain.",
      "wnsubtwo":
          "Por favor, asegúrate de usar una billetera BTC segura y confiable, y verifica dos veces la dirección de la billetera para garantizar la seguridad de tus fondos.",
      "wfash": "Terminar la Configuración de la Cuenta",
      "wfassub": "Termina la configuración de tu cuenta agregando los detalles requeridos para habilitar los retiros.",
      "wfsb": "Terminar Configuración",
      "wwh": "Tu solicitud de retiro ha sido procesada. Los fondos llegarán en breve.",
      "wwb": "Aceptar",
      "wweh": "⚠ ¡La cantidad de BTC no coincide!",
      "weem": "Esperado: @massage",
      "wer": "Recibido: @balance",
      "wc": "Cerrar",

      // setting
      "sah": "Configuración",
      "sresub": "Gana BTC gratis refiriendo a amigos — ¡obtendrás @btcValue BTC cada vez!",
      "smr": "Registro de minería",
      "svaa": "Ver ASICs Activos",
      "stm": "Mejor Minero",
      "sp": "Perfil",
      "sru": "Califícanos",
      "sre": "Invita y Gana",
      "ss": "Compartir",
      "sl": "Idioma",
      "spp": "Política de Privacidad",
      "scs": "Soporte al Cliente",
      "slo": "Cerrar Sesión",
      "sda": "Eliminar Cuenta",
      "sShareText":
          "⚡ ¡Mina BTC sin esfuerzo con minería de alta velocidad! 📈 Sigue tus ganancias y potencia el rendimiento. 🔓 Desbloquea herramientas premium y gana más rápido. 👇 Descarga la aplicación Bitcoin Mining (ASIC Miner) y comienza a minar ahora: @shareAppLink",
      "sfh": "Comentarios",
      "sfText":
          "¡Gracias por ser parte de la familia Bitcoin Mining (ASIC Miner)! 🫶 Si estás disfrutando de tu viaje de minería, nos encantaría tu calificación de ⭐️. ¡Tus comentarios nos hacen más fuertes!",
      "sfsb": "Enviar",
      "slt": "¿Estás seguro de que quieres cerrar sesión en tu cuenta?",
      "slyb": "Sí",
      "slnb": "No",
      "sdh": "¿Estás seguro de que quieres eliminar tu cuenta?",
      "sdsub": "Esto borrará permanentemente todos tus datos. Esta acción no se puede deshacer.",
      "sdstostm": "✅ Tu cuenta ha sido eliminada y todos los datos borrados.",
      "sifText":
          "🚀 ¡Únete a mí en la minería de Bitcoin con esta poderosa aplicación Bitcoin Mining (ASIC Miner)! 💸 Estoy ganando criptomonedas a diario — es fácil, rápido y gratis para empezar. 🎁 Usa mi código de invitación: '@referralCode' para reclamar tu bono al instante. 👇 Toca abajo para descargar y comenzar a minar juntos: @siAppLink",

      // etc
      "mrEmpty": "Tu viaje de minería no ha comenzado. ¡Empieza a minar hoy!",
      "mdp": "Progreso Diario",
      "aas": "ASICs Activos",
      "aaEmpty": "Aún no se han alquilado Antminers — ¡inicia tu primer alquiler hoy!",
      "pnError": "El nombre es requerido.",
      "peError": "El correo electrónico es requerido.",
      "pmnumberError": "El número de teléfono es requerido",
      "pwaError": "La dirección de la billetera es requerida.",
      "pub": "ACTUALIZAR",
      "css": "ENVIAR",

      // store info
      "sihd": "Detalles del Hardware",
      "sitp": "Período de Tiempo",
      "siod": "Detalles del Pedido",
      "siap": "Activar Plan",
      "sisub":
          "Tu suscripción se renueva automáticamente según tu plan, a menos que la canceles. Puedes gestionarla en cualquier momento en Google Play.",
      "sissm": "🎉 Hongera! @name (@hashrate) yako imesajiliwa kwa ufanisi kwa siku @day.",

      // sing page
      "lh": "¡Hola! ¡Bienvenido de nuevo 👋",
      "lsub": "Un toque para empezar — inicia sesión con Google",
      "lcwg": "Continuar con Google",
      "ltou": "Términos de Uso",
      "lsubText":
          "Esta aplicación no extrae Bitcoin en tu dispositivo. Simula la minería y permite a los usuarios gestionar de forma remota los mineros basados en la nube.",
      "lrc": "Código de Referencia",
      "lrsub": "Desbloquea Recompensas con un Código de Referencia",
      "lrhint": "Ingresa el Código de Referencia (Opcional)",
      "lskip": "Saltar",
      "lsubmit": "Enviar",
      "src": "¡Felicitaciones",
      "srsubone": "Como parte de nuestro compromiso, hemos añadido una recompensa gratuita para que empieces",
      "srsubtwo": "un impulso de minería en la nube a tu cuenta!",
      "srls": "¡Comencemos",
      "srdh": "Mira este anuncio para reclamar tu bono de bienvenida BTC @value gratuito en tu billetera.",
      "srdnt": "No, gracias",

      // utils
      "watchAdTitle": "Mira este anuncio para desbloquear @text de potencia de minería por @adTime minutos.",
      "watchAdN": "Ahora no",
      "watchAdY": "Ver ahora",

      // FAQ
      "q1": "¿Qué es la Minería de Bitcoin en la Nube?",
      "a1":
          "La Minería de Bitcoin en la Nube es un método de minería remota donde los usuarios alquilan poder de cómputo de centros de datos para minar Bitcoin. Elimina la necesidad de hardware físico, configuración o mantenimiento. Los usuarios ganan recompensas diarias basadas en la tasa de hash que compran. Esto la convierte en una opción conveniente y accesible para que cualquiera comience a minar.",
      "q3": "¿Puedo minar Bitcoin de forma remota?",
      "a3":
          "Sí, puedes minar Bitcoin de forma remota a través de la minería en la nube. Esto te permite alquilar poder de minería de centros de datos sin poseer ningún hardware. El proceso de minería se ejecuta en servidores remotos y recibes ganancias diarias de Bitcoin basadas en tu tasa de hash comprada.",
      "q4": "¿Qué es una Tasa de Hash?",
      "a4":
          "La Tasa de Hash es la medida del poder de cómputo utilizado en la minería de Bitcoin. Representa cuántos cálculos (o “hashes”) puede realizar un sistema por segundo para resolver algoritmos complejos. Una tasa de hash más alta significa una minería más rápida y una mejor oportunidad de ganar recompensas de Bitcoin.",
      "q5": "¿Se Puede Obtener Ganancia de la Minería de Bitcoin en la Nube?",
      "a5":
          "Sí, con el plan adecuado y una actividad de minería consistente, la minería de Bitcoin en la nube puede generar ganancias estables. La rentabilidad depende de tu tasa de hash, el precio de BTC y la duración de la minería.",
      "q6": "¿Es Posible Aumentar la Velocidad de la Minería de Bitcoin Remota?",
      "a6":
          "Sí, al actualizar tu plan de minería en la nube a una tasa de hash más alta, puedes aumentar tu velocidad de minería y ganar Bitcoin de manera más eficiente.",
      "q7": "¿Cuánto Tiempo Tarda en Alcanzar el Límite de Retiro?",
      "a7":
          "El tiempo que tarda depende de tu velocidad de minería (tasa de hash), el tipo de plan y la consistencia con la que mines. Con una tasa de hash más alta y actividad diaria, muchos usuarios alcanzan el límite de retiro en unas pocas semanas a un mes.",
      "q8": "¿Es Legal la Minería de Bitcoin?",
      "a8":
          "Sí, la minería de Bitcoin es legal en muchos países, pero está restringida o prohibida en algunos. Siempre verifica tus regulaciones locales antes de minar.",
      "q0": "¿Qué es una Nube ASIC?",
      "a0":
          "Una Nube ASIC se refiere a la minería de criptomonedas basada en la nube que utiliza mineros de Circuito Integrado de Aplicación Específica (ASIC). En lugar de comprar y mantener hardware costoso, los usuarios pueden alquilar poder de minería de centros de datos profesionales equipados con máquinas ASIC de alto rendimiento optimizadas para la minería de Bitcoin.",
      "q9": "¿Cómo empiezo a minar Bitcoin?",
      "a9":
          "Para empezar a minar Bitcoin, simplemente haz clic en el botón \"Comenzar a minar\" y el proceso comenzará automáticamente.",
      "q10": "¿Puedo probar la minería de Bitcoin gratis?",
      "a10":
          "¡Sí! Los nuevos usuarios pueden probar la minería de BTC gratis. Solo regístrate, mira anuncios y comienza a minar al instante.",
    },

    // TODO Swahili Translation
    'sw_KE': {
      // home
      "hmp": "PANELI YA UCHIMBAJI",
      "hmph": "Mchakato wa Uchimbaji?",
      "hmpsub":
          "Ili kuweka mchimbaji wako akiendelea, muamilishe kila siku. Mara tu akiwa ameilishwa, anachimba Bitcoin kiatomati kwenye seva zetu za wingu, na utapata sasisho za wakati halisi. Nguvu ya uchimbaji inapungua polepole kwa muda, lakini unaweza kupunguza hili kwa kukamilisha kazi zinazotegemea matangazo. Unaweza pia kuongeza nguvu yako ya uchimbaji kwa kutazama matangazo au kuiongeza papo hapo kwa kununua mpango wa uchimbaji.",
      "ham": "Wachimbaji Amilifu",
      "hsmn":
          "Uchimbaji wako wa wingu utasimama kwa muda wakati kipima muda kinamalizika. Anzisha tena kwa mkono ili kuendelea kuchimba.",
      "hsm": "Anza Uchimbaji",
      "hab": "Nyongeza Amilifu",
      "hdr": "Zawadi ya Kila Siku",
      "hdah": "Zawadi ya Matangazo ya Kila Siku",
      "hlb": "Funga BTC Iliyochimbwa",
      "hlbsub": "Tazama tangazo hili ili kufunga BTC yako iliyochimbwa kwa usalama.",
      "hlbssmag": "✅ Imefungwa kwa ufanisi!",
      "hdasub":
          "⚡ @dailyReward GH/s Nyongeza ya Kawaida Inasasishwa kiatomati kila saa 24 — pamoja na kudai zawadi yako ya kila siku! 🎁",
      "hadboost": "Tangazo & Nyongeza",
      "hqr": "Zawadi ya Haraka",
      "hdqh": "Zawadi ya Matangazo ya Haraka",
      "hdqsub":
          "⚡ @quickReward GH/s Zawadi ya Haraka Inasasishwa kiatomati kila saa 4 🔄 — kusanya zawadi yako ya haraka kila wakati! 🎁",

      // store
      "sm": "Soko",
      "sva": "Tazama Zote",
      "swAdBoost": "Tazama Tangazo & Nyongeza",
      "spn": "Nunua Sasa",
      "spsub":
          "Ukiwa na uchimbaji madini wa wingu wa ASIC, unapata faida ya gharama za chini za nishati, vifaa vinavyosimamiwa kikamilifu kwenye wingu, na mapato thabiti—bila mzigo wa matatizo ya kiufundi.",

      // wallet
      "wtc": "Jumla ya BTC",
      "wmb": "Salio Lililochimbwa",
      "wrb": "Salio la Rufaa",
      "wpayout": "Malipo",
      "wvh": "Tazama Historia",
      "wbwa": "Anwani ya Wallet ya BTC",
      "wwl": "Kikomo cha kutoa: @btc",
      "wwlError": "Kikomo cha kutoa: @btcLimit BTC ili kutoa.",
      "wpr": "Ombi la Malipo",
      "wnh": "Tafadhali soma kwa makini kabla ya kuendelea.",
      "wnsubone":
          "Ada za muamala ni muhimu kwa miamala ya blockchain na haidhibitiwi na jukwaa hili. Ada zinaweza kutofautiana kulingana na hali ya mtandao wa blockchain. Tafadhali rejelea ada maalum; kiasi kilichokreditishwa kitakuwa kiasi cha kutoa kikiondolewa ada za blockchain. Ada za muamala kwa mtandao wa BTC na mtandao wa BEP-20 ni za juu kiasi. Unaweza kuthibitisha ada hizi kwenye blockchain.",
      "wnsubtwo":
          "Tafadhali hakikisha unatumia wallet ya BTC salama na ya kuaminika, na angalia mara mbili anwani ya wallet ili kuhakikisha usalama wa pesa zako.",
      "wfash": "Kamilisha Usanidi wa Akaunti",
      "wfassub": "Kamilisha usanidi wa akaunti yako kwa kuongeza maelezo yanayohitajika ili kuwezesha utoaji.",
      "wfsb": "Kamilisha Usanidi",
      "wwh": "Ombi lako la kutoa limeshughulikiwa. Pesa zitafika hivi karibuni.",
      "wwb": "Sawa",
      "wweh": "⚠ Kiasi cha BTC hakilingani!",
      "weem": "Inatarajiwa: @massage",
      "wer": "Imepokelewa: @balance",
      "wc": "Funga",

      // setting
      "sah": "Mipangilio",
      "sresub": "Pata BTC bila malipo kwa kuwarejelea marafiki — utapata @btcValue BTC kila mara!",
      "smr": "Rekodi ya Uchimbaji",
      "svaa": "Tazama ASICs Amilifu",
      "stm": "Mchimbaji Mkuu",
      "sp": "Profaili",
      "sru": "Tukadiria",
      "sre": "Rejea & Pata",
      "ss": "Shiriki",
      "sl": "Lugha",
      "spp": "Sera ya Faragha",
      "scs": "Usaidizi kwa Wateja",
      "slo": "Toka",
      "sda": "Futa Akaunti",
      "sShareText":
          "⚡ Chimba BTC bila shida na uchimbaji wa kasi kubwa! 📈 Fuatilia mapato yako na ongeza utendaji. 🔓 Fungua zana za kulipia na upate mapato haraka. 👇 Pakua programu ya Bitcoin Mining (ASIC Miner) na uanze kuchimba sasa: @shareAppLink",
      "sfh": "Maoni",
      "sfText":
          "Asante kwa kuwa sehemu ya familia ya Bitcoin Mining (ASIC Miner)! 🫶 Ikiwa unafurahia safari yako ya uchimbaji, tungependa kupata alama yako ya ⭐️. Maoni yako yanatufanya kuwa na nguvu zaidi!",
      "sfsb": "Wasilisha",
      "slt": "Una uhakika unataka kutoka kwenye akaunti yako?",
      "slyb": "Ndio",
      "slnb": "Hapana",
      "sdh": "Una uhakika unataka kufuta akaunti yako?",
      "sdsub": "Hii itafuta kabisa data zako zote. Kitendo hiki hakiwezi kufutwa.",
      "sdstostm": "✅ Akaunti yako imefutwa na data zote zimefutwa.",
      "sifText":
          "🚀 Jiunge nami katika uchimbaji wa Bitcoin na programu hii yenye nguvu ya Bitcoin Mining (ASIC Miner)! 💸 Ninapata crypto kila siku — ni rahisi, haraka, na bila malipo kuanza. 🎁 Tumia nambari yangu ya mwaliko: '@referralCode' ili kudai bonasi yako papo hapo. 👇 Gusa hapa chini kupakua na kuanza kuchimba pamoja: @siAppLink",

      // etc
      "mrEmpty": "Safari yako ya uchimbaji bado haijaanza. Anza kuchimba leo!",
      "mdp": "Maendeleo ya Kila Siku",
      "aas": "ASICs Amilifu",
      "aaEmpty": "Hakuna Antminers iliyokodishwa bado — anza ukodishaji wako wa kwanza leo!",
      "pnError": "Jina linahitajika.",
      "peError": "Barua pepe inahitajika.",
      "pmnumberError": "Nambari ya simu inahitajika",
      "pwaError": "Anwani ya wallet inahitajika.",
      "pub": "SASISHA",
      "css": "WASILISHA",

      // store info
      "sihd": "Maelezo ya Vifaa",
      "sitp": "Kipindi cha Muda",
      "siod": "Maelezo ya Agizo",
      "siap": "Amilisha Mpango",
      "sisub":
          "Usajili wako unasasishwa kiatomati kulingana na mpango wako, isipokuwa ughairi. Unaweza kuidhibiti wakati wowote katika Google Play.",
      "sissm": "🎉 Barka da zaɓe! An yi rijistar @name (@hashrate) ɗinka cikin nasara na tsawon kwanaki @day.",

      // sing page
      "lh": "Hujambo! Karibu tena 👋",
      "lsub": "Gusa mara moja ili kuanza — ingia na Google",
      "lcwg": "Endelea na Google",
      "ltou": "Masharti ya Matumizi",
      "lsubText":
          "Programu hii haichimbui Bitcoin kwenye kifaa chako. Inaiga uchimbaji madini na inaruhusu watumiaji kudhibiti kwa mbali vichimbaji vilivyoko kwenye wingu.",
      "lrc": "Nambari ya Rufaa",
      "lrsub": "Fungua Zawadi na Nambari ya Rufaa",
      "lrhint": "Weka Nambari ya Rufaa (Hiari)",
      "lskip": "Ruka",
      "lsubmit": "Tuma",
      "src": "Hongera",
      "srsubone": "Kama sehemu ya ahadi yetu, tumeongeza zawadi ya bure ili kukuanzisha ",
      "srsubtwo": " nyongeza ya uchimbaji wa wingu kwenye akaunti yako!",
      "srls": "Tuanze",
      "srdh": "Tazama tangazo hili ili kudai bonasi yako ya bure ya kukaribisha ya BTC @value katika wallet yako.",
      "srdnt": "Hapana, Asante",

      // utils
      "watchAdTitle": "Tazama tangazo hili ili kufungua nguvu ya uchimbaji ya @text kwa dakika @adTime.",
      "watchAdN": "Sio sasa",
      "watchAdY": "Tazama Sasa",

      // FAQ
      "q1": "Uchimbaji Madini wa Wingu wa Bitcoin ni nini?",
      "a1":
          "Uchimbaji Madini wa Wingu wa Bitcoin ni njia ya uchimbaji wa mbali ambapo watumiaji hukodisha nguvu ya kompyuta kutoka kwa vituo vya data ili kuchimba Bitcoin. Inaondoa hitaji la vifaa vya kimwili, usanidi, au matengenezo. Watumiaji hupata malipo ya kila siku kulingana na kasi ya hashi wanayoinunua. Hii inafanya kuwa chaguo rahisi na linalopatikana kwa mtu yeyote kuanza uchimbaji.",
      "q3": "Je, ninaweza kuchimba Bitcoin kwa mbali?",
      "a3":
          "Ndiyo, unaweza kuchimba Bitcoin kwa mbali kupitia uchimbaji wa wingu. Hii inakuwezesha kukodisha nguvu ya uchimbaji kutoka kwa vituo vya data bila kumiliki vifaa vyovyote. Mchakato wa uchimbaji huendeshwa kwenye seva za mbali, na unapokea mapato ya kila siku ya Bitcoin kulingana na kasi yako ya hashi uliyonunua.",
      "q4": "Hashrate ni nini?",
      "a4":
          "Hashrate ni kipimo cha nguvu ya kompyuta inayotumika katika uchimbaji wa Bitcoin. Inawakilisha ni hesabu ngapi (au “hashes”) mfumo unaweza kufanya kwa sekunde ili kutatua algorithms ngumu. Hashrate ya juu inamaanisha uchimbaji wa haraka na nafasi bora ya kupata malipo ya Bitcoin.",
      "q5": "Je, Unaweza Kupata Faida Kutoka kwa Uchimbaji Madini wa Wingu wa Bitcoin?",
      "a5":
          "Ndiyo, kwa mpango sahihi na shughuli ya uchimbaji thabiti, uchimbaji madini wa wingu wa Bitcoin unaweza kutoa mapato ya uhakika. Faida inategemea hashrate yako, bei ya BTC, na muda wa uchimbaji.",
      "q6": "Je, Inawezekana Kuongeza Kasi ya Uchimbaji Madini wa Bitcoin wa Mbali?",
      "a6":
          "Ndiyo, kwa kuboresha mpango wako wa uchimbaji wa wingu hadi hashrate ya juu, unaweza kuongeza kasi yako ya uchimbaji na kupata Bitcoin kwa ufanisi zaidi.",
      "q7": "Itachukua Muda Gani Kufikia Kikomo cha Utoaji?",
      "a7":
          "Muda unaochukua unategemea kasi yako ya uchimbaji (hashrate), aina ya mpango, na jinsi unavyochimba mara kwa mara. Kwa hashrate ya juu na shughuli za kila siku, watumiaji wengi hufikia kikomo cha utoaji ndani ya wiki chache hadi mwezi mmoja.",
      "q8": "Je, Uchimbaji Madini wa Bitcoin ni Halali?",
      "a8":
          "Ndiyo, uchimbaji madini wa Bitcoin ni halali katika nchi nyingi lakini umewekewa vikwazo au kupigwa marufuku katika baadhi. Daima angalia kanuni zako za eneo kabla ya uchimbaji.",
      "q0": "ASIC Cloud ni nini?",
      "a0":
          "ASIC Cloud inarejelea uchimbaji madini ya cryptocurrency unaotegemea wingu unaotumia wachimbaji wa Application-Specific Integrated Circuit (ASIC). Badala ya kununua na kudumisha vifaa vya gharama kubwa, watumiaji wanaweza kukodisha nguvu ya uchimbaji kutoka kwa vituo vya data vya kitaalamu vilivyo na mashine za ASIC za utendaji wa juu zilizoboreshwa kwa ajili ya uchimbaji wa Bitcoin.",
      "q9": "Ninawezaje kuanza uchimbaji wa Bitcoin?",
      "a9": "Ili kuanza uchimbaji wa Bitcoin, bonyeza tu kitufe cha \"Anza Uchimbaji\" na mchakato utaanza moja kwa moja.",
      "q10": "Je, ninaweza kujaribu uchimbaji wa Bitcoin bila malipo?",
      "a10":
          "Ndiyo! Watumiaji wapya wanaweza kujaribu uchimbaji wa BTC bila malipo. Jisajili tu, tazama matangazo, na uanze uchimbaji mara moja.",
    },

    // TODO Hausa Translation
    'ha_NG': {
      // home
      "hmp": "PANEL DIN HAKA",
      "hmph": "Tsarin Haka?",
      "hmpsub":
          "Don ci gaba da aikin mai hakarka, kunna shi kowace rana. Da zarar ya yi aiki, yana atomatik yana hako Bitcoin a kan sabobin gajimare, kuma za ka samu sabbin bayanai a ainihin lokaci. Ƙarfin hakar yana raguwa a hankali a kan lokaci, amma za ka iya rage wannan ta hanyar kammala ayyuka na tushen talla. Hakanan za ka iya haɓaka ƙarfin hakar ka ta hanyar kallon talla ko ƙara shi nan da nan ta hanyar siyan shirin hakar.",
      "ham": "Masu Haka Masu Aiki",
      "hsmn":
          "Hakar gajimare za ta tsaya na ɗan lokaci lokacin da mai ƙidayar lokaci ya ƙare. Fara da hannu don ci gaba da hakar.",
      "hsm": "Fara Haka",
      "hab": "Mai haɓaka Mai Aiki",
      "hdr": "Ganiyar Yau da Kullum",
      "hdah": "Ganiyar Talla na Yau da Kullum",
      "hlb": "Kulle BTC da Aka Yi Ma'adininsa",
      "hlbsub": "Kalli wannan talla don kulle BTC da aka yi ma'adininsa lafiya.",
      "hlbssmag": "✅ An yi nasarar kulle shi!",
      "hdasub":
          "⚡ @dailyReward GH/s Standard Boost Yana sabuntawa atomatik kowace sa'o'i 24 — da kuma nemi ganiyar ka ta yau da kullum! 🎁",
      "hadboost": "Talla & Haɓaka",
      "hqr": "Ganiyar Gaggawa",
      "hdqh": "Ganiyar Talla Gaggawa",
      "hdqsub":
          "⚡ @quickReward GH/s Ganiyar Gaggawa Yana sabuntawa atomatik kowace sa'o'i 4 🔄 — karbi ganiyar ka gaggawa a kowane lokaci! 🎁",

      // store
      "sm": "Kasuwa",
      "sva": "Duba Duka",
      "swAdBoost": "Kalli Talla & Haɓaka",
      "spn": "Saya Yanzu",
      "spsub":
          "Tare da ma'adanar girgije na ASIC, kuna samun amfanin ƙananan kuɗin makamashi, cikakken sarrafa kayan aiki a cikin girgije, da dawowar daidaito—ba tare da nauyin rikitarwa na fasaha ba.",

      // wallet
      "wtc": "Jimillar BTC",
      "wmb": "Mined Balance",
      "wrb": "Referral Balance",
      "wpayout": "Biya",
      "wvh": "Duba Tarihi",
      "wbwa": "Adireshin Wallet na BTC",
      "wwl": "Iyakacin cirewa: @btc",
      "wwlError": "Iyakacin cirewa: @btcLimit BTC don cirewa.",
      "wpr": "Buƙatar Biya",
      "wnh": "Da fatan za a karanta a hankali kafin ci gaba.",
      "wnsubone":
          "Kudin ma'amala suna da mahimmanci ga ma'amaloli na blockchain kuma ba wannan dandalin ke sarrafa su ba. Kudin na iya bambanta dangane da yanayin hanyar sadarwa ta blockchain. Da fatan za a koma ga takamaiman kuɗin; adadin da aka ƙididdiga zai zama adadin cirewa dikar da kuɗin blockchain. Kudin ma'amala don hanyar sadarwa ta BTC da BEP-20 suna da yawa. Kuna iya tabbatar da waɗannan kudade a kan blockchain.",
      "wnsubtwo":
          "Da fatan za a tabbatar ka yi amfani da amintaccen da ingantaccen walat na BTC, kuma duba adireshin walat sau biyu don tabbatar da amincin kuɗin ka.",
      "wfash": "Kammala Tsarin Asusun",
      "wfassub": "Kammala tsarin asusun ka ta hanyar ƙara bayanan da ake buƙata don ba da damar cirewa.",
      "wfsb": "Kammala Tsarin",
      "wwh": "An sarrafa buƙatar cirewar ka. Kudin zai isa nan ba da jimawa ba.",
      "wwb": "Lafiya",
      "wweh": "⚠ Adadin BTC bai dace ba!",
      "weem": "Wanda aka sa ran: @massage",
      "wer": "Wanda aka karɓa: @balance",
      "wc": "Rufe",

      // setting
      "sah": "Saiti",
      "sresub": "Samu BTC kyauta ta hanyar tura abokai — za ka samu @btcValue BTC kowane lokaci!",
      "smr": "Tarihin Haka",
      "svaa": "Duba ASIC masu Aiki",
      "stm": "Babban Mai Haka",
      "sp": "Furofil",
      "sru": "Kimanta Mu",
      "sre": "Kira & Samun",
      "ss": "Raba",
      "sl": "Harshe",
      "spp": "Dokar Sirri",
      "scs": "Tallafin Abokin ciniki",
      "slo": "Fita",
      "sda": "Goge Asusun",
      "sShareText":
          "⚡ Haka BTC ba tare da wahala ba tare da hakar mai sauri! 📈 Bibiyi abin da ka samu da haɓaka aiki. 🔓 Buɗe kayan aikin premium da samun kudi da sauri. 👇 Zazzage app na Bitcoin Mining (ASIC Miner) kuma fara hakar yanzu: @shareAppLink",
      "sfh": "Ra'ayi",
      "sfText":
          "Na gode da kasancewa a cikin iyalin Bitcoin Mining (ASIC Miner)! 🫶 Idan kana jin daɗin tafiyar hakar ka, muna so mu ga kimar ⭐️ ka. Ra'ayin ka yana sa mu ƙara ƙarfi!",
      "sfsb": "Aika",
      "slt": "Kana da tabbacin kana so ka fita daga asusun ka?",
      "slyb": "Iya",
      "slnb": "A'a",
      "sdh": "Kana da tabbacin kana so ka goge asusun ka?",
      "sdsub": "Wannan zai goge duk bayanan ka har abada. Wannan aikin ba za a iya janye shi ba.",
      "sdstostm": "✅ An goge asusun ka kuma an share duk bayanan.",
      "sifText":
          "🚀 Ka shiga hakar Bitcoin tare da ni da wannan app na Bitcoin Mining (ASIC Miner) mai ƙarfi! 💸 Ina samun crypto kowace rana — yana da sauƙi, mai sauri, kuma kyauta don farawa. 🎁 Yi amfani da lambar gayyata ta: '@referralCode' don nemi bonus ɗin ka nan take. 👇 Danna ƙasa don zazzagewa da fara hakar tare: @siAppLink",

      // etc
      "mrEmpty": "Tafiyar hakar ka ba ta fara ba. Fara hakar yau!",
      "mdp": "Ci gaba na Yau da Kullum",
      "aas": "ASIC masu Aiki",
      "aaEmpty": "Ba a hayar Antminers ba tukuna — fara hayar ka ta farko yau!",
      "pnError": "Ana buƙatar suna.",
      "peError": "Ana buƙatar imel.",
      "pmnumberError": "Ana buƙatar lambar waya",
      "pwaError": "Ana buƙatar adireshin walat.",
      "pub": "SABUNTA",
      "css": "Aika",

      // store info
      "sihd": "Bayanan Kayan Aiki",
      "sitp": "Tsawon Lokaci",
      "siod": "Bayanan Oda",
      "siap": "Kunna Shirin",
      "sisub":
          "Biyan kuɗin ka yana sabuntawa atomatik bisa ga shirin ka, sai dai idan ka soke shi. Kuna iya sarrafa shi a kowane lokaci a Google Play.",
      "sissm": "🎉 Parabéns! O seu @name (@hashrate) foi Subscrito com Sucesso por @day dias.",

      // sing page
      "lh": "Sannu! Barka da dawowa 👋",
      "lsub": "Danna sau ɗaya don farawa — shiga tare da Google",
      "lcwg": "Ci gaba da Google",
      "ltou": "Sharuɗɗan Amfani",
      "lsubText":
          "Wannan manhajar ba ta hakar Bitcoin a kan na'urarka. Tana kwaikwayon aikin hakar ne kuma tana bawa masu amfani damar sarrafa na'urorin hakar da suke a yanar gizo.",
      "lrc": "Koodun Gayyata",
      "lrsub": "Buɗe Lada tare da Koodun Gayyata",
      "lrhint": "Shigar da Koodun Gayyata (Na zaɓi)",
      "lskip": "Tsallaka",
      "lsubmit": "Aika",
      "src": "Barka",
      "srsubone": "A matsayin ɓangare na alƙawarin mu, mun ƙara lada na kyauta don sa ka fara",
      "srsubtwo": "ƙarfin mining na gajimare a account ɗinka!",
      "srls": "Mu fara",
      "srdh": "Kalli wannan tallan don karɓar bonus ɗinka na kyauta na BTC @value a wallet ɗinka.",
      "srdnt": "A'a, godiya",

      // utils
      "watchAdTitle": "Kalli wannan tallar don buɗe ƙarfin hakar @text na @adTime mintuna.",
      "watchAdN": "Ba yanzu ba",
      "watchAdY": "Kalli Yanzu",

      // FAQ
      "q1": "Menene Ma'adinan Girgije na Bitcoin?",
      "a1":
          "Ma'adinan Girgije na Bitcoin hanya ce ta hakar ma'adinai mai nisa inda masu amfani ke hayar ikon sarrafawa daga cibiyoyin bayanai don hakar ma'adinai na Bitcoin. Yana kawar da buƙatar kayan aiki na zahiri, saitawa, ko kiyayewa. Masu amfani suna samun lada na yau da kullun dangane da yawan hasashin da suka saya. Wannan yana sa ya zama zaɓi mai sauƙi da araha ga kowa ya fara hakar ma'adinai.",
      "q3": "Zan iya hakar Bitcoin a nesa?",
      "a3":
          "Haka ne, za ka iya hakar Bitcoin a nesa ta hanyar ma'adinan girgije. Wannan yana ba ka damar hayar ikon hakar ma'adinai daga cibiyoyin bayanai ba tare da mallakar wani kayan aiki ba. Tsarin hakar ma'adinai yana gudana a kan sabobin nesa, kuma kana karɓar kuɗin Bitcoin na yau da kullun dangane da yawan hasashin da ka saya.",
      "q4": "Menene Hashrate?",
      "a4":
          "Hashrate shine ma'aunin ikon sarrafawa da ake amfani da shi a cikin hakar ma'adinai na Bitcoin. Yana wakiltar yawan lissafin (ko “hashes”) da tsarin zai iya yi a sakan guda don warware rikitarwa algorithms. Hashrate mafi girma yana nufin hakar ma'adinai mafi sauri da kuma damar samun lada na Bitcoin.",
      "q5": "Shin Za Ka Iya Samun Riba Daga Ma'adinan Girgije na Bitcoin?",
      "a5":
          "Haka ne, tare da tsarin da ya dace da kuma aikin hakar ma'adinai mai daidaito, ma'adinan girgije na Bitcoin na iya samar da kuɗi mai daidaito. Riba ta dogara ne akan yawan hasashin ka, farashin BTC, da kuma tsawon lokacin hakar ma'adinai.",
      "q6": "Shin Zai Yiwu a Kara Saurin Hakar Ma'adinai na Bitcoin na Nesa?",
      "a6":
          "Haka ne, ta hanyar haɓaka tsarin ma'adinan girgije zuwa yawan hasashi mafi girma, za ka iya haɓaka saurin hakar ma'adinai da samun Bitcoin da inganci.",
      "q7": "Yaya tsawon lokacin da za a ɗauka don Isa iyakar Cirewa?",
      "a7":
          "Lokacin da zai ɗauka ya dogara ne akan saurin hakar ma'adinai (yawan hashashin), nau'in tsari, da kuma yadda kake hakar ma'adinai a kai a kai. Tare da yawan hasashi mafi girma da aikin yau da kullun, yawancin masu amfani suna isa iyakar cirewa a cikin 'yan makonni zuwa wata guda.",
      "q8": "Shin Hakar Ma'adinai na Bitcoin Halal ne?",
      "a8":
          "Haka ne, hakar ma'adinai na Bitcoin halal ne a kasashe da yawa amma an hana ko an takura shi a wasu. Kullum ka duba dokokin gida kafin hakar ma'adinai.",
      "q0": "Menene ASIC Cloud?",
      "a0":
          "ASIC Cloud yana nufin ma'adanar cryptocurrency na girgije wanda ke amfani da masu hakar ma'adinai na Application-Specific Integrated Circuit (ASIC). Maimakon siyan da kiyaye kayan aiki masu tsada, masu amfani za su iya hayar ikon hakar ma'adinai daga cibiyoyin bayanai na ƙwararru waɗanda ke da na'urorin ASIC masu girma waɗanda aka inganta don hakar ma'adinai na Bitcoin.",
      "q9": "Yaya zan fara hakar ma'adinai na Bitcoin?",
      "a9": "Don fara hakar ma'adinai na Bitcoin, kawai danna maɓallin \"Start Mining\" kuma tsarin zai fara ta atomatik.",
      "q10": "Zan iya gwada hakar ma'adinai na Bitcoin kyauta?",
      "a10":
          "Haka ne! Sabbin masu amfani za su iya gwada hakar BTC kyauta. Kawai yi rijista, kalli tallace-tallace, kuma fara hakar ma'adinai nan take.",
    },

    // TODO Portuguese Translation
    'pt_PT': {
      // home
      "hmp": "PAINEL DE MINERAÇÃO",
      "hmph": "Processo de Mineração?",
      "hmpsub":
          "Para manter seu minerador funcionando, ative-o diariamente. Uma vez ativo, ele minera Bitcoin automaticamente em nossos servidores na nuvem, e você receberá atualizações em tempo real. O poder de mineração diminui gradualmente com o tempo, mas você pode reduzir isso completando tarefas baseadas em anúncios. Você também pode aumentar seu poder de mineração assistindo a anúncios ou aumentá-lo instantaneamente comprando um plano de mineração.",
      "ham": "Mineradores Ativos",
      "hsmn": "Sua mineração na nuvem será pausada quando o cronômetro terminar. Reinicie manualmente para continuar minerando.",
      "hsm": "Iniciar Mineração",
      "hab": "Potencializador Ativo",
      "hdr": "Recompensa Diária",
      "hdah": "Recompensa de Anúncios Diária",
      "hlb": "Bloquear BTC Minerado",
      "hlbsub": "Assista a este anúncio para bloquear seu BTC minerado com segurança.",
      "hlbssmag": "✅ Bloqueado com sucesso!",
      "hdasub":
          "⚡ @dailyReward GH/s Potencializador Padrão Renova automaticamente a cada 24 horas — e resgate sua recompensa diária! 🎁",
      "hadboost": "Anúncio e Potencializador",
      "hqr": "Recompensa Rápida",
      "hdqh": "Recompensa de Anúncios Rápida",
      "hdqsub":
          "⚡ @quickReward GH/s Recompensa Rápida Renova automaticamente a cada 4 horas 🔄 — colete sua recompensa rápida a cada vez! 🎁",

      // store
      "sm": "Mercado",
      "sva": "Ver Tudo",
      "swAdBoost": "Assistir Anúncio e Potencializar",
      "spn": "Comprar Agora",
      "spsub":
          "Com a mineração em nuvem ASIC, você obtém a vantagem de baixos custos de energia, equipamento totalmente gerido na nuvem e retornos estáveis—sem a carga das complexidades técnicas.",

      // wallet
      "wtc": "Total de BTC",
      "wmb": "Saldo Minado",
      "wrb": "Saldo de Referência",
      "wpayout": "Pagamento",
      "wvh": "Ver Histórico",
      "wbwa": "Endereço da Carteira BTC",
      "wwl": "Limite de saque: @btc",
      "wwlError": "Limite de saque: @btcLimit BTC para sacar.",
      "wpr": "Solicitação de Pagamento",
      "wnh": "Por favor, leia atentamente antes de prosseguir.",
      "wnsubone":
          "As taxas de transação são necessárias para as transações de blockchain e não são controladas por esta plataforma. As taxas podem variar com base nas condições da rede blockchain. Por favor, consulte as taxas específicas; o valor creditado será o valor do saque menos as taxas da blockchain. As taxas de transação para a rede BTC e a rede BEP-20 são relativamente altas. Você pode verificar essas taxas na blockchain.",
      "wnsubtwo":
          "Por favor, certifique-se de usar uma carteira BTC segura e confiável, e verifique duas vezes o endereço da carteira para garantir a segurança dos seus fundos.",
      "wfash": "Concluir Configuração da Conta",
      "wfassub": "Conclua a configuração da sua conta adicionando os detalhes necessários para habilitar os saques.",
      "wfsb": "Concluir Configuração",
      "wwh": "Sua solicitação de saque foi processada. Os fundos chegarão em breve.",
      "wwb": "OK",
      "wweh": "⚠ O valor do BTC não corresponde!",
      "weem": "Esperado: @massage",
      "wer": "Recebido: @balance",
      "wc": "Fechar",

      // setting
      "sah": "Configurações",
      "sresub": "Ganhe BTC grátis indicando amigos — você receberá @btcValue BTC a cada vez!",
      "smr": "Registro de Mineração",
      "svaa": "Ver ASICs Ativos",
      "stm": "Melhor Minerador",
      "sp": "Perfil",
      "sru": "Avalie-nos",
      "sre": "Indique e Ganhe",
      "ss": "Compartilhar",
      "sl": "Idioma",
      "spp": "Política de Privacidade",
      "scs": "Suporte ao Cliente",
      "slo": "Sair",
      "sda": "Excluir Conta",
      "sShareText":
          "⚡ Minere BTC sem esforço com mineração de alta velocidade! 📈 Acompanhe seus ganhos e aumente o desempenho. 🔓 Desbloqueie ferramentas premium e ganhe mais rápido. 👇 Baixe o aplicativo Bitcoin Mining (ASIC Miner) e comece a minerar agora: @shareAppLink",
      "sfh": "Feedback",
      "sfText":
          "Obrigado por fazer parte da família Bitcoin Mining (ASIC Miner)! 🫶 Se você está gostando da sua jornada de mineração, adoraríamos sua avaliação ⭐️. Seu feedback nos torna mais fortes!",
      "sfsb": "Enviar",
      "slt": "Tem certeza de que deseja sair da sua conta?",
      "slyb": "Sim",
      "slnb": "Não",
      "sdh": "Tem certeza de que deseja excluir sua conta?",
      "sdsub": "Isso apagará permanentemente todos os seus dados. Esta ação não pode ser desfeita.",
      "sdstostm": "✅ Sua conta foi excluída e todos os dados foram apagados.",
      "sifText":
          "🚀 Junte-se a mim na mineração de Bitcoin com este poderoso aplicativo Bitcoin Mining (ASIC Miner)! 💸 Estou ganhando criptomoedas diariamente — é fácil, rápido e grátis para começar. 🎁 Use meu código de convite: '@referralCode' para reivindicar seu bônus instantaneamente. 👇 Toque abaixo para baixar e começar a minerar juntos: @siAppLink",

      // etc
      "mrEmpty": "Sua jornada de mineração ainda não começou. Comece a minerar hoje!",
      "mdp": "Progresso Diário",
      "aas": "ASICs Ativos",
      "aaEmpty": "Nenhum Antminer alugado ainda — comece seu primeiro aluguel hoje!",
      "pnError": "O nome é obrigatório.",
      "peError": "O e-mail é obrigatório.",
      "pmnumberError": "O número de telefone é obrigatório",
      "pwaError": "O endereço da carteira é obrigatório.",
      "pub": "ATUALIZAR",
      "css": "ENVIAR",

      // store info
      "sihd": "Detalhes do Hardware",
      "sitp": "Período de Tempo",
      "siod": "Detalhes do Pedido",
      "siap": "Ativar Plano",
      "sisub":
          "Sua assinatura é renovada automaticamente de acordo com o seu plano, a menos que você a cancele. Você pode gerenciá-la a qualquer momento no Google Play.",

      // sing page
      "lh": "Olá! Bem-vindo de volta 👋",
      "lsub": "Um toque para começar — entre com o Google",
      "lcwg": "Continuar com o Google",
      "ltou": "Termos de Uso",
      "lsubText":
          "Este aplicativo não minera Bitcoin no seu dispositivo. Ele simula a mineração e permite que os usuários gerenciem remotamente os mineradores baseados em nuvem.",
      "lrc": "Código de Referência",
      "lrsub": "Desbloqueie Recompensas com um Código de Referência",
      "lrhint": "Digite o Código de Referência (Opcional)",
      "lskip": "Pular",
      "lsubmit": "Enviar",
      "src": "Parabéns",
      "srsubone": "Como parte de nosso compromisso, adicionamos uma recompensa gratuita para você começar",
      "srsubtwo": "uma potência de mineração na nuvem para sua conta!",
      "srls": "Vamos Começar",
      "srdh": "Assista a este anúncio para resgatar seu bônus de boas-vindas BTC @value gratuito em sua carteira.",
      "srdnt": "Não, obrigado",

      // utils
      "watchAdTitle": "Assista a este anúncio para desbloquear @text de poder de mineração por @adTime minutos.",
      "watchAdN": "Agora não",
      "watchAdY": "Assistir Agora",

      // FAQ
      "q1": "O que é Mineração de Bitcoin na Nuvem?",
      "a1":
          "A Mineração de Bitcoin na Nuvem é um método de mineração remota onde os usuários alugam poder de computação de centros de dados para minerar Bitcoin. Isso elimina a necessidade de hardware físico, configuração ou manutenção. Os usuários ganham recompensas diárias com base na taxa de hash que compram. Isso a torna uma opção conveniente e acessível para qualquer pessoa começar a minerar.",
      "q3": "Posso minerar Bitcoin remotamente?",
      "a3":
          "Sim, você pode minerar Bitcoin remotamente através da mineração na nuvem. Isso permite que você alugue poder de mineração de centros de dados sem possuir nenhum hardware. O processo de mineração é executado em servidores remotos, e você recebe ganhos diários de Bitcoin com base na sua taxa de hash comprada.",
      "q4": "O que é uma Taxa de Hash?",
      "a4":
          "A Taxa de Hash é a medida do poder de computação usado na mineração de Bitcoin. Ela representa quantas cálculos (ou “hashes”) um sistema pode realizar por segundo para resolver algoritmos complexos. Uma taxa de hash mais alta significa uma mineração mais rápida e uma melhor chance de ganhar recompensas de Bitcoin.",
      "q5": "É Possível Obter Lucro com a Mineração de Bitcoin na Nuvem?",
      "a5":
          "Sim, com o plano certo e atividade de mineração consistente, a mineração de Bitcoin na nuvem pode gerar ganhos estáveis. A lucratividade depende da sua taxa de hash, do preço do BTC e da duração da mineração.",
      "q6": "É Possível Aumentar a Velocidade da Mineração de Bitcoin Remota?",
      "a6":
          "Sim, ao atualizar seu plano de mineração na nuvem para uma taxa de hash mais alta, você pode aumentar sua velocidade de mineração e ganhar Bitcoin de forma mais eficiente.",
      "q7": "Quanto Tempo Leva para Atingir o Limite de Saque?",
      "a7":
          "O tempo que leva depende da sua velocidade de mineração (taxa de hash), do tipo de plano e da consistência com que você mina. Com uma taxa de hash mais alta e atividade diária, muitos usuários atingem o limite de saque em algumas semanas a um mês.",
      "q8": "A Mineração de Bitcoin é Legal?",
      "a8":
          "Sim, a mineração de Bitcoin é legal em muitos países, mas restrita ou proibida em alguns. Sempre verifique as regulamentações locais antes de minerar.",
      "q0": "O que é uma Nuvem ASIC?",
      "a0":
          "Uma Nuvem ASIC se refere à mineração de criptomoedas baseada em nuvem que utiliza mineradores de Circuito Integrado de Aplicação Específica (ASIC). Em vez de comprar e manter hardware caro, os usuários podem alugar poder de mineração de centros de dados profissionais equipados com máquinas ASIC de alto desempenho otimizadas para a mineração de Bitcoin.",
      "q9": "Como eu começo a minerar Bitcoin?",
      "a9":
          "Para começar a minerar Bitcoin, basta clicar no botão 'Começar a Minerar' e o processo será iniciado automaticamente.",
      "q10": "Posso tentar minerar Bitcoin de graça?",
      "a10":
          "Sim! Novos usuários podem tentar minerar BTC de graça. Basta se registrar, assistir a anúncios e começar a minerar instantaneamente.",
    },
  };
}
