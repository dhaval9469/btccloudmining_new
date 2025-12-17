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
      "hadboost": "Ad & Boost",
      "hqr": "Quick Reward",
      "hdqh": "Quick Ads Reward",

      // store
      "swAdBoost": "Claim",
      "spn": "Upgrade Now",
      "scpeed": "Active Speed: ",
      "scfpb": "Free Speed Booster",
      "scfs": "Free Speed",

      // setting
      "sp": "Profile",
      "sep": "Edit Profile",
      "sg": "General",
      "scp": "Current Plan",
      "swb": "Withdraw BTC",
      "srs": "Restore Subscription",
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
          "🔐 Secure. Reliable. Efficient.\nMine Bitcoin with confidence using high-performance ASIC mining tools.\n📊 Transparent earnings tracking\n⚙️ Optimized mining performance\n🛡️ Built with security and stability in mind\n👇 Download Bitcoin Mining(ASIC Miner) and start mining safely today.\n👉@shareAppLink",
      "sruf": "We’d love your feedback!",
      "srufText":
          "Thanks for being part of the Bitcoin Mining (ASIC Miner) family 🫶 If you’re enjoying your mining journey, please take a moment to leave a ⭐️ rating. Your feedback helps us improve security, performance, and reliability for everyone.",
      "srufsb": "Submit",
      "slt": "Are you sure you want to log out of your account?",
      "slyb": "Yes",
      "slnb": "No",
      "sdh": "Are you sure you want to delete your account?",
      "sdsub": "This will permanently erase all your data. This action cannot be undone.",
      "sdstostm": "✅ Your account has been deleted and all data cleared.",
      "srsm":
          "Your subscription has been successfully restored. Your mining power is up, and you can continue earning without any interruptions.",

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
          "🔐 Join me on Bitcoin Mining (ASIC Miner)\nI’m using this app to mine Bitcoin with secure, high-performance tools and clear earning tracking. It’s easy to get started and free to join.\n🎁 Use my invite code @referralCode to receive your bonus instantly.\n👇 Download the app and start mining today:\n👉 @siAppLink",

      // Customer Support
      "csym": "Your Massage",
      "cstymh": "Type your message here...",
      "csmr": "message is required.",
      "css": "Submit",

      // etc
      'srd': "Done",

      // store info
      "sisa": "Speed Allocation:",
      "sip": "Energy Level:",
      "sies": "Earning Speed:",
      "siltos": "Limited-Time Offer – Save ",
      "siap": "Activate Plan",
      "sisub":
          "Your subscription renews automatically according to your plan, unless you cancel. You can manage it anytime in Google Play.",
      "sissm": "Your @name plan @speed has been activated for @day days.",

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

      // utils
      "watchAdTitle": "Watch this ad to boost your mining power to @text for @adTime minutes ⚡",
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
      "a9":
          "To start Bitcoin mining, simply click the Start Mining button and the process will begin automatically.",
      "q10": "Can I try Bitcoin mining for free?",
      "a10":
          " Yes! New users can try BTC mining for free.Just register, watch ads, and start mining instantly.",
    },

    // TODO Malay Translation
    'ms_MY': {
      // home
      "bh": "Utama",
      "bu": "Naik Taraf",
      "bl": "Papan Pendahulu",
      "bs": "Tetapan",
      "hh": "Halo, @name",
      "hs": "Kelajuan",
      "ham": "Pelombong Aktif",
      "hsmn": "Perlombongan awan anda akan berhenti apabila pemasa tamat. Mula semula secara manual untuk terus melombong.",
      "hsm": "Mula Melombong",
      "hab": "Booster Aktif",
      "hdr": "Ganjaran Harian",
      "hadboost": "Iklan & Boost",
      "hqr": "Ganjaran Pantas",
      "hdqh": "Ganjaran Iklan Pantas",

      // store
      "swAdBoost": "Tuntut",
      "spn": "Naik Taraf Sekarang",
      "scpeed": "Kelajuan Aktif: ",
      "scfpb": "Booster Kelajuan Percuma",
      "scfs": "Kelajuan Percuma",

      // setting
      "sp": "Profil",
      "sep": "Edit Profil",
      "sg": "Umum",
      "scp": "Pelan Semasa",
      "swb": "Keluarkan BTC",
      "srs": "Pulihkan Langganan",
      "so": "Lain-lain",
      "srf": "Rujuk Rakan",
      "sl": "Bahasa",
      "sru": "Nilaikan Kami",
      "ss": "Kongsi",
      "sas": "Akaun & Sokongan",
      "spp": "Dasar Privasi",
      "scs": "Sokongan Pelanggan",
      "slo": "Log Keluar",
      "sda": "Padam Akaun",
      "sShareText":
      "🔐 Selamat. Dipercayai. Cekap.\nLombong Bitcoin dengan yakin menggunakan alatan perlombongan ASIC berprestasi tinggi.\n📊 Jejaki pendapatan dengan telus\n⚙️ Prestasi perlombongan yang dioptimumkan\n🛡️ Dibina dengan mengutamakan keselamatan dan kestabilan\n👇 Muat turun Bitcoin Mining (ASIC Miner) dan mula melombong dengan selamat hari ini.\n👉@shareAppLink",
      "sruf": "Kami ingin maklum balas anda!",
      "srufText":
      "Terima kasih kerana menjadi sebahagian daripada keluarga Bitcoin Mining (ASIC Miner) 🫶 Jika anda menikmati perjalanan perlombongan anda, sila luangkan masa untuk memberikan penarafan ⭐️. Maklum balas anda membantu kami meningkatkan keselamatan, prestasi, dan kebolehpercayaan untuk semua.",
      "srufsb": "Hantar",
      "slt": "Adakah anda pasti mahu log keluar daripada akaun anda?",
      "slyb": "Ya",
      "slnb": "Tidak",
      "sdh": "Adakah anda pasti mahu memadam akaun anda?",
      "sdsub": "Ini akan memadamkan semua data anda secara kekal. Tindakan ini tidak boleh dibatalkan.",
      "sdstostm": "✅ Akaun anda telah dipadamkan dan semua data telah dibersihkan.",
      "srsm":
      "Langganan anda telah berjaya dipulihkan. Kuasa perlombongan anda telah meningkat, dan anda boleh terus menjana pendapatan tanpa sebarang gangguan.",

      // Edit Profile
      "epn": "Nama",
      "epne": "Sila masukkan nama penuh anda",
      "epe": "Emel",
      "epee": "Masukkan alamat emel yang sah",
      "epp": "Nombor Telefon",
      "eppe": "Masukkan nombor telefon yang sah",
      "epu": "Kemas Kini",

      // Withdraw BTC
      "wbera": "Masukkan Alamat Penerima",
      "wberae": "Sila masukkan alamat yang sah",
      "wbwl": "Had Pengeluaran: @limit BTC",
      "wbwle": "Anda mesti mempunyai sekurang-kurangnya @limitError BTC untuk mengeluarkan wang.",
      "wbpb": "Teruskan",
      "wbwh": "Sejarah Pengeluaran",
      "wbydhapy": "Anda belum mempunyai sebarang sejarah pembayaran lagi.",
      "wbcp": "Anda belum mempunyai pelan lagi.",

      // Refer Friends
      "rfyrc": "Kod Rujukan Anda",
      "rfcc": "Salin Kod",
      "rfsc": "Kongsi Kod",
      "rfbr": "Kelebihan Rujukan",
      "rfgber": "Dapatkan @rBTC BTC untuk setiap rujukan",
      "rfyfghbsm": "Rakan anda mendapat bonus besar untuk mula melombong",
      "rfurimyw": "Rujukan tanpa had – jemput seberapa banyak yang anda mahu!",
      "rfct":
      "🔐 Sertai saya di Bitcoin Mining (ASIC Miner)\nSaya menggunakan aplikasi ini untuk melombong Bitcoin dengan alatan berprestasi tinggi yang selamat serta penjejakan pendapatan yang jelas. Ia mudah untuk dimulakan dan percuma untuk disertai.\n🎁 Gunakan kod jemputan saya @referralCode untuk menerima bonus anda serta-merta.\n👇 Muat turun aplikasi dan mula melombong hari ini:\n👉 @siAppLink",

      // Customer Support
      "csym": "Mesej Anda",
      "cstymh": "Taip mesej anda di sini...",
      "csmr": "Mesej diperlukan.",
      "css": "Hantar",

      // etc
      'srd': "Selesai",

      // store info
      "sisa": "Peruntukan Kelajuan:",
      "sip": "Tahap Tenaga:",
      "sies": "Kelajuan Pendapatan:",
      "siltos": "Tawaran Had Masa – Jimat ",
      "siap": "Aktifkan Pelan",
      "sisub":
      "Langganan anda diperbaharui secara automatik mengikut pelan anda, melainkan anda membatalkannya. Anda boleh mengurusnya pada bila-bila masa di Google Play.",
      "sissm": "Pelan @name @speed anda telah diaktifkan selama @day hari.",

      // sing page
      "lh": "Hai! Selamat kembali 👋 Mari bermula",
      "lsub": "Log masuk pantas dan selamat dengan Google",
      "lcwg": "Teruskan dengan Google",
      "ltou": "Syarat Penggunaan",
      "lsubText":
      "Aplikasi ini tidak melombong Bitcoin pada peranti anda. Ia merupakan simulasi perlombongan dan membolehkan anda mengurus pelombong berasaskan awan dari jauh.",
      "lrc": "Kod Rujukan",
      "lrsub": "Ada kod rujukan? Tebus ganjaran anda",
      "lrhint": "Masukkan Kod Rujukan (Pilihan)",
      "lskip": "Langkau",
      "lsubmit": "Hantar",
      "src": "Tahniah",
      "srsubone": "Sebagai sebahagian daripada komitmen kami, kami telah menambah ganjaran percuma untuk anda bermula ",
      "srsubtwo": " boost perlombongan awan ke akaun anda!",
      "srls": "Mari Bermula",
      "srdh": "Tonton iklan ini untuk menuntut bonus alu-aluan @value BTC percuma dalam dompet anda.",
      "srdnt": "Tidak, Terima Kasih",

      // utils
      "watchAdTitle": "Tonton iklan ini untuk tingkatkan kuasa perlombongan anda kepada @text selama @adTime minit ⚡",
      "watchAdN": "Bukan sekarang",
      "watchAdY": "Tonton Sekarang",

      // FAQ
      'q1': "Apakah itu Perlombongan Awan Bitcoin?",
      'a1':
      "Perlombongan Awan Bitcoin adalah kaedah perlombongan jauh di mana pengguna menyewa kuasa pengkomputeran daripada pusat data untuk melombong Bitcoin. Ia menghapuskan keperluan untuk perkakasan fizikal, persediaan, atau penyelenggaraan. Pengguna mendapat ganjaran harian berdasarkan kadar hash yang dibeli. Ini menjadikannya pilihan yang mudah dan boleh dicapai oleh sesiapa sahaja untuk mula melombong.",
      'q3': "Bolehkah saya melombong Bitcoin dari jauh?",
      'a3':
      "Ya, anda boleh melombong Bitcoin dari jauh melalui perlombongan awan. Ini membolehkan anda menyewa kuasa perlombongan daripada pusat data tanpa memiliki sebarang perkakasan. Proses perlombongan berjalan pada pelayan jauh, dan anda menerima pendapatan Bitcoin harian berdasarkan kadar hash yang dibeli.",
      'q4': "Apakah itu Kadar Hash (Hashrate)?",
      'a4':
      "Kadar Hash adalah ukuran kuasa pengkomputeran yang digunakan dalam perlombongan Bitcoin. Ia mewakili berapa banyak pengiraan (atau “hash”) yang dapat dilakukan oleh sistem setiap saat untuk menyelesaikan algoritma yang kompleks. Kadar hash yang lebih tinggi bermaksud perlombongan yang lebih pantas dan peluang yang lebih baik untuk mendapat ganjaran Bitcoin.",
      'q5': "Bolehkah Anda Menjana Keuntungan daripada Perlombongan Awan Bitcoin?",
      'a5':
      "Ya, dengan pelan yang betul dan aktiviti perlombongan yang konsisten, perlombongan awan Bitcoin boleh menjana pendapatan yang stabil. Keuntungan bergantung pada kadar hash anda, harga BTC, dan tempoh perlombongan.",
      'q6': "Adakah Mungkin untuk Meningkatkan Kelajuan Perlombongan Bitcoin Jauh?",
      'a6':
      "Ya, dengan menaik taraf pelan perlombongan awan anda kepada kadar hash yang lebih tinggi, anda boleh meningkatkan kelajuan perlombongan dan menjana Bitcoin dengan lebih cekap.",
      'q7': "Berapa Lama Masa yang Diambil untuk Mencapai Had Pengeluaran?",
      'a7':
      "Masa yang diambil bergantung pada kelajuan perlombongan (kadar hash) anda, jenis pelan, dan tahap konsistensi anda melombong. Dengan kadar hash yang lebih tinggi dan aktiviti harian, ramai pengguna mencapai had pengeluaran dalam masa beberapa minggu hingga sebulan.",
      'q8': "Adakah Perlombongan Bitcoin Sah di Sisi Undang-undang?",
      'a8':
      "Ya, perlombongan Bitcoin adalah sah di banyak negara tetapi disekat atau dilarang di sesetengah negara. Sentiasa semak peraturan tempatan anda sebelum melombong.",
      "q0": "Apakah itu Awan ASIC (ASIC Cloud)?",
      "a0":
      "Awan ASIC merujuk kepada perlombongan mata wang kripto berasaskan awan yang menggunakan pelombong Litar Bersepadu Khusus Aplikasi (ASIC). Daripada membeli dan menyelenggara perkakasan yang mahal, pengguna boleh menyewa kuasa perlombongan daripada pusat data profesional yang dilengkapi dengan mesin ASIC berprestasi tinggi yang dioptimumkan untuk perlombongan Bitcoin.",
      "q9": "Bagaimana cara saya memulakan perlombongan Bitcoin?",
      "a9":
      "Untuk memulakan perlombongan Bitcoin, cuma klik butang Mula Melombong dan proses akan bermula secara automatik.",
      "q10": "Bolehkah saya mencuba perlombongan Bitcoin secara percuma?",
      "a10":
      " Ya! Pengguna baharu boleh mencuba perlombongan BTC secara percuma. Cuma daftar, tonton iklan, dan mula melombong serta-merta.",
    },

    // TODO Filipino Translation
    'fil_PH': {
      // home
      "bh": "Home",
      "bu": "Upgrade",
      "bl": "Leaderboard",
      "bs": "Setting",
      "hh": "Halo, @name",
      "hs": "Bilis",
      "ham": "Aktibong Miners",
      "hsmn": "Hihinto ang iyong cloud mining kapag natapos ang timer. I-restart nang manual para magpatuloy sa pag-mine.",
      "hsm": "Simulan ang Pag-mine",
      "hab": "Aktibong Booster",
      "hdr": "Daily Reward",
      "hadboost": "Ad & Boost",
      "hqr": "Mabilis na Reward",
      "hdqh": "Mabilis na Ads Reward",

      // store
      "swAdBoost": "I-claim",
      "spn": "Mag-upgrade Ngayon",
      "scpeed": "Aktibong Bilis: ",
      "scfpb": "Libreng Speed Booster",
      "scfs": "Libreng Bilis",

      // setting
      "sp": "Profile",
      "sep": "I-edit ang Profile",
      "sg": "General",
      "scp": "Kasalukuyang Plan",
      "swb": "Mag-withdraw ng BTC",
      "srs": "Ibalik ang Subscription",
      "so": "Iba pa",
      "srf": "Mag-refer ng Kaibigan",
      "sl": "Wika",
      "sru": "I-rate Kami",
      "ss": "Ibahagi",
      "sas": "Account & Support",
      "spp": "Privacy Policy",
      "scs": "Customer Support",
      "slo": "Log Out",
      "sda": "I-delete ang Account",
      "sShareText":
      "🔐 Ligtas. Maaasahan. Mahusay.\nMag-mine ng Bitcoin nang may kumpiyansa gamit ang high-performance ASIC mining tools.\n📊 Transparent na pagsubaybay sa kita\n⚙️ Optimized na performance sa pag-mine\n🛡️ Ginawa nang may seguridad at katatagan sa isip\n👇 I-download ang Bitcoin Mining (ASIC Miner) at simulan ang ligtas na pag-mine ngayon.\n👉@shareAppLink",
      "sruf": "Gusto naming marinig ang iyong feedback!",
      "srufText":
      "Salamat sa pagiging bahagi ng pamilya ng Bitcoin Mining (ASIC Miner) 🫶 Kung nag-e-enjoy ka sa iyong mining journey, mangyaring maglaan ng sandali para mag-iwan ng ⭐️ rating. Ang iyong feedback ay nakakatulong sa amin na mapabuti ang seguridad, performance, at reliability para sa lahat.",
      "srufsb": "I-submit",
      "slt": "Sigurado ka bang gusto mong mag-log out sa iyong account?",
      "slyb": "Oo",
      "slnb": "Hindi",
      "sdh": "Sigurado ka bang gusto mong i-delete ang iyong account?",
      "sdsub": "Permanente nitong buburahin ang lahat ng iyong data. Ang aksyong ito ay hindi na maaaring bawiin.",
      "sdstostm": "✅ Ang iyong account ay na-delete na at lahat ng data ay nabura.",
      "srsm":
      "Matagumpay na naibalik ang iyong subscription. Tumaas na ang iyong mining power, at maaari ka nang magpatuloy sa pagkita nang walang anumang abala.",

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
      "wbwl": "Limitasyon sa Pag-withdraw: @limit BTC",
      "wbwle": "Dapat kang magkaroon ng hindi bababa sa @limitError BTC para makapag-withdraw.",
      "wbpb": "Magpatuloy",
      "wbwh": "Kasaysayan ng Pag-withdraw",
      "wbydhapy": "Wala ka pang payout history.",
      "wbcp": "Wala ka pang plan.",

      // Refer Friends
      "rfyrc": "Iyong Referral Code",
      "rfcc": "Kopyahin ang Code",
      "rfsc": "Ibahagi ang Code",
      "rfbr": "Benepisyo ng Referrals",
      "rfgber": "Makakuha ng @rBTC BTC para sa bawat referral",
      "rfyfghbsm": "Ang iyong mga kaibigan ay makakakuha ng malalaking bonus para makapagsimulang mag-mine",
      "rfurimyw": "Walang limitasyong referrals – mag-imbita hangga't gusto mo!",
      "rfct":
      "🔐 Samahan mo ako sa Bitcoin Mining (ASIC Miner)\nGinagamit ko ang app na ito para mag-mine ng Bitcoin gamit ang ligtas at high-performance na tools at malinaw na pagsubaybay sa kita. Madaling magsimula at libreng sumali.\n🎁 Gamitin ang aking invite code na @referralCode para makuha ang iyong bonus agad.\n👇 I-download ang app at simulan ang pag-mine ngayon:\n👉 @siAppLink",

      // Customer Support
      "csym": "Iyong Mensahe",
      "cstymh": "I-type ang iyong mensahe rito...",
      "csmr": "Kailangan ng mensahe.",
      "css": "I-submit",

      // etc
      'srd': "Tapos na",

      // store info
      "sisa": "Speed Allocation:",
      "sip": "Antas ng Enerhiya:",
      "sies": "Bilis ng Pagkita:",
      "siltos": "Limited-Time Offer – Makatipid ng ",
      "siap": "I-activate ang Plan",
      "sisub":
      "Awtomatikong magre-renew ang iyong subscription ayon sa iyong plan, maliban kung kanselahin mo ito. Maaari mo itong i-manage anumang oras sa Google Play.",
      "sissm": "Ang iyong @name plan @speed ay na-activate na para sa @day na araw.",

      // sign page
      "lh": "Hey! Welcome back 👋 Simulan na natin",
      "lsub": "Mabilis at ligtas na sign-in gamit ang Google",
      "lcwg": "Magpatuloy gamit ang Google",
      "ltou": "Mga Kasunduan sa Paggamit",
      "lsubText":
      "Ang app na ito ay hindi nag-mi-mine ng Bitcoin sa iyong device. Ito ay isang simulation ng mining at pinapayagan kang pamahalaan ang mga cloud-based miners nang malayuan.",
      "lrc": "Referral Code",
      "lrsub": "May referral code? I-unlock ang iyong mga reward",
      "lrhint": "Ilagay ang Referral Code (Optional)",
      "lskip": "Laktawan",
      "lsubmit": "I-submit",
      "src": "Pagbati",
      "srsubone": "Bilang bahagi ng aming pangako, nagdagdag kami ng libreng reward para makapagsimula ka ",
      "srsubtwo": " cloud mining boost sa iyong account!",
      "srls": "Simulan na Natin",
      "srdh": "Panoorin ang ad na ito para ma-claim ang iyong libreng @value BTC welcome bonus sa iyong wallet.",
      "srdnt": "Huwag na lang",

      // utils
      "watchAdTitle": "Panoorin ang ad na ito para i-boost ang iyong mining power sa @text sa loob ng @adTime minuto ⚡",
      "watchAdN": "Huwag muna",
      "watchAdY": "Panoorin Ngayon",

      // FAQ
      'q1': "Ano ang Bitcoin Cloud Mining?",
      'a1':
      "Ang Bitcoin Cloud Mining ay isang paraan ng malayuang pag-mine kung saan ang mga user ay umaarkila ng computing power mula sa mga data center para mag-mine ng Bitcoin. Inaalis nito ang pangangailangan para sa pisikal na hardware, setup, o maintenance. Ang mga user ay kumikita ng araw-araw na rewards base sa hash rate na kanilang binili. Ginagawa itong isang maginhawa at madaling opsyon para sa sinumang gustong magsimulang mag-mine.",
      'q3': "Maaari ko bang i-mine ang Bitcoin nang malayuan?",
      'a3':
      "Oo, maaari kang mag-mine ng Bitcoin nang malayuan sa pamamagitan ng cloud mining. Binibigyang-daan ka nito na umarkila ng mining power mula sa mga data center nang hindi nagmamay-ari ng anumang hardware. Ang proseso ng mining ay tumatakbo sa mga remote server, at makakatanggap ka ng araw-araw na kita sa Bitcoin base sa iyong biniling hash rate.",
      'q4': "Ano ang Hashrate?",
      'a4':
      "Ang Hashrate ay ang pagsukat ng computing power na ginagamit sa Bitcoin mining. Kinakatawan nito kung gaano karaming kalkulasyon (o “hashes”) ang kayang gawin ng isang system bawat segundo para malutas ang mga kumplikadong algorithm. Ang mas mataas na hashrate ay nangangahulugan ng mas mabilis na pag-mine at mas magandang pagkakataon na kumita ng mga Bitcoin reward.",
      'q5': "Maaari ka bang Kumita mula sa Bitcoin Cloud Mining?",
      'a5':
      "Oo, sa tamang plan at pare-parehong aktibidad sa pag-mine, ang Bitcoin cloud mining ay maaaring makabuo ng steady na kita. Ang kakayahang kumita ay depende sa iyong hash rate, presyo ng BTC, at tagal ng pag-mine.",
      'q6': "Posible bang Bilisan ang Malayuang Pag-mine ng Bitcoin?",
      'a6':
      "Oo, sa pamamagitan ng pag-upgrade ng iyong cloud mining plan sa mas mataas na hash rate, maaari mong pabilisin ang iyong pag-mine at kumita ng Bitcoin nang mas mahusay.",
      'q7': "Gaano Katagal Bago Maabot ang Limitasyon sa Pag-withdraw?",
      'a7':
      "Ang oras na aabutin ay depende sa bilis ng iyong pag-mine (hash rate), uri ng plan, at kung gaano ka ka-consistent sa pag-mine. Sa mas mataas na hash rate at araw-araw na aktibidad, maraming user ang umaabot sa limitasyon sa pag-withdraw sa loob ng ilang linggo hanggang isang buwan.",
      'q8': "Legal ba ang Bitcoin Mining?",
      'a8':
      "Oo, ang Bitcoin mining ay legal sa maraming bansa ngunit limitado o ipinagbabawal sa iba. Laging suriin ang iyong mga lokal na regulasyon bago mag-mine.",
      "q0": "Ano ang isang ASIC Cloud?",
      "a0":
      "Ang ASIC Cloud ay tumutukoy sa cloud-based cryptocurrency mining na gumagamit ng Application-Specific Integrated Circuit (ASIC) miners. Sa halip na bumili at mag-maintain ng mahal na hardware, ang mga user ay maaaring umarkila ng mining power mula sa mga propesyonal na data center na nilagyan ng high-performance na mga ASIC machine na optimized para sa Bitcoin mining.",
      "q9": "Paano ako magsisimulang mag-mine ng Bitcoin?",
      "a9":
      "Para magsimulang mag-mine ng Bitcoin, i-click lamang ang Start Mining button at awtomatikong magsisimula ang proseso.",
      "q10": "Maaari ko bang subukan ang Bitcoin mining nang libre?",
      "a10":
      " Oo! Ang mga bagong user ay maaaring sumubok ng BTC mining nang libre. Mag-register lang, manood ng ads, at magsimulang mag-mine agad.",
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
      "hsmn": "Votre minage sur le cloud s'arrêtera à la fin du minuteur. Redémarrez manuellement pour continuer à miner.",
      "hsm": "Lancer le Minage",
      "hab": "Booster Actif",
      "hdr": "Récompense Quotidienne",
      "hadboost": "Pub & Boost",
      "hqr": "Récompense Rapide",
      "hdqh": "Récompense Pub Rapide",

      // store
      "swAdBoost": "Réclamer",
      "spn": "Améliorer Maintenant",
      "scpeed": "Vitesse Active : ",
      "scfpb": "Booster de Vitesse Gratuit",
      "scfs": "Vitesse Gratuite",

      // setting
      "sp": "Profil",
      "sep": "Modifier le Profil",
      "sg": "Général",
      "scp": "Plan Actuel",
      "swb": "Retirer des BTC",
      "srs": "Restaurer l'Abonnement",
      "so": "Autre",
      "srf": "Parrainer des Amis",
      "sl": "Langue",
      "sru": "Notez-nous",
      "ss": "Partager",
      "sas": "Compte & Support",
      "spp": "Politique de Confidentialité",
      "scs": "Service Client",
      "slo": "Se Déconnecter",
      "sda": "Supprimer le Compte",
      "sShareText":
      "🔐 Sécurisé. Fiable. Efficace.\nMinez du Bitcoin en toute confiance avec des outils de minage ASIC haute performance.\n📊 Suivi transparent des gains\n⚙️ Performance de minage optimisée\n🛡️ Conçu pour la sécurité et la stabilité\n👇 Téléchargez Bitcoin Mining (ASIC Miner) et commencez à miner en toute sécurité dès aujourd'hui.\n👉@shareAppLink",
      "sruf": "Votre avis nous intéresse !",
      "srufText":
      "Merci de faire partie de la famille Bitcoin Mining (ASIC Miner) 🫶 Si vous appréciez votre expérience de minage, merci de prendre un moment pour laisser une note de ⭐️. Vos commentaires nous aident à améliorer la sécurité, la performance et la fiabilité pour tous.",
      "srufsb": "Envoyer",
      "slt": "Êtes-vous sûr de vouloir vous déconnecter de votre compte ?",
      "slyb": "Oui",
      "slnb": "Non",
      "sdh": "Êtes-vous sûr de vouloir supprimer votre compte ?",
      "sdsub": "Cela effacera définitivement toutes vos données. Cette action est irréversible.",
      "sdstostm": "✅ Votre compte a été supprimé et toutes les données ont été effacées.",
      "srsm":
      "Votre abonnement a été restauré avec succès. Votre puissance de minage a augmenté et vous pouvez continuer à gagner des récompenses sans interruption.",

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
      "wbwl": "Limite de Retrait : @limit BTC",
      "wbwle": "Vous devez avoir au moins @limitError BTC pour effectuer un retrait.",
      "wbpb": "Procéder",
      "wbwh": "Historique des Retraits",
      "wbydhapy": "Vous n'avez pas encore d'historique de paiement.",
      "wbcp": "Vous n'avez pas encore de plan.",

      // Refer Friends
      "rfyrc": "Votre Code de Parrainage",
      "rfcc": "Copier le Code",
      "rfsc": "Partager le Code",
      "rfbr": "Avantages du Parrainage",
      "rfgber": "Obtenez @rBTC BTC pour chaque parrainage",
      "rfyfghbsm": "Vos amis reçoivent d'énormes bonus pour commencer à miner",
      "rfurimyw": "Parrainages illimités – invitez autant de personnes que vous le souhaitez !",
      "rfct":
      "🔐 Rejoignez-moi sur Bitcoin Mining (ASIC Miner)\nJ'utilise cette application pour miner du Bitcoin avec des outils sécurisés et performants. C'est facile de démarrer et l'inscription est gratuite.\n🎁 Utilisez mon code d'invitation @referralCode pour recevoir votre bonus instantanément.\n👇 Téléchargez l'application et commencez à miner aujourd'hui :\n👉 @siAppLink",

      // Customer Support
      "csym": "Votre Message",
      "cstymh": "Tapez votre message ici...",
      "csmr": "Le message est obligatoire.",
      "css": "Envoyer",

      // etc
      'srd': "Terminé",

      // store info
      "sisa": "Allocation de Vitesse :",
      "sip": "Niveau d'Énergie :",
      "sies": "Vitesse de Gain :",
      "siltos": "Offre à Durée Limitée – Économisez ",
      "siap": "Activer le Plan",
      "sisub":
      "Votre abonnement se renouvelle automatiquement selon votre plan, sauf en cas d'annulation. Vous pouvez le gérer à tout moment sur Google Play.",
      "sissm": "Votre plan @name @speed a été activé pour @day jours.",

      // sign page
      "lh": "Hé ! Bon retour 👋 Commençons",
      "lsub": "Connexion rapide et sécurisée avec Google",
      "lcwg": "Continuer avec Google",
      "ltou": "Conditions d'Utilisation",
      "lsubText":
      "Cette application ne mine pas de Bitcoin sur votre appareil. Elle simule le minage et vous permet de gérer à distance des mineurs basés sur le cloud.",
      "lrc": "Code de Parrainage",
      "lrsub": "Vous avez un code de parrainage ? Débloquez vos récompenses",
      "lrhint": "Entrer le code de parrainage (Optionnel)",
      "lskip": "Passer",
      "lsubmit": "Envoyer",
      "src": "Félicitations",
      "srsubone": "Dans le cadre de notre engagement, nous avons ajouté une récompense gratuite pour vous aider à démarrer ",
      "srsubtwo": " un boost de minage cloud sur votre compte !",
      "srls": "C'est parti",
      "srdh": "Regardez cette publicité pour réclamer votre bonus de bienvenue gratuit de @value BTC dans votre portefeuille.",
      "srdnt": "Non merci",

      // utils
      "watchAdTitle": "Regardez cette pub pour booster votre puissance de minage à @text pendant @adTime minutes ⚡",
      "watchAdN": "Pas maintenant",
      "watchAdY": "Regarder Maintenant",

      // FAQ
      'q1': "Qu'est-ce que le Bitcoin Cloud Mining ?",
      'a1':
      "Le Bitcoin Cloud Mining est une méthode de minage à distance où les utilisateurs louent de la puissance de calcul auprès de centres de données. Cela élimine le besoin de matériel physique, d'installation ou de maintenance. Les utilisateurs gagnent des récompenses quotidiennes basées sur le taux de hachage acheté.",
      'q3': "Puis-je miner du Bitcoin à distance ?",
      'a3':
      "Oui, vous pouvez miner du Bitcoin à distance via le cloud mining. Cela vous permet de louer de la puissance de minage sans posséder de matériel. Le processus s'exécute sur des serveurs distants et vous recevez des gains quotidiens.",
      'q4': "Qu'est-ce que le Hashrate ?",
      'a4':
      "Le hashrate est la mesure de la puissance de calcul utilisée. Il représente le nombre de calculs (ou « hashes ») qu'un système peut effectuer par seconde. Un hashrate plus élevé signifie un minage plus rapide.",
      'q5': "Peut-on réaliser des bénéfices avec le Cloud Mining ?",
      'a5':
      "Oui, avec le bon plan et une activité constante, le cloud mining peut générer des revenus réguliers. La rentabilité dépend de votre hashrate, du prix du BTC et de la durée.",
      'q6': "Est-il possible d'augmenter la vitesse de minage ?",
      'a6':
      "Oui, en améliorant votre plan vers un hashrate plus élevé, vous pouvez booster votre vitesse et miner plus efficacement.",
      'q7': "Combien de temps pour atteindre la limite de retrait ?",
      'a7':
      "Cela dépend de votre vitesse et de votre plan. Avec un hashrate élevé et une activité quotidienne, de nombreux utilisateurs atteignent la limite en quelques semaines ou un mois.",
      'q8': "Le minage de Bitcoin est-il légal ?",
      'a8':
      "Oui, le minage est légal dans de nombreux pays mais restreint ou interdit dans certains. Vérifiez toujours les réglementations locales.",
      "q0": "Qu'est-ce qu'un Cloud ASIC ?",
      "a0":
      "Un Cloud ASIC désigne le minage basé sur le cloud utilisant des machines ASIC (Application-Specific Integrated Circuit). Les utilisateurs louent de la puissance sur des machines haute performance optimisées pour le Bitcoin.",
      "q9": "Comment commencer le minage ?",
      "a9":
      "Pour commencer, cliquez simplement sur le bouton « Lancer le Minage » et le processus débutera automatiquement.",
      "q10": "Puis-je essayer gratuitement ?",
      "a10":
      "Oui ! Les nouveaux utilisateurs peuvent essayer gratuitement. Inscrivez-vous, regardez des publicités et commencez à miner instantanément.",
    },

    // TODO Spanish Translation
    'es_ES': {
      // home
      "bh": "Inicio",
      "bu": "Mejorar",
      "bl": "Clasificación",
      "bs": "Ajustes",
      "hh": "Hola, @name",
      "hs": "Velocidad",
      "ham": "Mineros Activos",
      "hsmn": "Tu minería en la nube se detendrá cuando termine el temporizador. Reinicia manualmente para seguir minando.",
      "hsm": "Empezar a Minar",
      "hab": "Potenciador Activo",
      "hdr": "Recompensa Diaria",
      "hadboost": "Anuncio y Boost",
      "hqr": "Recompensa Rápida",
      "hdqh": "Recompensa de Anuncio Rápido",

      // store
      "swAdBoost": "Reclamar",
      "spn": "Mejorar Ahora",
      "scpeed": "Velocidad Activa: ",
      "scfpb": "Potenciador de Velocidad Gratis",
      "scfs": "Velocidad Gratis",

      // setting
      "sp": "Perfil",
      "sep": "Editar Perfil",
      "sg": "General",
      "scp": "Plan Actual",
      "swb": "Retirar BTC",
      "srs": "Restaurar Suscripción",
      "so": "Otro",
      "srf": "Referir Amigos",
      "sl": "Idioma",
      "sru": "Califícanos",
      "ss": "Compartir",
      "sas": "Cuenta y Soporte",
      "spp": "Política de Privacidad",
      "scs": "Atención al Cliente",
      "slo": "Cerrar Sesión",
      "sda": "Eliminar Cuenta",
      "sShareText":
      "🔐 Seguro. Confiable. Eficiente.\nMina Bitcoin con confianza utilizando herramientas de minería ASIC de alto rendimiento.\n📊 Seguimiento transparente de ganancias\n⚙️ Rendimiento de minería optimizado\n🛡️ Construido pensando en la seguridad y estabilidad\n👇 Descarga Bitcoin Mining (ASIC Miner) y comienza a minar de forma segura hoy.\n👉@shareAppLink",
      "sruf": "¡Nos encantaría conocer tu opinión!",
      "srufText":
      "Gracias por formar parte de la familia Bitcoin Mining (ASIC Miner) 🫶 Si estás disfrutando de tu experiencia, por favor tómate un momento para dejarnos una calificación de ⭐️. Tus comentarios nos ayudan a mejorar la seguridad y confiabilidad para todos.",
      "srufsb": "Enviar",
      "slt": "¿Estás seguro de que quieres cerrar sesión?",
      "slyb": "Sí",
      "slnb": "No",
      "sdh": "¿Estás seguro de que quieres eliminar tu cuenta?",
      "sdsub": "Esto borrará permanentemente todos tus datos. Esta acción no se puede deshacer.",
      "sdstostm": "✅ Tu cuenta ha sido eliminada y todos los datos han sido borrados.",
      "srsm":
      "Tu suscripción se ha restaurado con éxito. Tu potencia de minería ha aumentado y puedes seguir ganando sin interrupciones.",

      // Edit Profile
      "epn": "Nombre",
      "epne": "Por favor, introduce tu nombre completo",
      "epe": "Correo electrónico",
      "epee": "Introduce un correo electrónico válido",
      "epp": "Número de teléfono",
      "eppe": "Introduce un número de teléfono válido",
      "epu": "Actualizar",

      // Withdraw BTC
      "wbera": "Dirección del Destinatario",
      "wberae": "Por favor, introduce una dirección válida",
      "wbwl": "Límite de Retiro: @limit BTC",
      "wbwle": "Debes tener al menos @limitError BTC para retirar.",
      "wbpb": "Continuar",
      "wbwh": "Historial de Retiros",
      "wbydhapy": "Aún no tienes historial de pagos.",
      "wbcp": "Aún no tienes un plan.",

      // Refer Friends
      "rfyrc": "Tu Código de Referido",
      "rfcc": "Copiar Código",
      "rfsc": "Compartir Código",
      "rfbr": "Beneficios de Referidos",
      "rfgber": "Obtén @rBTC BTC por cada referido",
      "rfyfghbsm": "Tus amigos reciben grandes bonos para empezar a minar",
      "rfurimyw": "Referidos ilimitados – ¡invita a tantos como quieras!",
      "rfct":
      "🔐 Únete a mí en Bitcoin Mining (ASIC Miner)\nUso esta app para minar Bitcoin con herramientas seguras y seguimiento claro de ganancias. Es fácil y gratis unirse.\n🎁 Usa mi código de invitación @referralCode para recibir tu bono al instante.\n👇 Descarga la app y empieza a minar hoy:\n👉 @siAppLink",

      // Customer Support
      "csym": "Tu Mensaje",
      "cstymh": "Escribe tu mensaje aquí...",
      "csmr": "El mensaje es obligatorio.",
      "css": "Enviar",

      // etc
      'srd': "Hecho",

      // store info
      "sisa": "Asignación de Velocidad:",
      "sip": "Nivel de Energía:",
      "sies": "Velocidad de Ganancia:",
      "siltos": "Oferta por Tiempo Limitado – Ahorra ",
      "siap": "Activar Plan",
      "sisub":
      "Tu suscripción se renueva automáticamente según tu plan, a menos que la canceles. Puedes gestionarla en Google Play.",
      "sissm": "Tu plan @name @speed ha sido activado por @day días.",

      // sign page
      "lh": "¡Hola! Bienvenido de nuevo 👋 Empecemos",
      "lsub": "Inicio de sesión rápido y seguro con Google",
      "lcwg": "Continuar con Google",
      "ltou": "Términos de Uso",
      "lsubText":
      "Esta aplicación no mina Bitcoin en tu dispositivo. Simula la minería y permite gestionar de forma remota mineros basados en la nube.",
      "lrc": "Código de Referido",
      "lrsub": "¿Tienes un código? Desbloquea tus recompensas",
      "lrhint": "Código de Referido (Opcional)",
      "lskip": "Omitir",
      "lsubmit": "Enviar",
      "src": "¡Felicidades!",
      "srsubone": "Como parte de nuestro compromiso, hemos añadido una recompensa gratis para que empieces: ",
      "srsubtwo": " ¡un boost de minería en la nube para tu cuenta!",
      "srls": "Vamos a empezar",
      "srdh": "Mira este anuncio para reclamar tu bono de bienvenida de @value BTC en tu billetera.",
      "srdnt": "No, gracias",

      // utils
      "watchAdTitle": "Mira este anuncio para potenciar tu minería a @text por @adTime minutos ⚡",
      "watchAdN": "Ahora no",
      "watchAdY": "Ver Ahora",

      // FAQ
      'q1': "¿Qué es la Minería de Bitcoin en la Nube?",
      'a1':
      "Es un método de minería remota donde los usuarios alquilan potencia de cómputo de centros de datos para minar Bitcoin. Elimina la necesidad de hardware físico o mantenimiento. Los usuarios ganan recompensas basadas en la tasa de hash comprada.",
      'q3': "¿Puedo minar Bitcoin de forma remota?",
      'a3':
      "Sí, a través de la minería en la nube puedes alquilar potencia sin tener hardware propio. El proceso se ejecuta en servidores remotos y recibes ganancias diarias.",
      'q4': "¿Qué es el Hashrate?",
      'a4':
      "Es la medida de la potencia de cómputo. Representa cuántos cálculos por segundo puede realizar un sistema. Un hashrate más alto significa una minería más rápida y mejores recompensas.",
      'q5': "¿Es rentable la Minería en la Nube?",
      'a5':
      "Sí, con el plan adecuado y actividad constante, puede generar ganancias estables. Depende de tu hashrate, el precio del BTC y la duración.",
      'q6': "¿Se puede aumentar la velocidad de minería?",
      'a6':
      "Sí, al mejorar tu plan a un hashrate superior, puedes aumentar tu velocidad y minar de forma más eficiente.",
      'q7': "¿Cuánto tiempo toma alcanzar el límite de retiro?",
      'a7':
      "Depende de tu velocidad y constancia. Con un hashrate alto, muchos usuarios alcanzan el límite en pocas semanas o un mes.",
      'q8': "¿Es legal la Minería de Bitcoin?",
      'a8':
      "Sí, es legal en muchos países, aunque restringida en otros. Siempre verifica tus regulaciones locales antes de empezar.",
      "q0": "¿Qué es una Nube ASIC?",
      "a0":
      "Se refiere a la minería en la nube que utiliza equipos ASIC (Circuito Integrado de Aplicación Específica), máquinas de alto rendimiento optimizadas exclusivamente para minar Bitcoin.",
      "q9": "¿Cómo empiezo a minar?",
      "a9":
      "Simplemente haz clic en el botón 'Empezar a Minar' y el proceso comenzará automáticamente.",
      "q10": "¿Puedo probar la minería gratis?",
      "a10":
      "¡Sí! Los nuevos usuarios pueden probar la minería de BTC gratis. Solo regístrate, mira anuncios y comienza al instante.",
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
      "ham": "Wachimba Migodi Hai",
      "hsmn": "Uchimba migodi wako wa cloud utasimama wakati muda utakapoisha. Anzisha tena mwenyewe ili kuendelea na uchimbaji.",
      "hsm": "Anza Kuchimba",
      "hab": "Booster Hai",
      "hdr": "Tuzo ya Kila Siku",
      "hadboost": "Tangazo na Boost",
      "hqr": "Tuzo ya Haraka",
      "hdqh": "Tuzo ya Matangazo ya Haraka",

      // store
      "swAdBoost": "Dai",
      "spn": "Boresha Sasa",
      "scpeed": "Kasi ya Sasa: ",
      "scfpb": "Booster ya Kasi ya Bure",
      "scfs": "Kasi ya Bure",

      // setting
      "sp": "Wasifu",
      "sep": "Hariri Wasifu",
      "sg": "Jumla",
      "scp": "Mpango wa Sasa",
      "swb": "Toa BTC",
      "srs": "Rejesha Usajili",
      "so": "Nyingine",
      "srf": "Pendekeza Marafiki",
      "sl": "Lugha",
      "sru": "Tukadirie",
      "ss": "Shiriki",
      "sas": "Akaunti na Usaidizi",
      "spp": "Sera ya Faragha",
      "scs": "Huduma kwa Wateja",
      "slo": "Ondoka",
      "sda": "Futa Akaunti",
      "sShareText":
      "🔐 Salama. Inaaminika. Inafanya kazi vizuri.\nChimba Bitcoin kwa ujasiri ukitumia zana za uchimbaji za ASIC zenye utendaji wa juu.\n📊 Ufuatiliaji wa mapato kwa uwazi\n⚙️ Utendaji wa uchimbaji ulioboreshwa\n🛡️ Imejengwa kwa usalama na uthabiti\n👇 Pakua Bitcoin Mining (ASIC Miner) na uanze kuchimba kwa usalama leo.\n👉@shareAppLink",
      "sruf": "Tungependa kupata maoni yako!",
      "srufText":
      "Asante kwa kuwa sehemu ya familia ya Bitcoin Mining (ASIC Miner) 🫶 Ikiwa unafurahia safari yako ya uchimbaji, tafadhali chukua muda kutupa ukadiriaji wa ⭐️. Maoni yako yanatusaidia kuboresha usalama, utendaji, na uaminifu kwa kila mtu.",
      "srufsb": "Wasilisha",
      "slt": "Je, una uhakika unataka kutoka kwenye akaunti yako?",
      "slyb": "Ndiyo",
      "slnb": "Hapana",
      "sdh": "Je, una uhakika unataka kufuta akaunti yako?",
      "sdsub": "Hii itafuta data zako zote kabisa. Kitendo hiki hakiwezi kubatilishwa.",
      "sdstostm": "✅ Akaunti yako imefutwa na data zote zimeondolewa.",
      "srsm":
      "Usajili wako umerejeshwa kwa mafanikio. Nguvu yako ya uchimbaji imeongezeka, na unaweza kuendelea kupata mapato bila usumbufu wowote.",

      // Edit Profile
      "epn": "Jina",
      "epne": "Tafadhali weka jina lako kamili",
      "epe": "Barua Pepe",
      "epee": "Weka barua pepe halali",
      "epp": "Nambari ya Simu",
      "eppe": "Weka nambari ya simu halali",
      "epu": "Sasisha",

      // Withdraw BTC
      "wbera": "Weka Anuani ya Mpokeaji",
      "wberae": "Tafadhali weka anuani halali",
      "wbwl": "Kikomo cha Kutoa: @limit BTC",
      "wbwle": "Lazima uwe na angalau @limitError BTC ili kutoa pesa.",
      "wbpb": "Endelea",
      "wbwh": "Historia ya Kutoa Pesa",
      "wbydhapy": "Bado huna historia ya malipo.",
      "wbcp": "Bado huna mpango wowote.",

      // Refer Friends
      "rfyrc": "Nambari Yako ya Marejeleo",
      "rfcc": "Nakili Nambari",
      "rfsc": "Shiriki Nambari",
      "rfbr": "Faida za Marejeleo",
      "rfgber": "Pata @rBTC BTC kwa kila mwaliko",
      "rfyfghbsm": "Marafiki zako wanapata bonasi kubwa kuanza kuchimba",
      "rfurimyw": "Marejeleo yasiyo na kikomo – alika wengi upendavyo!",
      "rfct":
      "🔐 Jiunge nami kwenye Bitcoin Mining (ASIC Miner)\nNinasasitumia programu hii kuchimba Bitcoin kwa zana salama na zenye utendaji wa juu. Ni rahisi kuanza na kujiunga ni bure.\n🎁 Tumia nambari yangu ya mwaliko @referralCode kupata bonasi yako papo hapo.\n👇 Pakua programu na uanze kuchimba leo:\n👉 @siAppLink",

      // Customer Support
      "csym": "Ujumbe Wako",
      "cstymh": "Andika ujumbe wako hapa...",
      "csmr": "Ujumbe unahitajika.",
      "css": "Wasilisha",

      // etc
      'srd': "Imekamilika",

      // store info
      "sisa": "Ugawaji wa Kasi:",
      "sip": "Kiwango cha Nishati:",
      "sies": "Kasi ya Mapato:",
      "siltos": "Ofa ya Muda Mfupi – Okoa ",
      "siap": "Anzisha Mpango",
      "sisub":
      "Usajili wako unajisasisha kiotomatiki kulingana na mpango wako, isipokuwa ughairi. Unaweza kuudhibiti wakati wowote kwenye Google Play.",
      "sissm": "Mpango wako wa @name @speed umeanza kutumika kwa muda wa siku @day.",

      // sign page
      "lh": "Habari! Karibu tena 👋 Tuanze",
      "lsub": "Ingia haraka na kwa salama ukitumia Google",
      "lcwg": "Endelea na Google",
      "ltou": "Masharti ya Matumizi",
      "lsubText":
      "Programu hii haichimbi Bitcoin kwenye kifaa chako. Inaiga uchimbaji na inakuwezesha kudhibiti wachimbaji wa cloud kwa mbali.",
      "lrc": "Nambari ya Marejeleo",
      "lrsub": "Una nambari ya marejeleo? Fungua tuzo zako",
      "lrhint": "Weka Nambari ya Marejeleo (Si lazima)",
      "lskip": "Ruka",
      "lsubmit": "Wasilisha",
      "src": "Hongera",
      "srsubone": "Kama sehemu ya ahadi yetu, tumekuongezea tuzo ya bure ili uanze ",
      "srsubtwo": " boost ya uchimbaji wa cloud kwenye akaunti yako!",
      "srls": "Tuanze",
      "srdh": "Tazama tangazo hili ili kudai bonasi yako ya bure ya @value BTC ya kukaribishwa kwenye mkoba wako.",
      "srdnt": "Hapana Asante",

      // utils
      "watchAdTitle": "Tazama tangazo hili ili kuongeza nguvu yako ya uchimbaji hadi @text kwa dakika @adTime ⚡",
      "watchAdN": "Si sasa",
      "watchAdY": "Tazama Sasa",

      // FAQ
      'q1': "Bitcoin Cloud Mining ni nini?",
      'a1':
      "Bitcoin Cloud Mining ni njia ya uchimbaji wa mbali ambapo watumiaji hukodisha nguvu ya kompyuta kutoka kwa vituo vya data ili kuchimba Bitcoin. Inaondoa hitaji la kuwa na vifaa halisi au matengenezo. Watumiaji hupata tuzo za kila siku kulingana na hashrate waliyonunua.",
      'q3': "Je, naweza kuchimba Bitcoin kwa mbali?",
      'a3':
      "Ndiyo, unaweza kuchimba Bitcoin kwa mbali kupitia cloud mining. Hii inakuwezesha kukodisha nguvu ya uchimbaji bila kumiliki vifaa vyovyote. Mchakato unafanyika kwenye seva za mbali.",
      'q4': "Hashrate ni nini?",
      'a4':
      "Hashrate ni kipimo cha nguvu ya kompyuta inayotumika katika uchimbaji wa Bitcoin. Inawakilisha idadi ya mahesabu ambayo mfumo unaweza kufanya kwa sekunde. Hashrate ya juu inamaanisha uchimbaji wa haraka.",
      'q5': "Je, unaweza kupata faida kutokana na Cloud Mining?",
      'a5':
      "Ndiyo, ukiwa na mpango sahihi na uchimbaji wa mara kwa mara, cloud mining inaweza kutoa mapato thabiti. Faida inategemea hashrate yako, bei ya BTC, na muda wa uchimbaji.",
      'q6': "Je, inawezekana kuongeza kasi ya uchimbaji wa mbali?",
      'a6':
      "Ndiyo, kwa kuboresha mpango wako wa cloud mining kuwa na hashrate ya juu, unaweza kuongeza kasi yako ya uchimbaji na kupata Bitcoin kwa ufanisi zaidi.",
      'q7': "Itachukua muda gani kufikia kikomo cha kutoa pesa?",
      'a7':
      "Muda unategemea kasi yako, aina ya mpango, na jinsi unavyochimba mara kwa mara. Watumiaji wengi hufikia kikomo ndani ya wiki chache hadi mwezi mmoja.",
      'q8': "Je, uchimbaji wa Bitcoin ni halali?",
      'a8':
      "Ndiyo, ni halali katika nchi nyingi lakini umezuiwa au kupigwa marufuku katika baadhi ya nchi. Daima kagua sheria za eneo lako.",
      "q0": "ASIC Cloud ni nini?",
      "a0":
      "ASIC Cloud inahusu uchimbaji wa sarafu za kidijitali unaotumia mashine za ASIC (Application-Specific Integrated Circuit). Badala ya kununua vifaa vya gharama, watumiaji hukodisha nguvu kutoka kwa vituo vya kitaalamu.",
      "q9": "Ninaanzaje kuchimba Bitcoin?",
      "a9":
      "Kuanza kuchimba, bonyeza tu kitufe cha 'Anza Kuchimba' na mchakato utaanza kiotomatiki.",
      "q10": "Je, naweza kujaribu uchimbaji wa Bitcoin bure?",
      "a10":
      "Ndiyo! Watumiaji wapya wanaweza kujaribu uchimbaji wa BTC bure. Jisajili tu, tazama matangazo, na uanze kuchimba papo hapo.",
    },

    // TODO Hausa Translation
    'ha_NG': {
      // home
      "bh": "Gida",
      "bu": "Haɓaka",
      "bl": "Gwarazan Masu Ma'adinai",
      "bs": "Saituna",
      "hh": "Sannu, @name",
      "hs": "Gudu",
      "ham": "Masu Ma'adinai na Yanzu",
      "hsmn": "Ma'adinar cloud ɗinka za ta tsaya idan lokaci ya ƙare. Sake kunna ta da kanka domin ci gaba da haƙar ma'adinai.",
      "hsm": "Fara Haƙar Ma'adinai",
      "hab": "Abin Haɓaka Gudu",
      "hdr": "Kyautar Kullum",
      "hadboost": "Talla & Haɓakawa",
      "hqr": "Kyauta cikin Sauri",
      "hdqh": "Kyautar Kallon Talla",

      // store
      "swAdBoost": "Karɓa",
      "spn": "Haɓaka Yanzu",
      "scpeed": "Gudun da ake ciki: ",
      "scfpb": "Abin Haɓaka Gudu na Kyauta",
      "scfs": "Gudu na Kyauta",

      // setting
      "sp": "Bayanan Shafi",
      "sep": "Gyara Bayanan Shafi",
      "sg": "Gabaɗaya",
      "scp": "Tsarin da kake kai",
      "swb": "Cire BTC",
      "srs": "Maido da Rajista",
      "so": "Wasu",
      "srf": "Gayyaci Abokai",
      "sl": "Harshe",
      "sru": "Ba mu Tauraro",
      "ss": "Raba wa Wasu",
      "sas": "Asusu & Taimako",
      "spp": "Tsarin Tsare Sirri",
      "scs": "Taimakon Abokan Ciniki",
      "slo": "Fita daga Asusu",
      "sda": "Goge Asusu",
      "sShareText":
      "🔐 Amintacce. Abin dogaro. Mai inganci.\nHaƙi Bitcoin cikin kwarin gwiwa ta amfani da ingantattun kayan aikin ASIC.\n📊 Bibiyar samun kudin shiga cikin gaskiya\n⚙️ Ingantaccen aikin haƙar ma'adinai\n🛡️ An gina shi da tsaro da karko a rai\n👇 Sauke Bitcoin Mining (ASIC Miner) ka fara haƙar ma'adinai cikin aminci a yau.\n👉@shareAppLink",
      "sruf": "Muna son jin ra'ayinka!",
      "srufText":
      "Godiya da kasancewa ɓangare na dangin Bitcoin Mining (ASIC Miner) 🫶 Idan kana jin daɗin tafiyar ma'adinarka, don Allah ɗauki lokaci ka ba mu ⭐️ tauraro. Ra'ayinka yana taimaka mana inganta tsaro da ingancin aiki ga kowa.",
      "srufsb": "Tura",
      "slt": "Shin kana da tabbacin kana son fita daga asusunka?",
      "slyb": "Eh",
      "slnb": "A'a",
      "sdh": "Shin kana da tabbacin kana son goge asusunka?",
      "sdsub": "Wannan zai goge dukkan bayananka har abada. Ba za a iya dawo da su ba bayan an goge.",
      "sdstostm": "✅ An goge asusunka kuma an share dukkan bayanai.",
      "srsm":
      "An yi nasarar maido da rajistarka. Gudun ma'adinarka ya ƙaru, kuma za ka iya ci gaba da samun kuɗi ba tare da tsangwama ba.",

      // Edit Profile
      "epn": "Suna",
      "epne": "Don Allah shigar da cikakken sunanka",
      "epe": "Imel",
      "epee": "Shigar da adireshin imel mai kyau",
      "epp": "Lambar Waya",
      "eppe": "Shigar da lambar waya mai kyau",
      "epu": "Sabunta",

      // Withdraw BTC
      "wbera": "Shigar da Adireshin Mai Karɓa",
      "wberae": "Don Allah shigar da adireshin da yake daidai",
      "wbwl": "Iyakar Cirewa: @limit BTC",
      "wbwle": "Dole ne ka sami aƙalla @limitError BTC kafin ka iya cirewa.",
      "wbpb": "Ci gaba",
      "wbwh": "Tarihin Cire Kuɗi",
      "wbydhapy": "Ba ka da tarihin biya tukuna.",
      "wbcp": "Ba ka da wani tsari (plan) tukuna.",

      // Refer Friends
      "rfyrc": "Lambar Gayyatarka",
      "rfcc": "Kwafi Lambar",
      "rfsc": "Raba Lambar",
      "rfbr": "Fa'idodin Gayyata",
      "rfgber": "Sami @rBTC BTC akan kowane mutum ɗaya da ka gayyata",
      "rfyfghbsm": "Abokanka za su sami manyan kyaututtuka don fara haƙar ma'adinai",
      "rfurimyw": "Gayyata ba iyaka – gayyaci mutane duk yadda kake so!",
      "rfct":
      "🔐 Kasance tare da ni a Bitcoin Mining (ASIC Miner)\nIna amfani da wannan manhaja don haƙar Bitcoin tare da ingantattun kayan aiki da bayyanannen bibiyar kuɗi. Abu ne mai sauƙi kuma shiga kyauta ne.\n🎁 Yi amfani da lambar gayyata ta @referralCode don karɓar kyautarka nan take.\n👇 Sauke manhajar ka fara haƙar ma'adinai a yau:\n👉 @siAppLink",

      // Customer Support
      "csym": "Saƙonku",
      "cstymh": "Rubuta saƙonku a nan...",
      "csmr": "Dole ne a rubuta saƙo.",
      "css": "Tura",

      // etc
      'srd': "An gama",

      // store info
      "sisa": "Raba Gudu:",
      "sip": "Matakin Makamashi:",
      "sies": "Gudun Samun Kuɗi:",
      "siltos": "Tayin Lokaci Mai Iyaka – Rage Farashin ",
      "siap": "Kunna Tsarin",
      "sisub":
      "Rajistarka za ta sabunta kanta ta atomatik dangane da tsarinka, sai dai idan ka fasa. Za ka iya sarrafa ta a kowane lokaci a Google Play.",
      "sissm": "An kunna tsarinka na @name mai gudun @speed na tsawon kwanaki @day.",

      // sing page
      "lh": "Sannu! Barka da dawowa 👋 Bari mu fara",
      "lsub": "Shiga cikin sauri da aminci tare da Google",
      "lcwg": "Ci gaba da Google",
      "ltou": "Sharuddan Amfani",
      "lsubText":
      "Wannan manhaja ba ta amfani da na'urarka wajen haƙar Bitcoin. Kwaikwayon haƙar ma'adinai take yi kuma tana ba ka damar sarrafa ma'adinan cloud daga nesa.",
      "lrc": "Lambar Gayyata",
      "lrsub": "Kana da lambar gayyata? Buɗe kyaututtukanka",
      "lrhint": "Shigar da Lambar Gayyata (Na zaɓi)",
      "lskip": "Tsallake",
      "lsubmit": "Tura",
      "src": "Taya Murna",
      "srsubone": "A matsayin ɓangare na alƙawarinmu, mun ƙara maka kyauta don fara aiki ",
      "srsubtwo": " an ƙara maka gudun ma'adinar cloud a asusunka!",
      "srls": "Bari mu Fara",
      "srdh": "Kalli wannan tallan don karɓar kyautar maraba ta @value BTC kyauta a walat ɗinka.",
      "srdnt": "A'a godiya",

      // utils
      "watchAdTitle": "Kalli wannan tallan don haɓaka gudun ma'adinar ka zuwa @text na tsawon mintuna @adTime ⚡",
      "watchAdN": "Ba yanzu ba",
      "watchAdY": "Kalla Yanzu",

      // FAQ
      'q1': "Menene Bitcoin Cloud Mining?",
      'a1':
      "Bitcoin Cloud Mining wata hanya ce ta haƙar ma'adinai daga nesa inda masu amfani ke hayar ƙarfin na'ura daga cibiyoyin bayanai (data centers) don haƙar Bitcoin. Ba ya buƙatar ka sayi na'urori da kanka. Masu amfani suna samun lada kullum dangane da ƙarfin (hashrate) da suka saya.",
      'q3': "Zan iya haƙar Bitcoin daga nesa?",
      'a3':
      "Eh, za ka iya haƙar Bitcoin daga nesa ta hanyar cloud mining. Wannan yana ba ka damar yin hayar ƙarfin haƙar ma'adinai ba tare da ka mallaki na'urorin ba. Ana yin aikin a wasu manyan na'urori na nesa.",
      'q4': "Menene Hashrate?",
      'a4':
      "Hashrate shi ne ma'aunin ƙarfin lissafi da ake amfani da shi wajen haƙar Bitcoin. Yana nuna adadin lissafin da tsarin zai iya yi a kowane sakan. Mafi girman hashrate na nufin saurin haƙar ma'adinai.",
      'q5': "Shin ana samun riba a Bitcoin Cloud Mining?",
      'a5':
      "Eh, tare da tsari mai kyau da kuma juriya, cloud mining na iya samar da kudin shiga akai-akai. Riba ta dogara da hashrate ɗinka, farashin BTC, da tsawon lokacin da kake yi.",
      'q6': "Shin zai yiwu a ƙara gudun haƙar ma'adinai daga nesa?",
      'a6':
      "Eh, ta hanyar haɓaka tsarin cloud mining zuwa hashrate mafi girma, za ka iya ƙara gudunka kuma ka sami Bitcoin cikin sauri.",
      'q7': "Har tsawon wane lokaci zan kai iyakar cire kuɗi?",
      'a7':
      "Lokacin ya dogara da gudun ma'adinar ka da yadda kake juriya. Masu amfani da yawa suna kai iyakar cirewa tsakanin makonni kaɗan zuwa wata ɗaya.",
      'q8': "Shin haƙar Bitcoin ya halatta (Legal)?",
      'a8':
      "Eh, haƙar Bitcoin ya halatta a ƙasashe da yawa, amma an haramta shi a wasu. Koyaushe ka bincika dokokin ƙasarka kafin ka fara.",
      "q0": "Menene ASIC Cloud?",
      "a0":
      "ASIC Cloud yana nufin haƙar ma'adinai ta yanar gizo (cloud) wanda ke amfani da na'urorin ASIC. Maimakon sayen na'urori masu tsada, masu amfani ke hayar ƙarfi daga manyan cibiyoyin da ke da waɗannan na'urori.",
      "q9": "Yaya zan fara haƙar Bitcoin?",
      "a9":
      "Don fara haƙar Bitcoin, kawai danna maɓallin 'Fara Haƙar Ma'adinai' kuma aikin zai fara da kansa.",
      "q10": "Zan iya gwada haƙar Bitcoin kyauta?",
      "a10":
      " Eh! Sabbin masu amfani za su iya gwada haƙar BTC kyauta. Kawai yi rajista, kalli talla, sannan ka fara haƙar ma'adinai nan take.",
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
      "hsmn": "Sua mineração em nuvem será pausada quando o timer terminar. Reinicie manualmente para continuar minerando.",
      "hsm": "Começar Mineração",
      "hab": "Booster Ativo",
      "hdr": "Recompensa Diária",
      "hadboost": "Anúncio & Boost",
      "hqr": "Recompensa Rápida",
      "hdqh": "Recompensa de Anúncio Rápido",

      // store
      "swAdBoost": "Resgatar",
      "spn": "Fazer Upgrade Agora",
      "scpeed": "Velocidade Ativa: ",
      "scfpb": "Booster de Velocidade Grátis",
      "scfs": "Velocidade Grátis",

      // setting
      "sp": "Perfil",
      "sep": "Editar Perfil",
      "sg": "Geral",
      "scp": "Plano Atual",
      "swb": "Sacar BTC",
      "srs": "Restaurar Assinatura",
      "so": "Outros",
      "srf": "Indicar Amigos",
      "sl": "Idioma",
      "sru": "Avalie-nos",
      "ss": "Compartilhar",
      "sas": "Conta & Suporte",
      "spp": "Política de Privacidade",
      "scs": "Suporte ao Cliente",
      "slo": "Sair",
      "sda": "Excluir Conta",
      "sShareText":
      "🔐 Seguro. Confiável. Eficiente.\nMine Bitcoin com confiança usando ferramentas de mineração ASIC de alta performance.\n📊 Acompanhamento transparente de ganhos\n⚙️ Performance de mineração otimizada\n🛡️ Construído com foco em segurança e estabilidade\n👇 Baixe o Bitcoin Mining (ASIC Miner) e comece a minerar com segurança hoje.\n👉@shareAppLink",
      "sruf": "Adoraríamos receber seu feedback!",
      "srufText":
      "Obrigado por fazer parte da família Bitcoin Mining (ASIC Miner) 🫶 Se você está gostando da sua jornada de mineração, reserve um momento para deixar uma avaliação ⭐️. Seu feedback nos ajuda a melhorar a segurança, performance e confiabilidade para todos.",
      "srufsb": "Enviar",
      "slt": "Tem certeza que deseja sair da sua conta?",
      "slyb": "Sim",
      "slnb": "Não",
      "sdh": "Tem certeza que deseja excluir sua conta?",
      "sdsub": "Isso apagará permanentemente todos os seus dados. Esta ação não pode ser desfeita.",
      "sdstostm": "✅ Sua conta foi excluída e todos os dados foram apagados.",
      "srsm":
      "Sua assinatura foi restaurada com sucesso. Seu poder de mineração aumentou e você pode continuar ganhando sem interrupções.",

      // Edit Profile
      "epn": "Nome",
      "epne": "Por favor, insira seu nome completo",
      "epe": "E-mail",
      "epee": "Insira um endereço de e-mail válido",
      "epp": "Número de Telefone",
      "eppe": "Insira um número de telefone válido",
      "epu": "Atualizar",

      // Withdraw BTC
      "wbera": "Endereço do Destinatário",
      "wberae": "Por favor, insira um endereço válido",
      "wbwl": "Limite de Saque: @limit BTC",
      "wbwle": "Você deve ter pelo menos @limitError BTC para sacar.",
      "wbpb": "Prosseguir",
      "wbwh": "Histórico de Saques",
      "wbydhapy": "Você ainda não possui histórico de pagamentos.",
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
      "🔐 Junte-se a mim no Bitcoin Mining (ASIC Miner)\nEstou usando este app para minerar Bitcoin com ferramentas seguras e de alta performance. É fácil começar e gratuito para participar.\n🎁 Use meu código de convite @referralCode para receber seu bônus instantaneamente.\n👇 Baixe o app e comece a minerar hoje:\n👉 @siAppLink",

      // Customer Support
      "csym": "Sua Mensagem",
      "cstymh": "Digite sua mensagem aqui...",
      "csmr": "A mensagem é obrigatória.",
      "css": "Enviar",

      // etc
      'srd': "Concluído",

      // store info
      "sisa": "Alocação de Velocidade:",
      "sip": "Nível de Energia:",
      "sies": "Velocidade de Ganho:",
      "siltos": "Oferta por Tempo Limitado – Economize ",
      "siap": "Ativar Plano",
      "sisub":
      "Sua assinatura é renovada automaticamente de acordo com seu plano, a menos que você cancele. Você pode gerenciá-la a qualquer momento no Google Play.",
      "sissm": "Seu plano @name @speed foi ativado por @day dias.",

      // sign page
      "lh": "Olá! Bem-vindo de volta 👋 Vamos começar",
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
      "srsubtwo": " um boost de mineração em nuvem na sua conta!",
      "srls": "Vamos Começar",
      "srdh": "Assista a este anúncio para resgatar seu bônus de boas-vindas gratuito de @value BTC na sua carteira.",
      "srdnt": "Não, Obrigado",

      // utils
      "watchAdTitle": "Assista a este anúncio para aumentar seu poder de mineração para @text por @adTime minutos ⚡",
      "watchAdN": "Agora não",
      "watchAdY": "Assistir Agora",

      // FAQ
      'q1': "O que é Mineração de Bitcoin em Nuvem?",
      'a1':
      "A Mineração de Bitcoin em Nuvem é um método de mineração remota onde os usuários alugam poder computacional de data centers para minerar Bitcoin. Isso elimina a necessidade de hardware físico, configuração ou manutenção. Os usuários ganham recompensas diárias com base no hashrate que adquirem.",
      'q3': "Posso minerar Bitcoin remotamente?",
      'a3':
      "Sim, você pode minerar Bitcoin remotamente através da mineração em nuvem. Isso permite que você alugue poder de mineração de data centers sem possuir nenhum hardware. O processo de mineração ocorre em servidores remotos.",
      'q4': "O que é Hashrate?",
      'a4':
      "Hashrate é a medida do poder computacional usado na mineração de Bitcoin. Representa quantos cálculos (ou 'hashes') um sistema pode realizar por segundo para resolver algoritmos complexos. Um hashrate mais alto significa mineração mais rápida.",
      'q5': "É possível lucrar com a Mineração em Nuvem?",
      'a5':
      "Sim, com o plano certo e atividade consistente, a mineração em nuvem de Bitcoin pode gerar ganhos estáveis. A lucratividade depende do seu hashrate, preço do BTC e duração da mineração.",
      'q6': "É possível aumentar a velocidade da mineração remota?",
      'a6':
      "Sim, ao fazer o upgrade do seu plano de mineração em nuvem para um hashrate maior, você pode aumentar sua velocidade de mineração e ganhar Bitcoin de forma mais eficiente.",
      'q7': "Quanto tempo leva para atingir o limite de saque?",
      'a7':
      "O tempo depende da sua velocidade de mineração (hashrate), tipo de plano e consistência. Com um hashrate maior e atividade diária, muitos usuários atingem o limite em poucas semanas ou um mês.",
      'q8': "A mineração de Bitcoin é legal?",
      'a8':
      "Sim, a mineração de Bitcoin é legal em muitos países, mas restrita ou proibida em outros. Sempre verifique as regulamentações locais antes de minerar.",
      "q0": "O que é uma Nuvem ASIC?",
      "a0":
      "Uma Nuvem ASIC refere-se à mineração de criptomoedas baseada em nuvem que utiliza mineradores ASIC (Circuito Integrado de Aplicação Específica). Em vez de manter hardware caro, os usuários alugam poder de máquinas de alta performance otimizadas para Bitcoin.",
      "q9": "Como começo a minerar Bitcoin?",
      "a9":
      "Para começar a minerar Bitcoin, basta clicar no botão 'Começar Mineração' e o processo começará automaticamente.",
      "q10": "Posso testar a mineração de Bitcoin grátis?",
      "a10":
      "Sim! Novos usuários podem testar a mineração de BTC gratuitamente. Basta se registrar, assistir aos anúncios e começar a minerar instantaneamente.",
    },

  };
}
