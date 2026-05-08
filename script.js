const screens = document.querySelectorAll(".screen");
const toast = document.getElementById("toast");
const selectedMoodTag = document.getElementById("selected-mood-tag");

const songs = [
  { title: "Late Library", artist: "윤하린", coverClass: "album-library-large" },
  { title: "밤공기", artist: "서우", coverClass: "album-night-large" },
  { title: "Slow Campus", artist: "민재", coverClass: "album-campus-large" },
  { title: "Rainy Walk", artist: "하린밴드", coverClass: "album-rain-large" }
];

function showScreen(screenId) {
  screens.forEach((screen) => screen.classList.remove("active"));
  const target = document.getElementById(screenId);
  if (target) target.classList.add("active");
  updateNav(screenId);
}

function updateNav(screenId) {
  document.querySelectorAll(".nav-item").forEach((item) => {
    item.classList.remove("active");
    if (item.dataset.target === screenId) item.classList.add("active");
    if (screenId === "player-screen" && item.dataset.target === "recommend-screen") item.classList.add("active");
  });
}

function showToast(message) {
  toast.textContent = message;
  toast.classList.add("show");
  setTimeout(() => toast.classList.remove("show"), 1800);
}

document.getElementById("start-btn").addEventListener("click", () => showScreen("home-screen"));

document.querySelectorAll(".mood-card").forEach((card) => {
  card.addEventListener("click", () => {
    document.querySelectorAll(".mood-card").forEach((item) => item.classList.remove("selected"));
    card.classList.add("selected");
    selectedMoodTag.textContent = `${card.dataset.icon} ${card.dataset.mood}`;
    showScreen("recommend-screen");
  });
});

document.querySelectorAll(".song-card").forEach((card) => {
  card.addEventListener("click", (event) => {
    if (event.target.classList.contains("more-btn") || event.target.classList.contains("mini-play")) {
      event.stopPropagation();
      return;
    }
    const song = songs[Number(card.dataset.index)];
    updatePlayer(song);
    showScreen("player-screen");
  });
});

function updatePlayer(song) {
  document.getElementById("player-title").textContent = song.title;
  document.getElementById("player-artist").textContent = song.artist;
  const cover = document.getElementById("player-cover");
  cover.classList.remove("album-library-large", "album-night-large", "album-campus-large", "album-rain-large");
  cover.classList.add(song.coverClass);
}

document.querySelectorAll(".back-btn").forEach((button) => {
  button.addEventListener("click", () => showScreen(button.dataset.back));
});

document.querySelectorAll(".nav-item").forEach((item) => {
  item.addEventListener("click", () => {
    if (item.classList.contains("nav-my")) {
      showToast("마이페이지는 준비 중입니다");
      return;
    }
    showScreen(item.dataset.target);
  });
});

document.getElementById("save-playlist-btn").addEventListener("click", () => {
  showToast("플레이리스트에 저장되었습니다");
});

const playToggle = document.getElementById("play-toggle");
playToggle.addEventListener("click", () => {
  playToggle.textContent = playToggle.textContent === "▶" ? "❚❚" : "▶";
});

const likeBtn = document.getElementById("like-btn");
likeBtn.addEventListener("click", () => {
  likeBtn.classList.toggle("liked");
  likeBtn.textContent = likeBtn.classList.contains("liked") ? "♥" : "♡";
});

function createWaveform() {
  const waveform = document.getElementById("waveform");
  waveform.innerHTML = "";
  for (let i = 0; i < 58; i++) {
    const bar = document.createElement("span");
    bar.className = "wave-bar";
    bar.style.height = `${7 + Math.random() * 27}px`;
    waveform.appendChild(bar);
  }
}

createWaveform();
