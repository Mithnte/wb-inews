-- Config by & Bae
Config = {}

Config.JobNames = {'reporter', 'wartawan'}

Config.TVStation = vector3(-1037.17, -2731.79, 20.85)  -- HQ spawn

Config.CriminalHotSpots = {  -- Lokasi activity kriminal umum (netral)
    vector3(-50, -1750, 29),
    vector3(250, -1400, 30),
    vector3(500, -1000, 25),
    vector3(-1000, 500, 20)
}

-- Cooldown (ms)
Config.SpawnCooldown     = 600000   -- Van
Config.HeliCooldown      = 900000   -- Heli
Config.DroneCooldown     = 1200000  -- Drone
Config.ExposeCooldown    = 120000   -- Expose
Config.PublishCooldown   = 300000   -- Publish berita
Config.LiveCooldown      = 600000   -- Live streaming baru
Config.LiveDurationMax   = 600000   -- Max 10 menit per live

-- Reward
Config.BaseReward        = 200
Config.PerPlayerReward   = 1
Config.FactionBadBonus   = 500
Config.LiveBonusPerViewer = 5       -- $ per viewer deket

-- Pesan expose netral
Config.ExposeHeadline    = "AKTIVITAS KRIMINAL TERTANGKAP!"
Config.ExposeDesc        = "IME News laporkan aktivitas mencurigakan di lokasi ini!"