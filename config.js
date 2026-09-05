module.exports = {
  server: {
    port: process.env.PORT || 7860,
    address: '0.0.0.0',
    password: process.env.NODELINK_PASSWORD || 'YOUR_SECURE_PASSWORD'
  },
  options: {
    bypassRegion: false,
    logFile: false,
    playerMode: 'worker', // 'worker' or 'native'
    plugins: []
  }
}
