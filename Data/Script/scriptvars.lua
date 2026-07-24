--[[
    PMD: New Era - Main Script Configuration
    Defines the mod's script variables, save data structure, and core settings.
]]--

local config = {}

-- Mod identification
config.ModName = "PMD: New Era"
config.ModVersion = "1.0.0"
config.ModAuthor = "New Era Dev Team"

-- Story progression flags
config.StoryFlags = {
    Chapter = 0,
    TotalChapters = 20,
    PrologueComplete = false,
    EpilogueComplete = false,
}

-- Chapter completion tracking
for i = 1, 20 do
    config.StoryFlags["Chapter" .. i .. "Complete"] = false
    config.StoryFlags["Chapter" .. i .. "DungeonsCleared"] = 0
end

-- Key item tracking
config.KeyItems = {
    DimensionalAnchor = false,
    TimeCrest = false,
    SpacePearl = false,
    OriginPlate = false,
    DreamTorch = false,
    AncientRecording = false,
    GuardianSeal = false,
}

-- Character relationship tracking
config.Relationships = {
    PartnerFriendship = 0,
    RivalRespect = 0,
    GuildmasterTrust = 0,
    AbsolTrust = 0,
    CresseliaDreams = 0,
}

-- Boss defeat tracking
for _, boss in ipairs({
    "Zangoose", "Scrafty", "Claydol", "Dialga", "Palkia",
    "Giratina", "Darkrai", "Rayquaza", "Arceus", "PrimordialChaos"
}) do
    config.StoryFlags["Defeated" .. boss] = false
end

-- Recruitment tracking
config.Recruitment = {
    LegendaryRecruited = {},
    BossRecruited = {},
}

-- Endgame flags
config.EndgameFlags = {
    PostGameUnlocked = false,
    InfiniteDesertCleared = false,
    SecretLegendaryCount = 0,
}

-- New Era specific save variables
SV.ChapterProgression = {
    Chapter = 0,
    CurrentDungeon = "",
}

for i = 1, 20 do
    SV["Chapter" .. i] = {
        Started = false,
        Completed = false,
        DungeonsCleared = 0,
        KeyEvents = {},
    }
end

SV.Chapter1 = {
    PlayedIntroCutscene = false,
    PartnerCompletedForest = false,
    PartnerMetHero = false,
    TeamCompletedForest = false,
    DefeatedZangoose = false,
    ArrivedAtCity = false,
}

SV.Chapter2 = {
    JoinedGuild = false,
    MetCresselia = false,
    FirstInvestigationComplete = false,
    HoneycombCaveExplored = false,
}

SV.Chapter3 = {
    CityTourComplete = false,
    MetRival = false,
    FortuneRead = false,
    TrainingComplete = false,
}

SV.Chapter4 = {
    FirstCollapseWitnessed = false,
    MetAbsol = false,
    EmergencyResponseComplete = false,
}

SV.Chapter5 = {
    RuinsExplored = false,
    FlashbackSeen = false,
    MetZoroark = false,
    RecordingFound = false,
}

SV.Chapter6 = {
    RivalChallenged = false,
    CollapseMidBattle = false,
    ForgivenessScene = false,
}

SV.Chapter7 = {
    UndergroundCityDiscovered = false,
    MetClaydol = false,
    AnchorFound = false,
    AncientTextsRead = false,
}

SV.Chapter8 = {
    TemporalDimensionEntered = false,
    DialgaCorrupted = false,
    TimeCrestObtained = false,
    DialgaPurified = false,
}

SV.Chapter9 = {
    TimeLoopExperienced = false,
    MemoryFlood = false,
    PromiseRediscovered = false,
}

SV.Chapter10 = {
    SpaceBetweenReached = false,
    PalkiaMet = false,
    SpatialDimensionEntered = false,
    SpacePearlObtained = false,
}

SV.Chapter11 = {
    DimensionsColliding = false,
    CityEvacuated = false,
    GiratinaAppeared = false,
    NexusDefended = false,
}

SV.Chapter12 = {
    DistortionWorldEntered = false,
    GiratinaConfession = false,
    MercyTestPassed = false,
}

SV.Chapter13 = {
    ReincarnationRevealed = false,
    MemoryRestored = false,
    TrueIdentityKnown = false,
}

SV.Chapter14 = {
    NightmareManipulation = false,
    LucarioAttack = false,
    ForgivenessScene = false,
}

SV.Chapter15 = {
    SkyPillarClimbed = false,
    RayquazaTest = false,
    ArceusSilence = false,
}

SV.Chapter16 = {
    CollapseIntensified = false,
    HoOhCorrupted = false,
    CampDefended = false,
}

SV.Chapter17 = {
    HallOfOriginEntered = false,
    ArceusImprisoned = false,
    OriginPlateObtained = false,
}

SV.Chapter18 = {
    LegendaryGathering = false,
    FarewellScene = false,
    DarkraiLiberated = false,
    ApproachStarted = false,
}

SV.Chapter19 = {
    DreamDimensionEntered = false,
    LitwickPower = false,
    ChaosConfrontation = false,
    SacrificeScene = false,
}

SV.Chapter20 = {
    FinalBattle = false,
    WorldRestored = false,
    CreditsPlayed = false,
    PostGameUnlocked = false,
}

return config
