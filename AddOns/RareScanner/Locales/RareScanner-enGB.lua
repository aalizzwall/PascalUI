﻿-- Locale
local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local AL = AceLocale:NewLocale("RareScanner", "enGB", false);

if AL then
	-- UI strings
	AL["CHECK_MAP"] = "Check your map!";
	AL["UNKNOWN_TARGET"] = "Unknown target";
	AL["JUST_SPAWNED"] = " just showed up";
	AL["NOT_TARGETEABLE"] = "Not targeteable";
	AL["CLICK_TARGET"] = "Click to target NPC";
	AL["ALARM_MESSAGE"] = "A rare NPC just showed up, check your map!";
	
	-- UI config panel
	AL["GENERAL_OPTIONS"] = "General options";
	AL["ENABLE_SCAN_RARES"] = "Toggle searching rare NPCs";
	AL["ENABLE_SCAN_RARES_DESC"] = "When this is activated you will be warned visually and with a sound everytime a rare NPC shows up in your minimap";
	AL["ENABLE_SCAN_CONTAINERS"] = "Toggle searching treasures or chests";
	AL["ENABLE_SCAN_CONTAINERS_DESC"] = "When this is activated you will be warned visually and with a sound everytime a treasure or chest shows up in your minimap";
	AL["ENABLE_SCAN_EVENTS"] = "Toggle searching events";
	AL["ENABLE_SCAN_EVENTS_DESC"] = "When this is activated you will be warned visually and with a sound everytime an event shows up in your minimap";
	AL["SOUND"] = "Sound";
	AL["SOUND_OPTIONS"] = "Sound options";
	AL["ALARM_SOUND"] = "Warning sound";
	AL["ALARM_SOUND_DESC"] = "Sound played when a rare NPC, treasure/chest or event shows up in your minimap";
	AL["DISPLAY"] = "Display";
	AL["DISPLAY_OPTIONS"] = "Display options";
	AL["DISPLAY_BUTTON"] = "Toggle showing the button and the miniature";
	AL["DISPLAY_BUTTON_DESC"] = "When disabled the button and the miniature won't be shown again. It doesn't affect the alarm sound and the chat alerts.";
	AL["AUTO_HIDE_BUTTON"] = "Autohide button and miniature";
	AL["AUTO_HIDE_BUTTON_DESC"] = "Hides the button and the miniature automatically after the time selected (in seconds). If you select zero seconds the button and the miniature won't autohide.";
	AL["SHOW_CHAT_ALERT"] = "Toggle showing chat alerts";
	AL["SHOW_CHAT_ALERT_DESC"] = "Shows a private message in the chat every time a treasure, chest or NPC is found.";
	
	-- Rares Pandaria
	AL["Aeonaxx"] = 50062; --Aeonaxx
	AL["Aetha"] = 58778; --Aetha
	AL["Aethis"] = 50750; --Aethis
	AL["Ahone the Wanderer"] = 50817; --Ahone the Wanderer
	AL["Ai-Li Skymirror"] = 50821; --Ai-Li Skymirror
	AL["Ai-Ran the Shifting Cloud"] = 50822; --Ai-Ran the Shifting Cloud
	AL["Al'tabim the All-Seeing"] = 70000; --Al'tabim the All-Seeing
	AL["Ankha"] = 54318; --Ankha
	AL["Anthriss"] = 54338; --Anthriss
	AL["Archiereus of Flame"] = 73666; --Archiereus of Flame
	AL["Archritualist Kelada"] = 70243; --Archritualist Kelada
	AL["Arness the Scale"] = 50787; --Arness the Scale
	AL["Backbreaker Uru"] = 70001; --Backbreaker Uru
	AL["Bai-Jin the Butcher"] = 58949; --Bai-Jin the Butcher
	AL["Ban'thalos"] = 54320; --Ban'thalos
	AL["Baolai the Immolator"] = 63695; --Baolai the Immolator
	AL["Blackhoof"] = 51059; --Blackhoof
	AL["Bloodtip"] = 58474; --Bloodtip
	AL["Bonobos"] = 50828; --Bonobos
	AL["Borginn Darkfist"] = 50341; --Borginn Darkfist
	AL["Bufo"] = 72775; --Bufo
	AL["Champion of the Black Flame"] = 73171; --Champion of the Black Flame
	AL["Chelon"] = 72045; --Chelon
	AL["Cinderfall"] = 73175; --Cinderfall
	AL["Cournith Waterstrider"] = 50768; --Cournith Waterstrider
	AL["Cracklefang"] = 58768; --Cracklefang
	AL["Cranegnasher"] = 72049; --Cranegnasher
	AL["Dak the Breaker"] = 50334; --Dak the Breaker
	AL["Dalan Nightbreaker"] = 68318; --Dalan Nightbreaker
	AL["Deth'tilac"] = 54322; --Deth'tilac
	AL["Disha Fearwarden"] = 68319; --Disha Fearwarden
	AL["Doctor Theolen Krastinov"] = 59369; --Doctor Theolen Krastinov
	AL["Dread Ship Vazuvius"] = 73281; --Dread Ship Vazuvius
	AL["Emerald Gander"] = 73158; --Emerald Gander
	AL["Eshelon"] = 50772; --Eshelon
	AL["Evermaw"] = 73279; --Evermaw
	AL["Ferdinand"] = 51078; --Ferdinand
	AL["Flesh'rok the Diseased"] = 70429; --Flesh'rok the Diseased
	AL["Flintlord Gairan"] = 73172; --Flintlord Gairan
	AL["Focused Eye"] = 70249; --Focused Eye
	AL["Gaarn the Toxic"] = 50340; --Gaarn the Toxic
	AL["Gaohun the Soul-Severer"] = 62881; --Gaohun the Soul-Severer
	AL["Gar'lok"] = 50739; --Gar'lok
	AL["Garnia"] = 73282; --Garnia
	AL["General Temuja"] = 63101; --General Temuja
	AL["Ghostcrawler"] = 50051; --Ghostcrawler
	AL["Go-Kan"] = 50331; --Go-Kan
	AL["Gochao the Ironfist"] = 62880; --Gochao the Ironfist
	AL["God-Hulk Ramuk"] = 69999; --God-Hulk Ramuk
	AL["Goda"] = 69998; --Goda
	AL["Golganarr"] = 72970; --Golganarr
	AL["Great Turtle Furyshell"] = 73161; --Great Turtle Furyshell
	AL["Gu'chi the Swarmbringer"] = 72909; --Gu'chi the Swarmbringer
	AL["Havak"] = 50354; --Havak
	AL["Haywire Sunreaver Construct"] = 50358; --Haywire Sunreaver Construct
	AL["Huo-Shuang"] = 63691; --Huo-Shuang
	AL["Huolon"] = 73167; --Huolon
	AL["Ik-Ik the Nimble"] = 50836; --Ik-Ik the Nimble
	AL["Imperial Python"] = 73163; --Imperial Python
	AL["Ironfur Steelhorn"] = 73160; --Ironfur Steelhorn
	AL["Jadefang"] = 49822; --Jadefang
	AL["Jakur of Ordon"] = 73169; --Jakur of Ordon
	AL["Jonn-Dar"] = 50351; --Jonn-Dar
	AL["Kah'tir"] = 50355; --Kah'tir
	AL["Kal'tik the Blight"] = 50749; --Kal'tik the Blight
	AL["Kang the Soul Thief"] = 50349; --Kang the Soul Thief
	AL["Kar Warmaker"] = 68321; --Kar Warmaker
	AL["Karkanos"] = 72193; --Karkanos
	AL["Karkin"] = 50959; --Karkin
	AL["Karoma"] = 50138; --Karoma
	AL["Karr the Darkener"] = 50347; --Karr the Darkener
	AL["Kirix"] = 54323; --Kirix
	AL["Kor'nas Nightsavage"] = 50338; --Kor'nas Nightsavage
	AL["Korda Torros"] = 50332; --Korda Torros
	AL["Krakkanon"] = 70323; --Krakkanon
	AL["Krax'ik"] = 50363; --Krax'ik
	AL["Kri'chon"] = 63978; --Kri'chon
	AL["Krol the Blade"] = 50356; --Krol the Blade
	AL["Ku'lai the Skyclaw"] = 69996; --Ku'lai the Skyclaw
	AL["Leafmender"] = 73277; --Leafmender
	AL["Lith'ik the Stalker"] = 50734; --Lith'ik the Stalker
	AL["Lon the Bull"] = 50333; --Lon the Bull
	AL["Lu-Ban"] = 70002; --Lu-Ban
	AL["Magria"] = 54319; --Magria
	AL["Major Nanners"] = 50840; --Major Nanners
	AL["Mavis Harms"] = 68317; --Mavis Harms
	AL["Mister Ferocious"] = 50823; --Mister Ferocious
	AL["Moldo One-Eye"] = 50806; --Moldo One-Eye
	AL["Molthor"] = 70003; --Molthor
	AL["Monara"] = 70440; --Monara
	AL["Monstrous Spineclaw"] = 73166; --Monstrous Spineclaw
	AL["Morgrinn Crackfang"] = 50350; --Morgrinn Crackfang
	AL["Muerta"] = 68322; --Muerta
	AL["Mumta"] = 69664; --Mumta
	AL["Nal'lak the Ripper"] = 50364; --Nal'lak the Ripper
	AL["Nalash Verdantis"] = 50776; --Nalash Verdantis
	AL["Nasra Spothide"] = 50811; --Nasra Spothide
	AL["Nessos the Oracle"] = 50789; --Nessos the Oracle
	AL["No'ku Stormsayer"] = 70276; --No'ku Stormsayer
	AL["Norlaxx"] = 50344; --Norlaxx
	AL["Omnis Grinlok"] = 50805; --Omnis Grinlok
	AL["Overlord Sunderfury"] = 50085; --Overlord Sunderfury
	AL["Prince Lakma"] = 54533; --Prince Lakma
	AL["Progenitus"] = 69997; --Progenitus
	AL["Qu'nas"] = 50352; --Qu'nas
	AL["Quid"] = 58771; --Quid
	AL["Ra'sha"] = 70530; --Ra'sha
	AL["Rattleskew"] = 72048; --Rattleskew
	AL["Rock Moss"] = 73157; --Rock Moss
	AL["Rocky Horror"] = 70430; --Rocky Horror
	AL["Ruun Ghostpaw"] = 50816; --Ruun Ghostpaw
	AL["Sahn Tidehunter"] = 50780; --Sahn Tidehunter
	AL["Salyin Warscout"] = 50783; --Salyin Warscout
	AL["Sambas"] = 50159; --Sambas
	AL["Sarnak"] = 50782; --Sarnak
	AL["Scritch"] = 50831; --Scritch
	AL["Sele'na"] = 50766; --Sele'na
	AL["Shadowmaster Sydow"] = 63240; --Shadowmaster Sydow
	AL["Siltriss the Sharpener"] = 50791; --Siltriss the Sharpener
	AL["Skarr"] = 50815; --Skarr
	AL["Ski'thik"] = 50733; --Ski'thik
	AL["Skitterflame"] = 54324; --Skitterflame
	AL["Solix"] = 54321; --Solix
	AL["Spelurk"] = 71864; --Spelurk
	AL["Spirit of Jadefire"] = 72769; --Spirit of Jadefire
	AL["Spirit of Lao-Fe"] = 58817; --Spirit of Lao-Fe
	AL["Spriggin"] = 50830; --Spriggin
	AL["Stinkbraid"] = 73704; --Stinkbraid
	AL["Sulik'shor"] = 50339; --Sulik'shor
	AL["Tarvus the Vile"] = 50086; --Tarvus the Vile
	AL["The Yowler"] = 50832; --The Yowler
	AL["Torik-Ethis"] = 50388; --Torik-Ethis
	AL["Tsavo'ka"] = 72808; --Tsavo'ka
	AL["Ubunti the Shade"] = 68320; --Ubunti the Shade
	AL["Unblinking Eye"] = 70238; --Unblinking Eye
	AL["Urdur the Cauterizer"] = 73173; --Urdur the Cauterizer
	AL["Urgolax"] = 50359; --Urgolax
	AL["Urobi the Walker"] = 50808; --Urobi the Walker
	AL["Vicejaw"] = 58769; --Vicejaw
	AL["Vyraxxis"] = 63977; --Vyraxxis
	AL["War-God Dokah"] = 70096; --War-God Dokah
	AL["Watcher Osu"] = 73170; --Watcher Osu
	AL["Whizzig"] = 73293; --Whizzig
	AL["Willy Wilder"] = 70126; --Willy Wilder
	AL["Wulon"] = 63510; --Wulon
	AL["Yorik Sharpeye"] = 50336; --Yorik Sharpeye
	AL["Yul Wildpaw"] = 50820; --Yul Wildpaw
	AL["Zai the Outcast"] = 50769; --Zai the Outcast
	AL["Zandalari Warbringer"] = 69769; --Zandalari Warbringer cian
	AL["Zandalari Warbringer"] = 69842; --Zandalari Warbringer gray
	AL["Zandalari Warbringer"] = 69841; --Zandalari Warbringer silver
	AL["Zandalari Warscout"] = 69768; --Zandalari Warscout
	AL["Zao'cho"] = 69843; --Zao'cho
	AL["Zesqua"] = 72245; --Zesqua
	AL["Zhu-Gon the Sour"] = 71919; --Zhu-Gon the Sour
	
	-- Rares Draenor
	AL["Amaukwa"] = 77140; --Amaukwa
	AL["Ancient Blademaster"] = 82899; --Ancient Blademaster
	AL["Aqualir"] = 86213; --Aqualir
	AL["Avatar of Socrethar"] = 88043; --Avatar of Socrethar
	AL["Ba'ruun"] = 82326; --Ba'ruun
	AL["Bahameye"] = 81406; --Bahameye
	AL["Bashiok"] = 82085; --Bashiok
	AL["Beastcarver Saramor"] = 78150; --Beastcarver Saramor
	AL["Betsi Boombasket"] = 84887; --Betsi Boombasket
	AL["Blade-Dancer Aeryx"] = 80614; --Blade-Dancer Aeryx
	AL["Blightglow"] = 84856; --Blightglow
	AL["Brambleking Fili"] = 81639; --Brambleking Fili
	AL["Breathless"] = 78867; --Breathless
	AL["Brutag Grimblade"] = 87234; --Brutag Grimblade
	AL["Canyon Icemother"] = 71721; --Canyon Icemother
	AL["Char the Burning"] = 82311; --Char the Burning
	AL["Chillfang"] = 80242; --Chillfang
	AL["Cindermaw"] = 72294; --Cindermaw
	AL["Cloudspeaker Daber"] = 78169; --Cloudspeaker Daber
	AL["Coldstomp the Griever"] = 77513; --Coldstomp the Griever
	AL["Coldtusk"] = 76914; --Coldtusk
	AL["Cro Fleshrender"] = 77620; --Cro Fleshrender
	AL["Cyclonic Fury"] = 78621; --Cyclonic Fury
	AL["Dark Emanation"] = 77085; --Dark Emanation
	AL["Darkmaster Go'vid"] = 82268; --Darkmaster Go'vid
	AL["Darktalon"] = 82411; --Darktalon
	AL["Deadshot Kizi"] = 77763; --Deadshot Kizi
	AL["Depthroot"] = 82058; --Depthroot
	AL["Direhoof"] = 86729; --Direhoof
	AL["Dr. Gloom"] = 77561; --Dr. Gloom
	AL["Durkath Steelmaw"] = 84807; --Durkath Steelmaw
	AL["Elementalist Utrah"] = 77768; --Elementalist Utrah
	AL["Enavra"] = 82676; --Enavra
	AL["Enavra"] = 82742; --Enavra
	AL["Faebright"] = 82207; --Faebright
	AL["Fangler"] = 82975; --Fangler
	AL["Felbark"] = 80204; --Felbark
	AL["Felfire Consort"] = 82992; --Felfire Consort
	AL["Festerbloom"] = 84890; --Festerbloom
	AL["Firefury Giant"] = 74971; --Firefury Giant
	AL["Firestarter Grash"] = 88580; --Firestarter Grash
	AL["Flinthide"] = 83483; --Flinthide
	AL["Forge Matron Targa"] = 77648; --Forge Matron Targa
	AL["Fossilwood the Petrified"] = 85250; --Fossilwood the Petrified
	AL["Frenzied Golem"] = 77614; --Frenzied Golem
	AL["Galzomar"] = 78713; --Galzomar
	AL["Gar'lua"] = 82764; --Gar'lua
	AL["Garrison Ford"] = 86058; --Garrison Ford
	AL["Gelgor of the Blue Flame"] = 81038; --Gelgor of the Blue Flame
	AL["General Aevd"] = 82882; --General Aevd
	AL["Gennadian"] = 80471; --Gennadian
	AL["Giant-Slayer Kul"] = 71665; --Giant-Slayer Kul
	AL["Giantslayer Kimla"] = 78144; --Giantslayer Kimla
	AL["Glimmerwing"] = 77719; --Glimmerwing
	AL["Glut"] = 80868; --Glut
	AL["Gnarlhoof the Rabid"] = 82778; --Gnarlhoof the Rabid
	AL["Gorum"] = 76380; --Gorum
	AL["Grand Marshal Tremblade"] = 82876; --Grand Marshal Tremblade
	AL["Greatfeather"] = 82758; --Greatfeather
	AL["Greldrok the Cunning"] = 84431; --Greldrok the Cunning
	AL["Grizzlemaw"] = 82912; --Grizzlemaw
	AL["Gronnstalker Dawarn"] = 78128; --Gronnstalker Dawarn
	AL["Grove Warden Yal"] = 88583; --Grove Warden Yal
	AL["Grutush the Pillager"] = 80312; --Grutush the Pillager
	AL["Gruuk"] = 80190; --Gruuk
	AL["Gurun"] = 80235; --Gurun
	AL["Haakun the All-Consuming"] = 83008; --Haakun the All-Consuming
	AL["Hammertooth"] = 77715; --Hammertooth
	AL["Hen-Mother Hami"] = 77626; --Hen-Mother Hami
	AL["Hermit Palefur"] = 86724; --Hermit Palefur
	AL["High Warlord Volrath"] = 82877; --High Warlord Volrath
	AL["Hunter Bal'ra"] = 88672; --Hunter Bal'ra
	AL["Hunter Blacktooth"] = 83603; --Hunter Blacktooth
	AL["Huntmaster Kuang"] = 78151; --Huntmaster Kuang
	AL["Hyperious"] = 78161; --Hyperious
	AL["Insha'tar"] = 83553; --Insha'tar
	AL["Jabberjaw"] = 82616; --Jabberjaw
	AL["Jaluk the Pacifist"] = 87600; --Jaluk the Pacifist
	AL["Jiasska the Sporegorger"] = 84955; --Jiasska the Sporegorger
	AL["Kalos the Bloodbathed"] = 84810; --Kalos the Bloodbathed
	AL["Karosh Blackwind"] = 86959; --Karosh Blackwind
	AL["Kharazos the Triumphant"] = 78710; --Kharazos the Triumphant
	AL["Killmaw"] = 74206; --Killmaw
	AL["Klikixx"] = 78872; --Klikixx
	AL["Ku'targ the Voidseer"] = 72362; --Ku'targ the Voidseer
	AL["Lady Temptessa"] = 85121; --Lady Temptessa
	AL["Leaf-Reader Kurri"] = 72537; --Leaf-Reader Kurri
	AL["Lo'marg Jawcrusher"] = 77784; --Lo'marg Jawcrusher
	AL["Lord Korinak"] = 82920; --Lord Korinak
	AL["Mad \"King\" Sporeon"] = 77310; --Mad "King" Sporeon
	AL["Malroc Stonesunder"] = 83643; --Malroc Stonesunder
	AL["Mandrakor"] = 84406; --Mandrakor
	AL["Marshal Gabriel"] = 82878; --Marshal Gabriel
	AL["Marshal Karsh Stormforge"] = 82880; --Marshal Karsh Stormforge
	AL["Matron of Sin"] = 82998; --Matron of Sin
	AL["Morva Soultwister"] = 82362; --Morva Soultwister
	AL["Mother Araneae"] = 76473; --Mother Araneae
	AL["Mother Om'ra"] = 75071; --Mother Om'ra
	AL["Mutafen"] = 84417; --Mutafen
	AL["Nas Dunberlin"] = 82247; --Nas Dunberlin
	AL["No'losh"] = 79334; --No'losh
	AL["Ophiis"] = 83409; --Ophiis
	AL["Oskiira the Vengeful"] = 84872; --Oskiira the Vengeful
	AL["Outrider Duretha"] = 83680; --Outrider Duretha
	AL["Pale Fishmonger"] = 78606; --Pale Fishmonger
	AL["Pathfinder Jalog"] = 78134; --Pathfinder Jalog
	AL["Pathstalker Draga"] = 77095; --Pathstalker Draga
	AL["Pit Beast"] = 88208; --Pit Beast
	AL["Poisonmaster Bortusk"] = 84838; --Poisonmaster Bortusk
	AL["Primalist Mur'og"] = 76918; --Primalist Mur'og
	AL["Pyrecaster Zindra"] = 77642; --Pyrecaster Zindra
	AL["Ra'kahn"] = 77741; --Ra'kahn
	AL["Ragore Driftstalker"] = 84392; --Ragore Driftstalker
	AL["Rai'vosh"] = 82374; --Rai'vosh
	AL["Redclaw the Feral"] = 82755; --Redclaw the Feral
	AL["Rotcap"] = 85504; --Rotcap
	AL["Sangrikass"] = 84833; --Sangrikass
	AL["Scout Goreseeker"] = 77526; --Scout Goreseeker
	AL["Sean Whitesea"] = 83542; --Sean Whitesea
	AL["Shadowbark"] = 79938; --Shadowbark
	AL["Shinri"] = 82415; --Shinri
	AL["Sikthiss, Maiden of Slaughter"] = 78715; --Sikthiss, Maiden of Slaughter
	AL["Silverleaf Ancient"] = 79686; --Silverleaf Ancient
	AL["Silverleaf Ancient"] = 79693; --Silverleaf Ancient
	AL["Silverleaf Ancient"] = 79692; --Silverleaf Ancient
	AL["Solar Magnifier"] = 83990; --Solar Magnifier
	AL["Soulfang"] = 80057; --Soulfang
	AL["Steeltusk"] = 86549; --Steeltusk
	AL["Stomper Kreego"] = 79629; --Stomper Kreego
	AL["Stonespite"] = 84805; --Stonespite
	AL["Sulfurious"] = 80725; --Sulfurious
	AL["Sunclaw"] = 86137; --Sunclaw
	AL["Sunderthorn"] = 84912; --Sunderthorn
	AL["Swarmleaf"] = 85520; --Swarmleaf
	AL["Swift Onyx Flayer"] = 88582; --Swift Onyx Flayer
	AL["Talonbreaker"] = 84836; --Talonbreaker
	AL["Talonpriest Zorkra"] = 79485; --Talonpriest Zorkra
	AL["Tesska the Broken"] = 84775; --Tesska the Broken
	AL["The Beater"] = 77527; --The Beater
	AL["Tor'goroth"] = 82618; --Tor'goroth
	AL["Tura'aka"] = 83591; --Tura'aka
	AL["Varasha"] = 82050; --Varasha
	AL["Veloss"] = 75482; --Veloss
	AL["Voidreaver Urnae"] = 85078; --Voidreaver Urnae
	AL["Voidseer Kalurg"] = 83385; --Voidseer Kalurg
	AL["Vulceros"] = 77926; --Vulceros
	AL["Wandering Vindicator"] = 77776; --Wandering Vindicator
	AL["Warcaster Bargol"] = 78733; --Warcaster Bargol
	AL["Warmaster Blugthol"] = 79024; --Warmaster Blugthol
	AL["Windfang Matriarch"] = 75434; --Windfang Matriarch
	AL["Xothear, the Destroyer"] = 82922; --Xothear, the Destroyer
	AL["Yaga the Scarred"] = 79145; --Yaga the Scarred
	AL["Yazheera the Incinerator"] = 77529; --Yazheera the Incinerator
	AL["Yggdrel"] = 75435; --Yggdrel
end