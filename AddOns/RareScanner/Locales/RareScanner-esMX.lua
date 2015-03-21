﻿-- Locale
local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local AL = AceLocale:NewLocale("RareScanner", "esMX", false);

if AL then
	-- UI strings
	AL["CHECK_MAP"] = "¡Mira en tu mapa!";
	AL["UNKNOWN_TARGET"] = "Objectivo desconocido";
	AL["JUST_SPAWNED"] = " acaba de aparecer";
	AL["NOT_TARGETEABLE"] = "No es seleccionable";
	AL["CLICK_TARGET"] = "Click para seleccionar NPC";
	AL["ALARM_MESSAGE"] = "Un NPC raro acaba de aparecer, ¡mira tu mapa!";
	
	-- UI config panel
	AL["GENERAL_OPTIONS"] = "Opciones generales";
	AL["ENABLE_SCAN_RARES"] = "Activa la búsqueda de NPCs raros";
	AL["ENABLE_SCAN_RARES_DESC"] = "Cuando este activo se avisará por pantalla y con un sonido cada vez que un NPC raro aparezca en el minimapa.";
	AL["ENABLE_SCAN_CONTAINERS"] = "Activa la búsqueda de tesoros, cofres...";
	AL["ENABLE_SCAN_CONTAINERS_DESC"] = "Cuando este activo se avisará por pantalla y con un sonido cada vez que un tesoro, cofre, etc aparezca en el minimapa.";
	AL["ENABLE_SCAN_EVENTS"] = "Activa la búsqueda de eventos";
	AL["ENABLE_SCAN_EVENTS_DESC"] = "Cuando este activo se avisará por pantalla y con un sonido cada vez que un area donde se este produciendo un evento, o algún objeto que al activarlo de lugar a un evento, aparezca en el minimapa.";
	AL["SOUND"] = "Sonido";
	AL["SOUND_OPTIONS"] = "Opciones de sonido";
	AL["ALARM_SOUND"] = "Sonido de alerta";
	AL["ALARM_SOUND_DESC"] = "Sonido a reproducir cuando se detecta un NPC, objeto o evento cerca";
	AL["DISPLAY"] = "Mostrar";
	AL["DISPLAY_OPTIONS"] = "Opciones de mostrar";
	AL["DISPLAY_BUTTON"] = "Mostrar botón y miniatura";
	AL["DISPLAY_BUTTON_DESC"] = "Si se desmarca se deja de mostrar el botón y la miniatura. No afecta al sonido de alarma ni a los mensajes de chat.";
	AL["AUTO_HIDE_BUTTON"] = "Esconder botón y miniatura automáticamente";
	AL["AUTO_HIDE_BUTTON_DESC"] = "Esconde el botón y la miniatura automáticamente pasado el tiempo seleccionado (en segundos). Si se marca cero segundos no se esconden automáticamente.";
	AL["SHOW_CHAT_ALERT"] = "Mostrar alertas de chat";
	AL["SHOW_CHAT_ALERT_DESC"] = "Muestra en el chat un mensaje privado cada vez que se detecta un cofre, tesoro o NPC.";
		
	-- Rares Pandaria
	AL["Aeonaxx"] = 50062; --Aeonaxx
	AL["Aetha"] = 58778; --Aetha
	AL["Aethis"] = 50750; --Aethis
	AL["Ahone el Errante"] = 50817; --Ahone the Wanderer
	AL["Ai-Li Reflejo Celeste"] = 50821; --Ai-Li Skymirror
	AL["Ai-Ran, la Nube Flotante"] = 50822; --Ai-Ran the Shifting Cloud
	AL["Al'tabim, El que todo lo ve"] = 70000; --Al'tabim the All-Seeing
	AL["Ankha"] = 54318; --Ankha
	AL["Anthriss"] = 54338; --Anthriss
	AL["Sacerdote ilustre de las llamas"] = 73666; --Archiereus of Flame
	AL["Archirritualista Kelada"] = 70243; --Archritualist Kelada
	AL["Arness la Escama"] = 50787; --Arness the Scale
	AL["Uru Partedorsales"] = 70001; --Backbreaker Uru
	AL["Bai-Jin el Carnicero"] = 58949; --Bai-Jin the Butcher
	AL["Ban'thalos"] = 54320; --Ban'thalos
	AL["Baolai el Inmolador"] = 63695; --Baolai the Immolator
	AL["Pezuña Negra"] = 51059; --Blackhoof
	AL["Picasangre"] = 58474; --Bloodtip
	AL["Bonobos"] = 50828; --Bonobos
	AL["Borginn Puño Oscuro"] = 50341; --Borginn Darkfist
	AL["Buffo"] = 72775; --Bufo
	AL["Campeón de la Llama Negra"] = 73171; --Champion of the Black Flame
	AL["Quelón"] = 72045; --Chelon
	AL["Carbonos"] = 73175; --Cinderfall
	AL["Cournith Tranco de Agua"] = 50768; --Cournith Waterstrider
	AL["Crujecolmillos"] = 58768; --Cracklefang
	AL["Mascagrullas"] = 72049; --Cranegnasher
	AL["Dak el Destructor"] = 50334; --Dak the Breaker
	AL["Dalan Rasganoche"] = 68318; --Dalan Nightbreaker
	AL["Deth'tilac"] = 54322; --Deth'tilac
	AL["Disha Eludemiedo"] = 68319; --Disha Fearwarden
	AL["Doctor Theolen Krastinov"] = 59369; --Doctor Theolen Krastinov
	AL["Barco aterrador Vazuvius"] = 73281; --Dread Ship Vazuvius
	AL["Ganso esmeralda"] = 73158; --Emerald Gander
	AL["Eshelon"] = 50772; --Eshelon
	AL["Fauce Eterna"] = 73279; --Evermaw
	AL["Ferdinand"] = 51078; --Ferdinand
	AL["Flesh'rok el Enfermo"] = 70429; --Flesh'rok the Diseased
	AL["Señor del sílex Gairan"] = 73172; --Flintlord Gairan
	AL["Ojo enfocado"] = 70249; --Focused Eye
	AL["Gaarn el Tóxico"] = 50340; --Gaarn the Toxic
	AL["Gaohun el Desmembraalmas"] = 62881; --Gaohun the Soul-Severer
	AL["Gar'lok"] = 50739; --Gar'lok
	AL["Garnia"] = 73282; --Garnia
	AL["General Temuja"] = 63101; --General Temuja
	AL["Reptafantasmas"] = 50051; --Ghostcrawler
	AL["Go-Kan"] = 50331; --Go-Kan
	AL["Gochao el Severo"] = 62880; --Gochao the Ironfist
	AL["Dios mole Ramuk"] = 69999; --God-Hulk Ramuk
	AL["Goda"] = 69998; --Goda
	AL["Golganarr"] = 72970; --Golganarr
	AL["Gran tortuga Irazón"] = 73161; --Great Turtle Furyshell
	AL["Gu'chi el Portaenjambres"] = 72909; --Gu'chi the Swarmbringer
	AL["Havak"] = 50354; --Havak
	AL["Ensamblaje Atracasol descontrolado"] = 50358; --Haywire Sunreaver Construct
	AL["Huo-Shuang"] = 63691; --Huo-Shuang
	AL["Huolon"] = 73167; --Huolon
	AL["Ik-Ik el Ágil"] = 50836; --Ik-Ik the Nimble
	AL["Pitón imperial"] = 73163; --Imperial Python
	AL["Astado acerado Cueracero"] = 73160; --Ironfur Steelhorn
	AL["Colmillo de Jade"] = 49822; --Jadefang
	AL["Jakur de Ordon"] = 73169; --Jakur of Ordon
	AL["Jonn-Dar"] = 50351; --Jonn-Dar
	AL["Kah'tir"] = 50355; --Kah'tir
	AL["Kal'tik la Plaga"] = 50749; --Kal'tik the Blight
	AL["Kang, el Ladrón de Almas"] = 50349; --Kang the Soul Thief
	AL["Kar Libraguerras"] = 68321; --Kar Warmaker
	AL["Karkanos"] = 72193; --Karkanos
	AL["Karkin"] = 50959; --Karkin
	AL["Karoma"] = 50138; --Karoma
	AL["Karr el Oscurecedor"] = 50347; --Karr the Darkener
	AL["Kirix"] = 54323; --Kirix
	AL["Kor'nas Salvaje Nocturno"] = 50338; --Kor'nas Nightsavage
	AL["Korda Torros"] = 50332; --Korda Torros
	AL["Krakkanon"] = 70323; --Krakkanon
	AL["Krax'ik"] = 50363; --Krax'ik
	AL["Kri'chon"] = 63978; --Kri'chon
	AL["Krol la Espada"] = 50356; --Krol the Blade
	AL["Ku'lai el Garracielo"] = 69996; --Ku'lai the Skyclaw
	AL["Sanador de hojas"] = 73277; --Leafmender
	AL["Lith'ik el Acechador"] = 50734; --Lith'ik the Stalker
	AL["Lon el Toro"] = 50333; --Lon the Bull
	AL["Lu Ban"] = 70002; --Lu-Ban
	AL["Magria"] = 54319; --Magria
	AL["Mayor Nanners"] = 50840; --Major Nanners
	AL["Mavis Lesiones"] = 68317; --Mavis Harms
	AL["Señor Feroz"] = 50823; --Mister Ferocious
	AL["Moldo el Tuerto"] = 50806; --Moldo One-Eye
	AL["Molthor"] = 70003; --Molthor
	AL["Monara"] = 70440; --Monara
	AL["Pinzaespina monstruoso"] = 73166; --Monstrous Spineclaw
	AL["Morgrinn Colmillo Rajado"] = 50350; --Morgrinn Crackfang
	AL["Muerta"] = 68322; --Muerta
	AL["Mumta"] = 69664; --Mumta
	AL["Nal'lak el Destripador"] = 50364; --Nal'lak the Ripper
	AL["Nalash Verdantis"] = 50776; --Nalash Verdantis
	AL["Nasra Piel Pecosa"] = 50811; --Nasra Spothide
	AL["Nessos el Oráculo"] = 50789; --Nessos the Oracle
	AL["Orador de la tormenta No'ku"] = 70276; --No'ku Stormsayer
	AL["Norlaxx"] = 50344; --Norlaxx
	AL["Omnis Grinlok"] = 50805; --Omnis Grinlok
	AL["Señor supremo Furiahendida"] = 50085; --Overlord Sunderfury
	AL["Príncipe Lakma"] = 54533; --Prince Lakma
	AL["Progenitus"] = 69997; --Progenitus
	AL["Qu'nas"] = 50352; --Qu'nas
	AL["Cadozo"] = 58771; --Quid
	AL["Ra'sha"] = 70530; --Ra'sha
	AL["Ossotremulus"] = 72048; --Rattleskew
	AL["Musgo de roca"] = 73157; --Rock Moss
	AL["Horror rocoso"] = 70430; --Rocky Horror
	AL["Ruun Zarpa Espectral"] = 50816; --Ruun Ghostpaw
	AL["Sahn Cazador de Olas"] = 50780; --Sahn Tidehunter
	AL["Explorador de guerra Salyin"] = 50783; --Salyin Warscout
	AL["Sambas"] = 50159; --Sambas
	AL["Sarnak"] = 50782; --Sarnak
	AL["Chillidos"] = 50831; --Scritch
	AL["Sele'na"] = 50766; --Sele'na
	AL["Maestro de las Sombras Sydow"] = 63240; --Shadowmaster Sydow
	AL["Siltriss el Afilador"] = 50791; --Siltriss the Sharpener
	AL["Skarr"] = 50815; --Skarr
	AL["Ski'thik"] = 50733; --Ski'thik
	AL["Correllama"] = 54324; --Skitterflame
	AL["Solix"] = 54321; --Solix
	AL["Espectrante"] = 71864; --Spelurk
	AL["Espíritu de fuego de jade"] = 72769; --Spirit of Jadefire
	AL["Espíritu de Lao-Fe"] = 58817; --Spirit of Lao-Fe
	AL["Matojo"] = 50830; --Spriggin
	AL["Barbasucia"] = 73704; --Stinkbraid
	AL["Sulik'shor"] = 50339; --Sulik'shor
	AL["Tarvus el Vil"] = 50086; --Tarvus the Vile
	AL["El Aullador"] = 50832; --The Yowler
	AL["Torik-Ethis"] = 50388; --Torik-Ethis
	AL["Tsavo'ka"] = 72808; --Tsavo'ka
	AL["Ubunti la Sombra"] = 68320; --Ubunti the Shade
	AL["Ojo imperturbable"] = 70238; --Unblinking Eye
	AL["Urdur el Cauterizador"] = 73173; --Urdur the Cauterizer
	AL["Urgolax"] = 50359; --Urgolax
	AL["Urobi el Caminante"] = 50808; --Urobi the Walker
	AL["Quijasaña"] = 58769; --Vicejaw
	AL["Vyraxxis"] = 63977; --Vyraxxis
	AL["Dios de la guerra Dokah"] = 70096; --War-God Dokah
	AL["Vigía Osu"] = 73170; --Watcher Osu
	AL["Whizzig"] = 73293; --Whizzig
	AL["Willy Wilder"] = 70126; --Willy Wilder
	AL["Wulon"] = 63510; --Wulon
	AL["Yorik Vistafilada"] = 50336; --Yorik Sharpeye
	AL["Yul Zarpa Salvaje"] = 50820; --Yul Wildpaw
	AL["Zai el Exiliado"] = 50769; --Zai the Outcast
	AL["Belisario Zandalari"] = 69769; --Zandalari Warbringer cian
	AL["Belisario Zandalari"] = 69842; --Zandalari Warbringer gray
	AL["Belisario Zandalari"] = 69841; --Zandalari Warbringer silver
	AL["Explorador de guerra Zandalari"] = 69768; --Zandalari Warscout
	AL["Zao'cho"] = 69843; --Zao'cho
	AL["Zesqua"] = 72245; --Zesqua
	AL["Zhu Gon el Agrio"] = 71919; --Zhu-Gon the Sour

	-- Rares Draenor
	AL["Amaukwa"] = 77140; --Amaukwa
	AL["Antiguo maestro del acero"] = 82899; --Ancient Blademaster
	AL["Aqualir"] = 86213; --Aqualir
	AL["Avatar de Socrethar"] = 88043; --Avatar of Socrethar
	AL["Ba'ruun"] = 82326; --Ba'ruun
	AL["Bahamojo"] = 81406; --Bahameye
	AL["Bashiok"] = 82085; --Bashiok
	AL["Trinchabestias Saramor"] = 78150; --Beastcarver Saramor
	AL["Betsi Canastabum"] = 84887; --Betsi Boombasket
	AL["Danzante de Espadas Aeryx"] = 80614; --Blade-Dancer Aeryx
	AL["Peste resplandeciente"] = 84856; --Blightglow
	AL["Reyespina Fili"] = 81639; --Brambleking Fili
	AL["Jadeante"] = 78867; --Breathless
	AL["Brutag Filosiniestro"] = 87234; --Brutag Grimblade
	AL["Madre de Hielo del Cañón"] = 71721; --Canyon Icemother
	AL["Char el Ardiente"] = 82311; --Char the Burning
	AL["Escalocolmillo"] = 80242; --Chillfang
	AL["Fauceniza"] = 72294; --Cindermaw
	AL["Domanubes Daber"] = 78169; --Cloudspeaker Daber
	AL["Patadafría el Doliente"] = 77513; --Coldstomp the Griever
	AL["Colmillo frío"] = 76914; --Coldtusk
	AL["Cro Desgarracarne"] = 77620; --Cro Fleshrender
	AL["Furia ciclónica"] = 78621; --Cyclonic Fury
	AL["Emanación oscura"] = 77085; --Dark Emanation
	AL["Maestro oscuro Go'vid"] = 82268; --Darkmaster Go'vid
	AL["Garfaoscura"] = 82411; --Darktalon
	AL["Kizi Tiromortal"] = 77763; --Deadshot Kizi
	AL["Raíz Profunda"] = 82058; --Depthroot
	AL["Pezuña temible"] = 86729; --Direhoof
	AL["Dr. Penumbra"] = 77561; --Dr. Gloom
	AL["Durkath Fauceacreo"] = 84807; --Durkath Steelmaw
	AL["Elementalista Utrah"] = 77768; --Elementalist Utrah
	AL["Enavra"] = 82676; --Enavra
	AL["Enavra"] = 82742; --Enavra
	AL["Hada brillante"] = 82207; --Faebright
	AL["Colmillador"] = 82975; --Fangler
	AL["Cortezavil"] = 80204; --Felbark
	AL["Cónyuge Fuego vil"] = 82992; --Felfire Consort
	AL["Chancroflor"] = 84890; --Festerbloom
	AL["Gigante Furia de Fuego"] = 74971; --Firefury Giant
	AL["Encendedor Grash"] = 88580; --Firestarter Grash
	AL["Pellejo de pedernal"] = 83483; --Flinthide
	AL["Matrona de forja Targa"] = 77648; --Forge Matron Targa
	AL["Maderafósil el Petrificado"] = 85250; --Fossilwood the Petrified
	AL["Gólem enloquecido"] = 77614; --Frenzied Golem
	AL["Galzomar"] = 78713; --Galzomar
	AL["Gar'lua"] = 82764; --Gar'lua
	AL["Garrison Ford"] = 86058; --Garrison Ford
	AL["Gelgor de la Llama Azul"] = 81038; --Gelgor of the Blue Flame
	AL["General Aevd"] = 82882; --General Aevd
	AL["Gennadian"] = 80471; --Gennadian
	AL["Kul Destripador de Gigantes"] = 71665; --Giant-Slayer Kul
	AL["Destripadora de gigantes Kimla"] = 78144; --Giantslayer Kimla
	AL["Alabrillo"] = 77719; --Glimmerwing
	AL["Exceso"] = 80868; --Glut
	AL["Pezuñatorcida el Rabioso"] = 82778; --Gnarlhoof the Rabid
	AL["Gorum"] = 76380; --Gorum
	AL["Gran mariscal Hojatemblorosa"] = 82876; --Grand Marshal Tremblade
	AL["Gran pluma"] = 82758; --Greatfeather
	AL["Greldrok el Maquiavélico"] = 84431; --Greldrok the Cunning
	AL["Fauceparda"] = 82912; --Grizzlemaw
	AL["Acechagronns Dawarn"] = 78128; --Gronnstalker Dawarn
	AL["Celador de arboleda Yal"] = 88583; --Grove Warden Yal
	AL["Grutush el Saqueador"] = 80312; --Grutush the Pillager
	AL["Gruuk"] = 80190; --Gruuk
	AL["Gurun"] = 80235; --Gurun
	AL["Haakun, el Todo Consumidor"] = 83008; --Haakun the All-Consuming
	AL["Dentomartillo"] = 77715; --Hammertooth
	AL["Mamá gallina Hami"] = 77626; --Hen-Mother Hami
	AL["Pielpálido hermitaño"] = 86724; --Hermit Palefur
	AL["Gran Señor de la Guerra Volrath"] = 82877; --High Warlord Volrath
	AL["Cazadora Bal'ra"] = 88672; --Hunter Bal'ra
	AL["Cazador Diente Negro"] = 83603; --Hunter Blacktooth
	AL["Maestro de caza Kuang"] = 78151; --Huntmaster Kuang
	AL["Hiperious"] = 78161; --Hyperious
	AL["Insha'tar"] = 83553; --Insha'tar
	AL["Mandibulín"] = 82616; --Jabberjaw
	AL["Jaluk el Pacifista"] = 87600; --Jaluk the Pacifist
	AL["Jiasska el Zampasporas"] = 84955; --Jiasska the Sporegorger
	AL["Kalos el Bañado en Sangre"] = 84810; --Kalos the Bloodbathed
	AL["Karosh Vientonegro"] = 86959; --Karosh Blackwind
	AL["Kharazos el Triunfante"] = 78710; --Kharazos the Triumphant
	AL["Mortafauce"] = 74206; --Killmaw
	AL["Klikixx"] = 78872; --Klikixx
	AL["Ku'targ el Vidente del Vacío"] = 72362; --Ku'targ the Voidseer
	AL["Lady Tentaciona"] = 85121; --Lady Temptessa
	AL["Decifrahojas Kurri"] = 72537; --Leaf-Reader Kurri
	AL["Machacafauces Lo'marg"] = 77784; --Lo'marg Jawcrusher
	AL["Señor Korinak"] = 82920; --Lord Korinak
	AL["\"Rey\" Loco Esporeon"] = 77310; --Mad "King" Sporeon
	AL["Malroc Hiendepiedras"] = 83643; --Malroc Stonesunder
	AL["Mandrakor"] = 84406; --Mandrakor
	AL["Mariscal Gabriel"] = 82878; --Marshal Gabriel
	AL["Mariscal Karsh Forjatormentas"] = 82880; --Marshal Karsh Stormforge
	AL["Matrona del Pecado"] = 82998; --Matron of Sin
	AL["Torturaalmas Morva"] = 82362; --Morva Soultwister
	AL["Madre Araneae"] = 76473; --Mother Araneae
	AL["Madre Om'ra"] = 75071; --Mother Om'ra
	AL["Mutafen"] = 84417; --Mutafen
	AL["Nas Dunberlin"] = 82247; --Nas Dunberlin
	AL["No'losh"] = 79334; --No'losh
	AL["Ophiis"] = 83409; --Ophiis
	AL["Oskiira el Vengativo"] = 84872; --Oskiira the Vengeful
	AL["Escolta Duretha"] = 83680; --Outrider Duretha
	AL["Pescadero pálido"] = 78606; --Pale Fishmonger
	AL["Abrecaminos Jalog"] = 78134; --Pathfinder Jalog
	AL["Acechacaminos Draga"] = 77095; --Pathstalker Draga
	AL["Foso de bestias"] = 88208; --Pit Beast
	AL["Maestro de veneno Bordiente"] = 84838; --Poisonmaster Bortusk
	AL["Primalista Mur'og"] = 76918; --Primalist Mur'og
	AL["Pirotaumaturga Zindra"] = 77642; --Pyrecaster Zindra
	AL["Ra'kahn"] = 77741; --Ra'kahn
	AL["Acechaderivas Ragore"] = 84392; --Ragore Driftstalker
	AL["Rai'vosh"] = 82374; --Rai'vosh
	AL["Garra Roja el Feral"] = 82755; --Redclaw the Feral
	AL["Pudrecasco"] = 85504; --Rotcap
	AL["Sangrikass"] = 84833; --Sangrikass
	AL["Explorador Buscacrúor"] = 77526; --Scout Goreseeker
	AL["Sean Marblanco"] = 83542; --Sean Whitesea
	AL["Corteza sombría"] = 79938; --Shadowbark
	AL["Shinri"] = 82415; --Shinri
	AL["Sikthiss, Doncella de Masacre"] = 78715; --Sikthiss, Maiden of Slaughter
	AL["Anciano Hojaplata"] = 79686; --Silverleaf Ancient
	AL["Anciano Hojaplata"] = 79693; --Silverleaf Ancient
	AL["Anciano Hojaplata"] = 79692; --Silverleaf Ancient
	AL["Lupa solar"] = 83990; --Solar Magnifier
	AL["Dentealma"] = 80057; --Soulfang
	AL["Colmiacero"] = 86549; --Steeltusk
	AL["Vapuleador Kreego"] = 79629; --Stomper Kreego
	AL["Piedrinquina"] = 84805; --Stonespite
	AL["Sulfúrico"] = 80725; --Sulfurious
	AL["Garrasol"] = 86137; --Sunclaw
	AL["Púacercenador"] = 84912; --Sunderthorn
	AL["Hojenjambre"] = 85520; --Swarmleaf
	AL["Despellejador Onyx presto"] = 88582; --Swift Onyx Flayer
	AL["Rompegarra"] = 84836; --Talonbreaker
	AL["Sacerdote de la garra Zorkra"] = 79485; --Talonpriest Zorkra
	AL["Tesska la Quebrada"] = 84775; --Tesska the Broken
	AL["El Azotador"] = 77527; --The Beater
	AL["Tor'goroth"] = 82618; --Tor'goroth
	AL["Tura'aka"] = 83591; --Tura'aka
	AL["Varasha"] = 82050; --Varasha
	AL["Veloss"] = 75482; --Veloss
	AL["Atracadora del vacío Urnae"] = 85078; --Voidreaver Urnae
	AL["Vidente del Vacío Kalurg"] = 83385; --Voidseer Kalurg
	AL["Vulceros"] = 77926; --Vulceros
	AL["Vindicador deambulante"] = 77776; --Wandering Vindicator
	AL["Taumaturgo de guerra Bargol"] = 78733; --Warcaster Bargol
	AL["Maestro de la guerra Blugthol"] = 79024; --Warmaster Blugthol
	AL["Matriarca denteviento"] = 75434; --Windfang Matriarch
	AL["Xothear el Destructor"] = 82922; --Xothear, the Destroyer
	AL["Yaga la Marcada"] = 79145; --Yaga the Scarred
	AL["Yazheera la Incineradora"] = 77529; --Yazheera the Incinerator
	AL["Yggdrel"] = 75435; --Yggdrel
end