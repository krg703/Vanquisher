Global $g_MapVanquished = False
Global $aPropheciesMaps[0][7]
Global $aFactionsMaps[0][7]
Global $aNightfallMaps[0][7]
Global $aEyeOfTheNorthMaps[0][7]
Global $RepeatNumberOfWaypoints = 2


#Region MapData
	#Region Tyria
		#Region GC_I_MAP_REGION_Ascalon
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Ascalon", $GC_I_MAP_REGION_Ascalon, $g_as_MapLabels[$GC_I_MAP_ID_ASCALON_FOOTHILLS], $GC_I_MAP_ID_ASCALON_FOOTHILLS, $GC_I_MAP_ID_YAKS_BEND)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Ascalon", $GC_I_MAP_REGION_Ascalon, $g_as_MapLabels[$GC_I_MAP_ID_DIESSA_LOWLANDS], $GC_I_MAP_ID_DIESSA_LOWLANDS, $GC_I_MAP_ID_GRENDICH_COURTHOUSE)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Ascalon", $GC_I_MAP_REGION_Ascalon, $g_as_MapLabels[$GC_I_MAP_ID_DRAGONS_GULLET], $GC_I_MAP_ID_DRAGONS_GULLET, $GC_I_MAP_ID_GRENDICH_COURTHOUSE)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Ascalon", $GC_I_MAP_REGION_Ascalon, $g_as_MapLabels[$GC_I_MAP_ID_EASTERN_FRONTIER], $GC_I_MAP_ID_EASTERN_FRONTIER, $GC_I_MAP_ID_RUINS_OF_SURMIA_OUTPOST)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Ascalon", $GC_I_MAP_REGION_Ascalon, $g_as_MapLabels[$GC_I_MAP_ID_FLAME_TEMPLE_CORRIDOR], $GC_I_MAP_ID_FLAME_TEMPLE_CORRIDOR, $GC_I_MAP_ID_GRENDICH_COURTHOUSE)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Ascalon", $GC_I_MAP_REGION_Ascalon, $g_as_MapLabels[$GC_I_MAP_ID_OLD_ASCALON], $GC_I_MAP_ID_OLD_ASCALON, $GC_I_MAP_ID_ASCALON_CITY)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Ascalon", $GC_I_MAP_REGION_Ascalon, $g_as_MapLabels[$GC_I_MAP_ID_POCKMARK_FLATS], $GC_I_MAP_ID_POCKMARK_FLATS, $GC_I_MAP_ID_SERENITY_TEMPLE)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Ascalon", $GC_I_MAP_REGION_Ascalon, $g_as_MapLabels[$GC_I_MAP_ID_REGENT_VALLEY], $GC_I_MAP_ID_REGENT_VALLEY, $GC_I_MAP_ID_FORT_RANIK_OUTPOST)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Ascalon", $GC_I_MAP_REGION_Ascalon, $g_as_MapLabels[$GC_I_MAP_ID_THE_BREACH], $GC_I_MAP_ID_THE_BREACH, $GC_I_MAP_ID_PIKEN_SQUARE)
		#EndRegion GC_I_MAP_REGION_Ascalon

		#Region GC_I_MAP_REGION_NorthernShiverpeaks
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Northern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_ANVIL_ROCK], $GC_I_MAP_ID_ANVIL_ROCK, $GC_I_MAP_ID_ICE_TOOTH_CAVE)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Northern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_DELDRIMOR_BOWL], $GC_I_MAP_ID_DELDRIMOR_BOWL, $GC_I_MAP_ID_BEACONS_PERCH)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Northern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_GRIFFONS_MOUTH], $GC_I_MAP_ID_GRIFFONS_MOUTH, $GC_I_MAP_ID_BEACONS_PERCH)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Northern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_IRON_HORSE_MINE], $GC_I_MAP_ID_IRON_HORSE_MINE, $GC_I_MAP_ID_YAKS_BEND)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Northern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_TRAVELERS_VALE], $GC_I_MAP_ID_TRAVELERS_VALE, $GC_I_MAP_ID_YAKS_BEND)
		#EndRegion GC_I_MAP_REGION_NorthernShiverpeaks

		#Region GC_I_MAP_REGION_Maguuma
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Maguuma Jungle", $GC_I_MAP_REGION_Maguuma, $g_as_MapLabels[$GC_I_MAP_ID_DRY_TOP], $GC_I_MAP_ID_DRY_TOP, $GC_I_MAP_ID_MAGUUMA_STADE);
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Maguuma Jungle", $GC_I_MAP_REGION_Maguuma, $g_as_MapLabels[$GC_I_MAP_ID_ETTINS_BACK], $GC_I_MAP_ID_ETTINS_BACK, $GC_I_MAP_ID_VENTARIS_REFUGE)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Maguuma Jungle", $GC_I_MAP_REGION_Maguuma, $g_as_MapLabels[$GC_I_MAP_ID_MAMNOON_LAGOON], $GC_I_MAP_ID_MAMNOON_LAGOON, $GC_I_MAP_ID_DRUIDS_OVERLOOK);
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Maguuma Jungle", $GC_I_MAP_REGION_Maguuma, $g_as_MapLabels[$GC_I_MAP_ID_REED_BOG], $GC_I_MAP_ID_REED_BOG, $GC_I_MAP_ID_VENTARIS_REFUGE)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Maguuma Jungle", $GC_I_MAP_REGION_Maguuma, $g_as_MapLabels[$GC_I_MAP_ID_SAGE_LANDS], $GC_I_MAP_ID_SAGE_LANDS, $GC_I_MAP_ID_DRUIDS_OVERLOOK)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Maguuma Jungle", $GC_I_MAP_REGION_Maguuma, $g_as_MapLabels[$GC_I_MAP_ID_SILVERWOOD], $GC_I_MAP_ID_SILVERWOOD, $GC_I_MAP_ID_QUARREL_FALLS)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Maguuma Jungle", $GC_I_MAP_REGION_Maguuma, $g_as_MapLabels[$GC_I_MAP_ID_TANGLE_ROOT], $GC_I_MAP_ID_TANGLE_ROOT, $GC_I_MAP_ID_HENGE_OF_DENRAVI)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Maguuma Jungle", $GC_I_MAP_REGION_Maguuma, $g_as_MapLabels[$GC_I_MAP_ID_THE_FALLS], $GC_I_MAP_ID_THE_FALLS, $GC_I_MAP_ID_VENTARIS_REFUGE)
		#EndRegion GC_I_MAP_REGION_Maguuma

		#Region GC_I_MAP_REGION_CrystalDesert
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Crystal Desert", $GC_I_MAP_REGION_CrystalDesert, $g_as_MapLabels[$GC_I_MAP_ID_DIVINERS_ASCENT], $GC_I_MAP_ID_DIVINERS_ASCENT, $GC_I_MAP_ID_ELONA_REACH_OUTPOST)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Crystal Desert", $GC_I_MAP_REGION_CrystalDesert, $g_as_MapLabels[$GC_I_MAP_ID_PROPHETS_PATH], $GC_I_MAP_ID_PROPHETS_PATH, $GC_I_MAP_ID_HEROES_AUDIENCE)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Crystal Desert", $GC_I_MAP_REGION_CrystalDesert, $g_as_MapLabels[$GC_I_MAP_ID_SALT_FLATS], $GC_I_MAP_ID_SALT_FLATS, $GC_I_MAP_ID_SEEKERS_PASSAGE)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Crystal Desert", $GC_I_MAP_REGION_CrystalDesert, $g_as_MapLabels[$GC_I_MAP_ID_SKYWARD_REACH], $GC_I_MAP_ID_SKYWARD_REACH, $GC_I_MAP_ID_AUGURY_ROCK_OUTPOST)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Crystal Desert", $GC_I_MAP_REGION_CrystalDesert, $g_as_MapLabels[$GC_I_MAP_ID_THE_ARID_SEA], $GC_I_MAP_ID_THE_ARID_SEA, $GC_I_MAP_ID_DUNES_OF_DESPAIR_OUTPOST)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Crystal Desert", $GC_I_MAP_REGION_CrystalDesert, $g_as_MapLabels[$GC_I_MAP_ID_THE_SCAR], $GC_I_MAP_ID_THE_SCAR, $GC_I_MAP_ID_THIRSTY_RIVER_OUTPOST)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Crystal Desert", $GC_I_MAP_REGION_CrystalDesert, $g_as_MapLabels[$GC_I_MAP_ID_VULTURE_DRIFTS], $GC_I_MAP_ID_VULTURE_DRIFTS, $GC_I_MAP_ID_DUNES_OF_DESPAIR_OUTPOST)
		#EndRegion GC_I_MAP_REGION_CrystalDesert

		#Region GC_I_MAP_REGION_Kryta
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Kryta", $GC_I_MAP_REGION_Kryta, $g_as_MapLabels[$GC_I_MAP_ID_CURSED_LANDS], $GC_I_MAP_ID_CURSED_LANDS, $GC_I_MAP_ID_BERGEN_HOT_SPRINGS);
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Kryta", $GC_I_MAP_REGION_Kryta, $g_as_MapLabels[$GC_I_MAP_ID_KESSEX_PEAK], $GC_I_MAP_ID_KESSEX_PEAK, $GC_I_MAP_ID_TEMPLE_OF_THE_AGES)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Kryta", $GC_I_MAP_REGION_Kryta, $g_as_MapLabels[$GC_I_MAP_ID_MAJESTYS_REST], $GC_I_MAP_ID_MAJESTYS_REST, $GC_I_MAP_ID_DRUIDS_OVERLOOK);
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Kryta", $GC_I_MAP_REGION_Kryta, $g_as_MapLabels[$GC_I_MAP_ID_NEBO_TERRACE], $GC_I_MAP_ID_NEBO_TERRACE, $GC_I_MAP_ID_BEETLETUN)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Kryta", $GC_I_MAP_REGION_Kryta, $g_as_MapLabels[$GC_I_MAP_ID_NORTH_KRYTA_PROVINCE], $GC_I_MAP_ID_NORTH_KRYTA_PROVINCE, $GC_I_MAP_ID_LIONS_ARCH)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Kryta", $GC_I_MAP_REGION_Kryta, $g_as_MapLabels[$GC_I_MAP_ID_SCOUNDRELS_RISE], $GC_I_MAP_ID_SCOUNDRELS_RISE, $GC_I_MAP_ID_GATES_OF_KRYTA_OUTPOST)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Kryta", $GC_I_MAP_REGION_Kryta, $g_as_MapLabels[$GC_I_MAP_ID_STINGRAY_STRAND], $GC_I_MAP_ID_STINGRAY_STRAND, $GC_I_MAP_ID_SANCTUM_CAY_OUTPOST)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Kryta", $GC_I_MAP_REGION_Kryta, $g_as_MapLabels[$GC_I_MAP_ID_TALMARK_WILDERNESS], $GC_I_MAP_ID_TALMARK_WILDERNESS, $GC_I_MAP_ID_TEMPLE_OF_THE_AGES)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Kryta", $GC_I_MAP_REGION_Kryta, $g_as_MapLabels[$GC_I_MAP_ID_TEARS_OF_THE_FALLEN], $GC_I_MAP_ID_TEARS_OF_THE_FALLEN, $GC_I_MAP_ID_FISHERMENS_HAVEN)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Kryta", $GC_I_MAP_REGION_Kryta, $g_as_MapLabels[$GC_I_MAP_ID_THE_BLACK_CURTAIN], $GC_I_MAP_ID_THE_BLACK_CURTAIN, $GC_I_MAP_ID_TEMPLE_OF_THE_AGES)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Kryta", $GC_I_MAP_REGION_Kryta, $g_as_MapLabels[$GC_I_MAP_ID_TWIN_SERPENT_LAKES], $GC_I_MAP_ID_TWIN_SERPENT_LAKES, $GC_I_MAP_ID_RIVERSIDE_PROVINCE_OUTPOST)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Kryta", $GC_I_MAP_REGION_Kryta, $g_as_MapLabels[$GC_I_MAP_ID_WATCHTOWER_COAST], $GC_I_MAP_ID_WATCHTOWER_COAST, $GC_I_MAP_ID_BEETLETUN)
		#EndRegion GC_I_MAP_REGION_Kryta

		#Region GC_I_MAP_REGION_NorthernShiverpeaks;Southern Shiverpeaks
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Southern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_DREADNOUGHTS_DRIFT], $GC_I_MAP_ID_DREADNOUGHTS_DRIFT, $GC_I_MAP_ID_DELDRIMOR_WAR_CAMP)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Southern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_FROZEN_FOREST], $GC_I_MAP_ID_FROZEN_FOREST, $GC_I_MAP_ID_IRON_MINES_OF_MOLADUNE_OUTPOST)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Southern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_GRENTHS_FOOTPRINT], $GC_I_MAP_ID_GRENTHS_FOOTPRINT, $GC_I_MAP_ID_DELDRIMOR_WAR_CAMP)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Southern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_ICE_FLOE], $GC_I_MAP_ID_ICE_FLOE, $GC_I_MAP_ID_THUNDERHEAD_KEEP_OUTPOST)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Southern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_ICEDOME], $GC_I_MAP_ID_ICEDOME, $GC_I_MAP_ID_ICE_CAVES_OF_SORROW_OUTPOST)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Southern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_LORNARS_PASS], $GC_I_MAP_ID_LORNARS_PASS, $GC_I_MAP_ID_BEACONS_PERCH)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Southern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_MINERAL_SPRINGS], $GC_I_MAP_ID_MINERAL_SPRINGS, $GC_I_MAP_ID_THE_GRANITE_CITADEL)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Southern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_SNAKE_DANCE], $GC_I_MAP_ID_SNAKE_DANCE, $GC_I_MAP_ID_CAMP_RANKOR)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Southern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_SPEARHEAD_PEAK], $GC_I_MAP_ID_SPEARHEAD_PEAK, $GC_I_MAP_ID_COPPERHAMMER_MINES)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Southern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_TALUS_CHUTE], $GC_I_MAP_ID_TALUS_CHUTE, $GC_I_MAP_ID_ICE_CAVES_OF_SORROW_OUTPOST)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Southern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_TASCAS_DEMISE], $GC_I_MAP_ID_TASCAS_DEMISE, $GC_I_MAP_ID_THE_GRANITE_CITADEL)
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Southern Shiverpeaks", $GC_I_MAP_REGION_NorthernShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_WITMANS_FOLLY], $GC_I_MAP_ID_WITMANS_FOLLY, $GC_I_MAP_ID_DROKNARS_FORGE)
		#EndRegion GC_I_MAP_REGION_NorthernShiverpeaks

		#Region GC_I_MAP_REGION_FissureOfWoe;Ring of Fire
			AddMap($aPropheciesMaps, $GC_I_MAP_CAMPAIGN_PROPHECIES, "Ring of Fire Islands", $GC_I_MAP_REGION_FissureOfWoe, $g_as_MapLabels[$GC_I_MAP_ID_PERDITION_ROCK], $GC_I_MAP_ID_PERDITION_ROCK, $GC_I_MAP_ID_EMBER_LIGHT_CAMP)
		#EndRegion GC_I_MAP_REGION_FissureOfWoe
	#EndRegion Tyria

	#Region Cantha
		#Region GC_I_MAP_REGION_ShingJeaIsland;Shing Jea Island
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Shing Jea Island", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_HAIJU_LAGOON], $GC_I_MAP_ID_HAIJU_LAGOON, $GC_I_MAP_ID_ZEN_DAIJUN_OUTPOST)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Shing Jea Island", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_JAYA_BLUFF], $GC_I_MAP_ID_JAYA_BLUFF, $GC_I_MAP_ID_SEITUNG_HARBOR)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Shing Jea Island", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_KINYA_PROVINCE], $GC_I_MAP_ID_KINYA_PROVINCE, $GC_I_MAP_ID_RAN_MUSU_GARDENS)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Shing Jea Island", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_MINISTER_CHOS_ESTATE_EXPLORABLE], $GC_I_MAP_ID_MINISTER_CHOS_ESTATE_EXPLORABLE, $GC_I_MAP_ID_RAN_MUSU_GARDENS)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Shing Jea Island", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_PANJIANG_PENINSULA], $GC_I_MAP_ID_PANJIANG_PENINSULA, $GC_I_MAP_ID_TSUMEI_VILLAGE)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Shing Jea Island", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_SAOSHANG_TRAIL], $GC_I_MAP_ID_SAOSHANG_TRAIL, $GC_I_MAP_ID_SEITUNG_HARBOR)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Shing Jea Island", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_SUNQUA_VALE], $GC_I_MAP_ID_SUNQUA_VALE, $GC_I_MAP_ID_SHING_JEA_MONASTERY)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Shing Jea Island", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_ZEN_DAIJUN_EXPLORABLE], $GC_I_MAP_ID_ZEN_DAIJUN_EXPLORABLE, $GC_I_MAP_ID_SEITUNG_HARBOR)
		#EndRegion GC_I_MAP_REGION_ShingJeaIsland

		#Region GC_I_MAP_REGION_KainengCity;Kaineng City
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Kaineng City", $GC_I_MAP_REGION_Kaineng, $g_as_MapLabels[$GC_I_MAP_ID_BUKDEK_BYWAY], $GC_I_MAP_ID_BUKDEK_BYWAY, $GC_I_MAP_ID_THE_MARKETPLACE)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Kaineng City", $GC_I_MAP_REGION_Kaineng, $g_as_MapLabels[$GC_I_MAP_ID_NAHPUI_QUARTER_EXPLORABLE], $GC_I_MAP_ID_NAHPUI_QUARTER_EXPLORABLE, $GC_I_MAP_ID_SENJIS_CORNER)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Kaineng City", $GC_I_MAP_REGION_Kaineng, $g_as_MapLabels[$GC_I_MAP_ID_PONGMEI_VALLEY], $GC_I_MAP_ID_PONGMEI_VALLEY, $GC_I_MAP_ID_MAATU_KEEP)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Kaineng City", $GC_I_MAP_REGION_Kaineng, $g_as_MapLabels[$GC_I_MAP_ID_RAISU_PALACE_EXPLORABLE], $GC_I_MAP_ID_RAISU_PALACE_EXPLORABLE, $GC_I_MAP_ID_IMPERIAL_SANCTUM_OUTPOST)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Kaineng City", $GC_I_MAP_REGION_Kaineng, $g_as_MapLabels[$GC_I_MAP_ID_SHADOWS_PASSAGE], $GC_I_MAP_ID_SHADOWS_PASSAGE, $GC_I_MAP_ID_DRAGONS_THROAT_OUTPOST)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Kaineng City", $GC_I_MAP_REGION_Kaineng, $g_as_MapLabels[$GC_I_MAP_ID_SHENZUN_TUNNELS], $GC_I_MAP_ID_SHENZUN_TUNNELS, $GC_I_MAP_ID_MAATU_KEEP)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Kaineng City", $GC_I_MAP_REGION_Kaineng, $g_as_MapLabels[$GC_I_MAP_ID_SUNJIANG_DISTRICT_EXPLORABLE], $GC_I_MAP_ID_SUNJIANG_DISTRICT_EXPLORABLE, $GC_I_MAP_ID_ZIN_KU_CORRIDOR)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Kaineng City", $GC_I_MAP_REGION_Kaineng, $g_as_MapLabels[$GC_I_MAP_ID_TAHNNAKAI_TEMPLE_EXPLORABLE], $GC_I_MAP_ID_TAHNNAKAI_TEMPLE_EXPLORABLE, $GC_I_MAP_ID_ZIN_KU_CORRIDOR)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Kaineng City", $GC_I_MAP_REGION_Kaineng, $g_as_MapLabels[$GC_I_MAP_ID_WAIJUN_BAZAAR], $GC_I_MAP_ID_WAIJUN_BAZAAR, $GC_I_MAP_ID_THE_MARKETPLACE)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Kaineng City", $GC_I_MAP_REGION_Kaineng, $g_as_MapLabels[$GC_I_MAP_ID_XAQUANG_SKYWAY], $GC_I_MAP_ID_XAQUANG_SKYWAY, $GC_I_MAP_ID_SENJIS_CORNER)
		#EndRegion GC_I_MAP_REGION_KainengCity

		#Region GC_I_MAP_REGION_EchovaldForest;Echovald Forest
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Echovald Forest", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_ARBORSTONE_EXPLORABLE], $GC_I_MAP_ID_ARBORSTONE_EXPLORABLE, $GC_I_MAP_ID_ALTRUMM_RUINS_OUTPOST)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Echovald Forest", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_DRAZACH_THICKET], $GC_I_MAP_ID_DRAZACH_THICKET, $GC_I_MAP_ID_THE_ETERNAL_GROVE_OUTPOST)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Echovald Forest", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_FERNDALE], $GC_I_MAP_ID_FERNDALE, $GC_I_MAP_ID_HOUSE_ZU_HELTZER)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Echovald Forest", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_MELANDRUS_HOPE], $GC_I_MAP_ID_MELANDRUS_HOPE, $GC_I_MAP_ID_JADE_FLATS_KURZICK)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Echovald Forest", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_MOROSTAV_TRAIL], $GC_I_MAP_ID_MOROSTAV_TRAIL, $GC_I_MAP_ID_UNWAKING_WATERS_KURZICK_MISSION_OUTPOST)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Echovald Forest", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_MOURNING_VEIL_FALLS], $GC_I_MAP_ID_MOURNING_VEIL_FALLS, $GC_I_MAP_ID_AMATZ_BASIN_OUTPOST)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "Echovald Forest", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_THE_ETERNAL_GROVE_EXPLORABLE], $GC_I_MAP_ID_THE_ETERNAL_GROVE_EXPLORABLE, $GC_I_MAP_ID_VASBURG_ARMORY)
		#EndRegion GC_I_MAP_REGION_EchovaldForest

		#Region GC_I_MAP_REGION_TheJadeSea;The Jade Sea
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "The Jade Sea", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_ARCHIPELAGOS], $GC_I_MAP_ID_ARCHIPELAGOS, $GC_I_MAP_ID_CAVALON)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "The Jade Sea", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_BOREAS_SEABED_EXPLORABLE], $GC_I_MAP_ID_BOREAS_SEABED_EXPLORABLE, $GC_I_MAP_ID_ZOS_SHIVROS_CHANNEL_OUTPOST)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "The Jade Sea", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_GYALA_HATCHERY_EXPLORABLE], $GC_I_MAP_ID_GYALA_HATCHERY_EXPLORABLE, $GC_I_MAP_ID_LEVIATHAN_PITS)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "The Jade Sea", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_MAISHANG_HILLS], $GC_I_MAP_ID_MAISHANG_HILLS, $GC_I_MAP_ID_GYALA_HATCHERY_OUTPOST)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "The Jade Sea", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_MOUNT_QINKAI], $GC_I_MAP_ID_MOUNT_QINKAI, $GC_I_MAP_ID_ASPENWOOD_GATE_LUXON)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "The Jade Sea", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_RHEAS_CRATER], $GC_I_MAP_ID_RHEAS_CRATER, $GC_I_MAP_ID_THE_AURIOS_MINES_OUTPOST)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "The Jade Sea", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_SILENT_SURF], $GC_I_MAP_ID_SILENT_SURF, $GC_I_MAP_ID_LEVIATHAN_PITS)
			AddMap($aFactionsMaps, $GC_I_MAP_CAMPAIGN_FACTIONS, "The Jade Sea", $GC_I_MAP_REGION_ShingJea, $g_as_MapLabels[$GC_I_MAP_ID_UNWAKING_WATERS_EXPLORABLE], $GC_I_MAP_ID_UNWAKING_WATERS_EXPLORABLE, $GC_I_MAP_ID_HARVEST_TEMPLE)
		#EndRegion GC_I_MAP_REGION_TheJadeSea
	#EndRegion Cantha

	#Region Elonia
		#Region Istan
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Istan", $GC_I_MAP_REGION_Istan, $g_as_MapLabels[$GC_I_MAP_ID_CLIFFS_OF_DOHJOK ], $GC_I_MAP_ID_CLIFFS_OF_DOHJOK, $GC_I_MAP_ID_BLACKTIDE_DEN_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Istan", $GC_I_MAP_REGION_Istan, $g_as_MapLabels[$GC_I_MAP_ID_FAHRANUR_THE_FIRST_CITY], $GC_I_MAP_ID_FAHRANUR_THE_FIRST_CITY, $GC_I_MAP_ID_BLACKTIDE_DEN_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Istan", $GC_I_MAP_REGION_Istan, $g_as_MapLabels[$GC_I_MAP_ID_ISSNUR_ISLES], $GC_I_MAP_ID_ISSNUR_ISLES, $GC_I_MAP_ID_BEKNUR_HARBOR_2)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Istan", $GC_I_MAP_REGION_Istan, $g_as_MapLabels[$GC_I_MAP_ID_LAHTEDA_BOG], $GC_I_MAP_ID_LAHTEDA_BOG, $GC_I_MAP_ID_BLACKTIDE_DEN_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Istan", $GC_I_MAP_REGION_Istan, $g_as_MapLabels[$GC_I_MAP_ID_MEHTANI_KEYS], $GC_I_MAP_ID_MEHTANI_KEYS, $GC_I_MAP_ID_KODLONU_HAMLET)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Istan", $GC_I_MAP_REGION_Istan, $g_as_MapLabels[$GC_I_MAP_ID_PLAINS_OF_JARIN], $GC_I_MAP_ID_PLAINS_OF_JARIN, $GC_I_MAP_ID_KAMADAN_JEWEL_OF_ISTAN)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Istan", $GC_I_MAP_REGION_Istan, $g_as_MapLabels[$GC_I_MAP_ID_ZEHLON_REACH], $GC_I_MAP_ID_ZEHLON_REACH, $GC_I_MAP_ID_JOKANUR_DIGGINGS_OUTPOST)
		#EndRegion Istan
	 
		#Region Kourna
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Kourna", $GC_I_MAP_REGION_Kourna, $g_as_MapLabels[$GC_I_MAP_ID_ARKJOK_WARD], $GC_I_MAP_ID_ARKJOK_WARD, $GC_I_MAP_ID_YOHLON_HAVEN)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Kourna", $GC_I_MAP_REGION_Kourna, $g_as_MapLabels[$GC_I_MAP_ID_BAHDOK_CAVERNS], $GC_I_MAP_ID_BAHDOK_CAVERNS, $GC_I_MAP_ID_MODDOK_CREVICE_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Kourna", $GC_I_MAP_REGION_Kourna, $g_as_MapLabels[$GC_I_MAP_ID_BARBAROUS_SHORE], $GC_I_MAP_ID_BARBAROUS_SHORE, $GC_I_MAP_ID_CAMP_HOJANU)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Kourna", $GC_I_MAP_REGION_Kourna, $g_as_MapLabels[$GC_I_MAP_ID_DEJARIN_ESTATE], $GC_I_MAP_ID_DEJARIN_ESTATE, $GC_I_MAP_ID_POGAHN_PASSAGE_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Kourna", $GC_I_MAP_REGION_Kourna, $g_as_MapLabels[$GC_I_MAP_ID_GANDARA_THE_MOON_FORTRESS], $GC_I_MAP_ID_GANDARA_THE_MOON_FORTRESS, $GC_I_MAP_ID_POGAHN_PASSAGE_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Kourna", $GC_I_MAP_REGION_Kourna, $g_as_MapLabels[$GC_I_MAP_ID_JAHAI_BLUFFS], $GC_I_MAP_ID_JAHAI_BLUFFS, $GC_I_MAP_ID_KODONUR_CROSSROADS_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Kourna", $GC_I_MAP_REGION_Kourna, $g_as_MapLabels[$GC_I_MAP_ID_MARGA_COAST], $GC_I_MAP_ID_MARGA_COAST, $GC_I_MAP_ID_YOHLON_HAVEN)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Kourna", $GC_I_MAP_REGION_Kourna, $g_as_MapLabels[$GC_I_MAP_ID_SUNWARD_MARCHES], $GC_I_MAP_ID_SUNWARD_MARCHES, $GC_I_MAP_ID_VENTA_CEMETERY_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Kourna", $GC_I_MAP_REGION_Kourna, $g_as_MapLabels[$GC_I_MAP_ID_THE_FLOODPLAIN_OF_MAHNKELON], $GC_I_MAP_ID_THE_FLOODPLAIN_OF_MAHNKELON, $GC_I_MAP_ID_KODONUR_CROSSROADS_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Kourna", $GC_I_MAP_REGION_Kourna, $g_as_MapLabels[$GC_I_MAP_ID_TURAIS_PROCESSION], $GC_I_MAP_ID_TURAIS_PROCESSION, $GC_I_MAP_ID_VENTA_CEMETERY_OUTPOST)
		#EndRegion Kourna

		#Region Vabbi
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Vabbi", $GC_I_MAP_REGION_Vaabi, $g_as_MapLabels[$GC_I_MAP_ID_FORUM_HIGHLANDS], $GC_I_MAP_ID_FORUM_HIGHLANDS, $GC_I_MAP_ID_JENNURS_HORDE_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Vabbi", $GC_I_MAP_REGION_Vaabi, $g_as_MapLabels[$GC_I_MAP_ID_GARDEN_OF_SEBORHIN], $GC_I_MAP_ID_GARDEN_OF_SEBORHIN, $GC_I_MAP_ID_TIHARK_ORCHARD_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Vabbi", $GC_I_MAP_REGION_Vaabi, $g_as_MapLabels[$GC_I_MAP_ID_HOLDINGSOFCHOKHIN], $GC_I_MAP_ID_HOLDINGSOFCHOKHIN, $GC_I_MAP_ID_MIHANU_TOWNSHIP)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Vabbi", $GC_I_MAP_REGION_Vaabi, $g_as_MapLabels[$GC_I_MAP_ID_RESPLENDENT_MAKUUN], $GC_I_MAP_ID_RESPLENDENT_MAKUUN, $GC_I_MAP_ID_HONUR_HILL)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Vabbi", $GC_I_MAP_REGION_Vaabi, $g_as_MapLabels[$GC_I_MAP_ID_THE_HIDDEN_CITY_OF_AHDASHIM], $GC_I_MAP_ID_THE_HIDDEN_CITY_OF_AHDASHIM, $GC_I_MAP_ID_DASHA_VESTIBULE_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Vabbi", $GC_I_MAP_REGION_Vaabi, $g_as_MapLabels[$GC_I_MAP_ID_THE_MIRROR_OF_LYSS], $GC_I_MAP_ID_THE_MIRROR_OF_LYSS, $GC_I_MAP_ID_THE_KODASH_BAZAAR)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Vabbi", $GC_I_MAP_REGION_Vaabi, $g_as_MapLabels[$GC_I_MAP_ID_VEHJIN_MINES], $GC_I_MAP_ID_VEHJIN_MINES, $GC_I_MAP_ID_JENNURS_HORDE_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Vabbi", $GC_I_MAP_REGION_Vaabi, $g_as_MapLabels[$GC_I_MAP_ID_VEHTENDI_VALLEY], $GC_I_MAP_ID_VEHTENDI_VALLEY, $GC_I_MAP_ID_THE_KODASH_BAZAAR)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Vabbi", $GC_I_MAP_REGION_Vaabi, $g_as_MapLabels[$GC_I_MAP_ID_WILDERNESS_OF_BAHDZA], $GC_I_MAP_ID_WILDERNESS_OF_BAHDZA, $GC_I_MAP_ID_DZAGONUR_BASTION_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "Vabbi", $GC_I_MAP_REGION_Vaabi, $g_as_MapLabels[$GC_I_MAP_ID_YATENDI_CANYONS], $GC_I_MAP_ID_YATENDI_CANYONS, $GC_I_MAP_ID_WEHHAN_TERRACES)
		#EndRegion Vabbi

		#Region The Desolation
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "The Desolation", $GC_I_MAP_REGION_Desolation, $g_as_MapLabels[$GC_I_MAP_ID_CRYSTAL_OVERLOOK], $GC_I_MAP_ID_CRYSTAL_OVERLOOK, $GC_I_MAP_ID_THE_MOUTH_OF_TORMENT)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "The Desolation", $GC_I_MAP_REGION_Desolation, $g_as_MapLabels[$GC_I_MAP_ID_JOKOS_DOMAIN], $GC_I_MAP_ID_JOKOS_DOMAIN, $GC_I_MAP_ID_REMAINS_OF_SAHLAHJA_OUTPOST)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "The Desolation", $GC_I_MAP_REGION_Desolation, $g_as_MapLabels[$GC_I_MAP_ID_POISONED_OUTCROPS], $GC_I_MAP_ID_POISONED_OUTCROPS, $GC_I_MAP_ID_THE_MOUTH_OF_TORMENT)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "The Desolation", $GC_I_MAP_REGION_Desolation, $g_as_MapLabels[$GC_I_MAP_ID_THE_ALKALI_PAN], $GC_I_MAP_ID_THE_ALKALI_PAN, $GC_I_MAP_ID_BONE_PALACE)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "The Desolation", $GC_I_MAP_REGION_Desolation, $g_as_MapLabels[$GC_I_MAP_ID_THE_RUPTURED_HEART], $GC_I_MAP_ID_THE_RUPTURED_HEART, $GC_I_MAP_ID_THE_MOUTH_OF_TORMENT)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "The Desolation", $GC_I_MAP_REGION_Desolation, $g_as_MapLabels[$GC_I_MAP_ID_THE_SHATTERED_RAVINES], $GC_I_MAP_ID_THE_SHATTERED_RAVINES, $GC_I_MAP_ID_LAIR_OF_THE_FORGOTTEN)
			AddMap($aNightfallMaps, $GC_I_MAP_CAMPAIGN_NIGHTFALL, "The Desolation", $GC_I_MAP_REGION_Desolation, $g_as_MapLabels[$GC_I_MAP_ID_THE_SULFUROUS_WASTES], $GC_I_MAP_ID_THE_SULFUROUS_WASTES, $GC_I_MAP_ID_GATE_OF_DESOLATION_OUTPOST)
		#EndRegion The Desolation
	#EndRegion Elonia

	#Region Eye of the North
		#Region GC_I_MAP_REGION_CharrHomelands;Charr Homelands
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Charr Homelands", $GC_I_MAP_REGION_CharrHomelands, $g_as_MapLabels[$GC_I_MAP_ID_DALADA_UPLANDS], $GC_I_MAP_ID_DALADA_UPLANDS, $GC_I_MAP_ID_DOOMLORE_SHRINE)
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Charr Homelands", $GC_I_MAP_REGION_CharrHomelands, $g_as_MapLabels[$GC_I_MAP_ID_GROTHMAR_WARDOWNS], $GC_I_MAP_ID_GROTHMAR_WARDOWNS, $GC_I_MAP_ID_LONGEYES_LEDGE)
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Charr Homelands", $GC_I_MAP_REGION_CharrHomelands, $g_as_MapLabels[$GC_I_MAP_ID_SACNOTH_VALLEY], $GC_I_MAP_ID_SACNOTH_VALLEY, $GC_I_MAP_ID_DOOMLORE_SHRINE)
		#EndRegion GC_I_MAP_REGION_CharrHomelands

		#Region GC_I_MAP_REGION_FarShiverpeaks;Far Shiverpeaks
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Far Shiverpeaks", $GC_I_MAP_REGION_FarShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_BJORA_MARCHES], $GC_I_MAP_ID_BJORA_MARCHES, $GC_I_MAP_ID_LONGEYES_LEDGE)
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Far Shiverpeaks", $GC_I_MAP_REGION_FarShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_DRAKKAR_LAKE], $GC_I_MAP_ID_DRAKKAR_LAKE, $GC_I_MAP_ID_SIFHALLA)
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Far Shiverpeaks", $GC_I_MAP_REGION_FarShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_ICE_CLIFF_CHASMS], $GC_I_MAP_ID_ICE_CLIFF_CHASMS, $GC_I_MAP_ID_BOREAL_STATION)
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Far Shiverpeaks", $GC_I_MAP_REGION_FarShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_JAGA_MORAINE], $GC_I_MAP_ID_JAGA_MORAINE, $GC_I_MAP_ID_SIFHALLA)
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Far Shiverpeaks", $GC_I_MAP_REGION_FarShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_NORRHART_DOMAINS], $GC_I_MAP_ID_NORRHART_DOMAINS, $GC_I_MAP_ID_GUNNARS_HOLD)
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Far Shiverpeaks", $GC_I_MAP_REGION_FarShiverpeaks, $g_as_MapLabels[$GC_I_MAP_ID_VARAJAR_FELLS_1], $GC_I_MAP_ID_VARAJAR_FELLS_1, $GC_I_MAP_ID_OLAFSTEAD)
		#EndRegion GC_I_MAP_REGION_FarShiverpeaks

		#Region GC_I_MAP_REGION_TarnishedCoast;Tarnished Coast
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Tarnished Coast", $GC_I_MAP_REGION_TarnishedCoast, $g_as_MapLabels[$GC_I_MAP_ID_ARBOR_BAY], $GC_I_MAP_ID_ARBOR_BAY, $GC_I_MAP_ID_VLOXS_FALLS)
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Tarnished Coast", $GC_I_MAP_REGION_TarnishedCoast, $g_as_MapLabels[$GC_I_MAP_ID_ALCAZIA_TANGLE], $GC_I_MAP_ID_ALCAZIA_TANGLE, $GC_I_MAP_ID_TARNISHED_HAVEN)
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Tarnished Coast", $GC_I_MAP_REGION_TarnishedCoast, $g_as_MapLabels[$GC_I_MAP_ID_MAGUS_STONES], $GC_I_MAP_ID_MAGUS_STONES, $GC_I_MAP_ID_RATA_SUM)
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Tarnished Coast", $GC_I_MAP_REGION_TarnishedCoast, $g_as_MapLabels[$GC_I_MAP_ID_RIVEN_EARTH], $GC_I_MAP_ID_RIVEN_EARTH, $GC_I_MAP_ID_RATA_SUM)
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Tarnished Coast", $GC_I_MAP_REGION_TarnishedCoast, $g_as_MapLabels[$GC_I_MAP_ID_SPARKFLY_SWAMP], $GC_I_MAP_ID_SPARKFLY_SWAMP, $GC_I_MAP_ID_GADDS_ENCAMPMENT)
			AddMap($aEyeOfTheNorthMaps, $GC_I_MAP_CAMPAIGN_EOTN, "Tarnished Coast", $GC_I_MAP_REGION_TarnishedCoast, $g_as_MapLabels[$GC_I_MAP_ID_VERDANT_CASCADES], $GC_I_MAP_ID_VERDANT_CASCADES, $GC_I_MAP_ID_UMBRAL_GROTTO)
		#EndRegion GC_I_MAP_REGION_TarnishedCoast
	#EndRegion Eye of the North
#EndRegion MapData
Func ProcessCheckedMaps()
	Out("Checking maps")
	Local $checkedMaps[0][8]
	Local $checkedCount = 0
	Local $l_b_Backward = False
	Local $l_i_RestartCount = 0

	;Browse all checkboxes
	For $i = 0 To $checkboxCount - 1
		If GUICtrlRead($checkboxIDs[$i]) = $GUI_CHECKED And BitAND(GUICtrlGetState($checkboxIDs[$i]), $GUI_DISABLE) = 0 Then
			;Resize the array
			ReDim $checkedMaps[$checkedCount + 1][8]

			;Copy the map information
			For $j = 0 To 6
				$checkedMaps[$checkedCount][$j] = $mapInfos[$i][$j]
			Next

			;Save the checkbox index
			$checkedMaps[$checkedCount][6] = $i

			$checkedCount += 1
		EndIf
	Next

	;If no map is selected
	If $checkedCount = 0 Then
		$g_sPendingAction = "StopNoMapsSelected"
		Return
	EndIf

	Out("Processing " & $checkedCount & " checked maps...")

	;Loop through each selected map
	IF GUICtrlRead($chkLoopMap) = $GUI_UNCHECKED Then
		For $i = 0 To UBound($checkedMaps) - 1
			;reset storage array for opened chests
			Global $opendChests = [0]
			
			Local $campaignID = $checkedMaps[$i][0]
			Local $regionName = $checkedMaps[$i][1]
			Local $regionID = $checkedMaps[$i][2]
			Local $mapName = $checkedMaps[$i][3]
			Local $mapID = $checkedMaps[$i][4]
			Local $cityID = $checkedMaps[$i][5]
			Local $checkboxIndex = $checkedMaps[$i][6]
			
			GUICtrlSetData($lblCurrentMap, "Current map: " & $mapName)
			VanquishMap($campaignID, $regionName, $regionID, $mapName, $mapID, $cityID, $checkboxIndex)	
				
			If $g_sPendingAction = "StopVanquishMaps" Then
				ExitLoop ;update checkbox and stop
			ElseIf $g_sPendingAction = "StopWithError" Or $g_sPendingAction = "StopVanquishEndManually" Or $g_sPendingAction = "StopForCartographing" Then
				Return ;stop immediately
			EndIf
		Next
		
		Out("All checked maps processed!")

		
		Map_TravelTo($cityID)
		GUICtrlSetData($lblCurrentMap, "Current map: ")
		
	Else
		While True
			Local $campaignID = $checkedMaps[0][0]
			Local $regionName = $checkedMaps[0][1]
			Local $regionID = $checkedMaps[0][2]
			Local $mapName = $checkedMaps[0][3]
			Local $mapID = $checkedMaps[0][4]
			Local $cityID = $checkedMaps[0][5]
			Local $checkboxIndex = $checkedMaps[0][6]

			
			GUICtrlSetData($lblCurrentMap, "Current map: " & $mapName)
			VanquishMap($campaignID, $regionName, $regionID, $mapName, $mapID, $cityID, $checkboxIndex)	
				
			If $g_sPendingAction = "StopVanquishMaps" Or $g_sPendingAction = "StopWithError" Then
				ExitLoop
			EndIf
		WEnd
	EndIf

EndFunc   ;==>ProcessCheckedMaps

Func VanquishMap($campaignID, $regionName, $regionID, $mapName, $mapID, $cityID, $checkboxIndex)
	IF Map_GetMapID() <> $mapID Then
		If Map_GetMapID() <> $cityID Then
			;Check if cityID is unlocked
			 If Map_IsMapUnlocked($cityID) And Map_IsOutpost($cityID) Then
				Out("Travelling to " & $g_as_MapLabels[$cityID])
				Map_TravelTo($cityID)
				
			Else
				Out("Map " & $g_as_MapLabels[$cityID] & "not unlocked")
				Return
			EndIf
		EndIf
		
		Out("Set hard mode")
		Ui_SetDifficulty(True)

		SetupTeamForOutpost(Map_GetAreaInfo($cityID, "MaxPartySize"))

		Cache_SkillBar()

		
		Switch $mapID
		Case $GC_I_MAP_ID_ZEN_DAIJUN_EXPLORABLE
			EnterMapWithNPC(20299, 9140)
		Case $GC_I_MAP_ID_THE_HIDDEN_CITY_OF_AHDASHIM
			EnterMapWithNPC(1340, -20416)
		Case $GC_I_MAP_ID_GARDEN_OF_SEBORHIN
			Local $l_a_Path = Map_GetExitPortalsCoords($cityID, $GC_I_MAP_ID_FORUM_HIGHLANDS)
			Local $l_f_PortalX = $l_a_Path[0]
			Local $l_f_PortalY = $l_a_Path[1]
			Out("Going to portal in Tihark Orchard (" & $l_f_PortalX & ", " & $l_f_PortalY & ")")
			Pathfinder_MoveTo($l_f_PortalX, $l_f_PortalY)
			IF CheckMapLodedHardmode() = False Then
				$g_sPendingAction = "StopWithError"
				Return 
			EndIf
			EnterMapWithNPC(-4510, 15807)
		Case $GC_I_MAP_ID_BAHDOK_CAVERNS
			EnterMapWithNPC(-13646, -10449)				
		Case Else 
			;Get the full path with the coordinates of the portals
			Local $l_a_FullPath = Map_GetPathWithPortalCoords(Map_GetMapID(), $mapID)
			;Browse all the maps along the path (except the last one, which is the destination).
			For $i = 0 To UBound($l_a_FullPath) - 2
				Local $l_s_CurrentMapName = $l_a_FullPath[$i][1]
				Local $l_f_PortalX = $l_a_FullPath[$i][2]
				Local $l_f_PortalY = $l_a_FullPath[$i][3]
			
				Out("Going to portal in " & $l_s_CurrentMapName & " (" & $l_f_PortalX & ", " & $l_f_PortalY & ")")
				Pathfinder_MoveTo($l_f_PortalX, $l_f_PortalY)
				If Map_GetMapID() = $mapID Then ExitLoop
				IF CheckMapLodedHardmode() = False Then
					$g_sPendingAction = "StopWithError"
					Return 
				EndIf
				
			Next
		EndSwitch		
	EndIf
	
	IF CheckMapLodedHardmode() = False Then
		$g_sPendingAction = "StopWithError"
		Return 
	EndIf
	
	;Where the magic happens
	Switch $mapID
			;Ascalon
			Case $GC_I_MAP_ID_ASCALON_FOOTHILLS
				VQAscalonFoothills()
			Case $GC_I_MAP_ID_DIESSA_LOWLANDS
				VQDiessaLowlands()
			Case $GC_I_MAP_ID_DRAGONS_GULLET
				VQDragonsGullet()
			Case $GC_I_MAP_ID_EASTERN_FRONTIER			
				VQEasternFrontier()
			Case $GC_I_MAP_ID_FLAME_TEMPLE_CORRIDOR
				VQFlameTempleCorridor()				
			Case $GC_I_MAP_ID_OLD_ASCALON
				VQOldAscalon()	
			Case $GC_I_MAP_ID_POCKMARK_FLATS
				VQPockmarkFlats()
			Case $GC_I_MAP_ID_REGENT_VALLEY
				VQRegentValley()
			Case $GC_I_MAP_ID_THE_BREACH
				VQTheBreach()
				
			;Northern Shiverpeaks
			Case $GC_I_MAP_ID_ANVIL_ROCK
				VQAnvilRock()
			Case $GC_I_MAP_ID_DELDRIMOR_BOWL
				VQDeldrimorBowl()		
			Case $GC_I_MAP_ID_GRIFFONS_MOUTH
				VQGriffonsMouth()
			Case $GC_I_MAP_ID_IRON_HORSE_MINE
				VQIronHorseMine()
			Case $GC_I_MAP_ID_TRAVELERS_VALE
				VQTravelersVale()
				
			;Maguuma Jungle"
			Case $GC_I_MAP_ID_DRY_TOP
				VQDryTop()
			Case $GC_I_MAP_ID_ETTINS_BACK
				VQEttinsBack()
			Case $GC_I_MAP_ID_MAMNOON_LAGOON
				VQMamnoonLagoon()
			Case $GC_I_MAP_ID_REED_BOG
				VQReedBog()
			Case $GC_I_MAP_ID_SAGE_LANDS
				VQSageLands()
			Case $GC_I_MAP_ID_SILVERWOOD
				VQSilverwood()
			Case $GC_I_MAP_ID_TANGLE_ROOT
				VQTangleRoot()
			Case $GC_I_MAP_ID_THE_FALLS
				VQTheFalls()
				
			;Crystal Desert VQ
			Case $GC_I_MAP_ID_DIVINERS_ASCENT
				VQDivinersAscent()
			Case $GC_I_MAP_ID_PROPHETS_PATH
				VQProphetsPath()
			Case $GC_I_MAP_ID_SALT_FLATS
				VQSaltFlats()
			Case $GC_I_MAP_ID_SKYWARD_REACH
				VQSkywardReach()
			Case $GC_I_MAP_ID_THE_ARID_SEA
				VQTheAridSea()
			Case $GC_I_MAP_ID_THE_SCAR
				VQTheScar()
			Case $GC_I_MAP_ID_VULTURE_DRIFTS
				VQVultureDrifts()
				
			;Kryta VQ
			Case $GC_I_MAP_ID_CURSED_LANDS
				VQCursedLands()
			Case $GC_I_MAP_ID_KESSEX_PEAK
				VQKessexPeak()
			Case $GC_I_MAP_ID_MAJESTYS_REST
				VQMajestysRest()
			Case $GC_I_MAP_ID_NEBO_TERRACE
				VQNeboTerrace()
			Case $GC_I_MAP_ID_NORTH_KRYTA_PROVINCE
				VQNorthKrytaProvince()
			Case $GC_I_MAP_ID_SCOUNDRELS_RISE
				VQScoundrelsRise()
			Case $GC_I_MAP_ID_STINGRAY_STRAND
				VQStingrayStrand()
			Case $GC_I_MAP_ID_TALMARK_WILDERNESS
				VQTalmarkWilderness()
			Case $GC_I_MAP_ID_TEARS_OF_THE_FALLEN
				VQTearsoftheFallen()
			Case $GC_I_MAP_ID_THE_BLACK_CURTAIN
				VQTheBlackCurtain()
			Case $GC_I_MAP_ID_TWIN_SERPENT_LAKES
				VQTwinSerpentLakes()
			Case $GC_I_MAP_ID_WATCHTOWER_COAST
				VQWatchtowerCoast()
				
			;Southern Shiverpeaks VQ
			Case $GC_I_MAP_ID_DREADNOUGHTS_DRIFT
				VQDreadnoughtsDrift()
			Case $GC_I_MAP_ID_FROZEN_FOREST
				VQFrozenForest()
			Case $GC_I_MAP_ID_GRENTHS_FOOTPRINT
				VQGrenthsFootprint()
			Case $GC_I_MAP_ID_ICE_FLOE
				VQIceFloe()
			Case $GC_I_MAP_ID_ICEDOME
				VQIcedome()
			Case $GC_I_MAP_ID_LORNARS_PASS
				VQLornarsPass()
			Case $GC_I_MAP_ID_MINERAL_SPRINGS
				VQMineralSprings()
			Case $GC_I_MAP_ID_SNAKE_DANCE
				VQSnakeDance()
			Case $GC_I_MAP_ID_SPEARHEAD_PEAK
				VQSpearheadPeak()
			Case $GC_I_MAP_ID_TALUS_CHUTE
				VQTalusChute()
			Case $GC_I_MAP_ID_TASCAS_DEMISE
				VQTascasDemise()
			Case $GC_I_MAP_ID_WITMANS_FOLLY
				VQWitmansFolly()
				
			;Ring of Fire Island VQ
			Case $GC_I_MAP_ID_PERDITION_ROCK
				VQPerditionRock()
				
			;Shing Jea Island VQ
			Case $GC_I_MAP_ID_HAIJU_LAGOON
				VQHaijuLagoon()
			Case $GC_I_MAP_ID_JAYA_BLUFF
				VQJayaBluffs()
			Case $GC_I_MAP_ID_KINYA_PROVINCE
				VQKinyaProvince()
			Case $GC_I_MAP_ID_MINISTER_CHOS_ESTATE_EXPLORABLE
				VQMinisterChosEstate()
			Case $GC_I_MAP_ID_PANJIANG_PENINSULA
				VQPanjiangPeninsula()
			Case $GC_I_MAP_ID_SAOSHANG_TRAIL
				VQSaoshangTrail()				
			Case $GC_I_MAP_ID_SUNQUA_VALE			
				VQSunquaVale()				
			Case $GC_I_MAP_ID_ZEN_DAIJUN_EXPLORABLE				
				VQZenDaijun()	
				
			;Kaineng City VQ
			Case $GC_I_MAP_ID_BUKDEK_BYWAY			
				VQBukdekByway()				
			Case $GC_I_MAP_ID_NAHPUI_QUARTER_EXPLORABLE				
				VQNahpuiQuarter()				
			Case $GC_I_MAP_ID_PONGMEI_VALLEY				
				VQPongmeiValley()				
			Case $GC_I_MAP_ID_RAISU_PALACE_EXPLORABLE			
				VQRaisuPalace()				
			Case $GC_I_MAP_ID_SHADOWS_PASSAGE			
				VQShadowsPassage()			
			Case $GC_I_MAP_ID_SHENZUN_TUNNELS			
				VQShenzunTunnels()				
			Case $GC_I_MAP_ID_SUNJIANG_DISTRICT_EXPLORABLE			
				VQSunjiangDistrict()				
			Case $GC_I_MAP_ID_TAHNNAKAI_TEMPLE_EXPLORABLE				
				VQTahnnakiTemple()				
			Case $GC_I_MAP_ID_WAIJUN_BAZAAR			
				VQWajjunBazaar()				
			Case $GC_I_MAP_ID_XAQUANG_SKYWAY			
				VQXaquangSkyway()
				
			;Echovald Forest VQ
			Case $GC_I_MAP_ID_ARBORSTONE_EXPLORABLE							
				VQArborstone()								
			Case $GC_I_MAP_ID_DRAZACH_THICKET								
				VQDrazachThicket()								
			Case $GC_I_MAP_ID_FERNDALE							
				VQFerndale()								
			Case $GC_I_MAP_ID_MELANDRUS_HOPE								
				VQMelandrusHope()								
			Case $GC_I_MAP_ID_MOROSTAV_TRAIL								
				VQMorostavTrail()								
			Case $GC_I_MAP_ID_MOURNING_VEIL_FALLS								
				VQMourningVeilFalls()								
			Case $GC_I_MAP_ID_THE_ETERNAL_GROVE_EXPLORABLE								
				VQTheEternalGrove()	
				
			;The Jade Sea VQ
			Case $GC_I_MAP_ID_ARCHIPELAGOS						
				VQArchipelagos()							
			Case $GC_I_MAP_ID_BOREAS_SEABED_EXPLORABLE								
				VQBoreasSeabed()								
			Case $GC_I_MAP_ID_GYALA_HATCHERY_EXPLORABLE								
				VQGyalaHatchery()								
			Case $GC_I_MAP_ID_MAISHANG_HILLS								
				VQMaishangHills()								
			Case $GC_I_MAP_ID_MOUNT_QINKAI							
				VQMountQinkai()								
			Case $GC_I_MAP_ID_RHEAS_CRATER								
				VQRheasCrater()								
			Case $GC_I_MAP_ID_SILENT_SURF							
				VQSilentSurf()								
			Case $GC_I_MAP_ID_UNWAKING_WATERS_EXPLORABLE								
				VQUnwakingWaters()
				
			; ;Istan VQ
			Case $GC_I_MAP_ID_CLIFFS_OF_DOHJOK			
				VQCliffsOfDohjok()				
			Case $GC_I_MAP_ID_FAHRANUR_THE_FIRST_CITY			
				VQFahranurTheFirstCity()				
			Case $GC_I_MAP_ID_ISSNUR_ISLES				
				VQIssnurIsles()				
			Case $GC_I_MAP_ID_LAHTEDA_BOG			
				VQLahtendaBog()				
			Case $GC_I_MAP_ID_MEHTANI_KEYS			
				VQMehtaniKeys()				
			 Case $GC_I_MAP_ID_PLAINS_OF_JARIN				
				 VQPlainsofJarin()				
			Case $GC_I_MAP_ID_ZEHLON_REACH			
				VQZehlonReach()				
			;Kourna VQ
			Case $GC_I_MAP_ID_ARKJOK_WARD			
				VQArkjokWard()				
			Case $GC_I_MAP_ID_BAHDOK_CAVERNS				
				VQBahdokCaverns()				
			Case $GC_I_MAP_ID_BARBAROUS_SHORE			
				VQBarbarousShore()				
			Case $GC_I_MAP_ID_DEJARIN_ESTATE				
				VQDejarinEstate()				
			Case $GC_I_MAP_ID_GANDARA_THE_MOON_FORTRESS			
				VQGandaraTheMoonFortress()				
			Case $GC_I_MAP_ID_JAHAI_BLUFFS			
				VQJahaiBluffs()				
			Case $GC_I_MAP_ID_MARGA_COAST				
				VQMargaCoast()				
			Case $GC_I_MAP_ID_SUNWARD_MARCHES				
				VQSunwardMarches()				
			Case $GC_I_MAP_ID_THE_FLOODPLAIN_OF_MAHNKELON			
				VQTheFloodplainOfMahnkelon()				
			Case $GC_I_MAP_ID_TURAIS_PROCESSION				
				VQTuraisProcession()				
			;Vabbi VQ
			Case $GC_I_MAP_ID_FORUM_HIGHLANDS				
				VQForumHighlands()			
			Case $GC_I_MAP_ID_GARDEN_OF_SEBORHIN			
				VQGardenOfSeborhin()				
			Case $GC_I_MAP_ID_HOLDINGSOFCHOKHIN				
				VQHoldingsOfChokhin()				
			Case $GC_I_MAP_ID_RESPLENDENT_MAKUUN				
				VQResplendentMakuun()				
			Case $GC_I_MAP_ID_THE_HIDDEN_CITY_OF_AHDASHIM			
				VQTheHiddenCityOfAhdashim()				
			Case $GC_I_MAP_ID_THE_MIRROR_OF_LYSS				
				VQTheMirrorOfLyss()				
			Case $GC_I_MAP_ID_VEHJIN_MINES				
				VQVehjinMines()				
			Case $GC_I_MAP_ID_VEHTENDI_VALLEY			
				VQVehtendiValley()				
			Case $GC_I_MAP_ID_WILDERNESS_OF_BAHDZA				
				VQWildernessOfBahdza()				
			Case $GC_I_MAP_ID_YATENDI_CANYONS				
				VQYatendiCanyons()				
			;The Desolation VQ
			Case $GC_I_MAP_ID_CRYSTAL_OVERLOOK				
				VQCrystalOverlook()				
			Case $GC_I_MAP_ID_JOKOS_DOMAIN			
				VQJokosDomain()				
			Case $GC_I_MAP_ID_POISONED_OUTCROPS			
				VQPoisonedOutcrops()				
			Case $GC_I_MAP_ID_THE_ALKALI_PAN			
				VQTheAlkaliPan()				
			Case $GC_I_MAP_ID_THE_RUPTURED_HEART			
				VQTheRupturedHeart()				
			Case $GC_I_MAP_ID_THE_SHATTERED_RAVINES				
				VQTheShatteredRavines()				
			Case $GC_I_MAP_ID_THE_SULFUROUS_WASTES				
				VQTheSulfurousWastes()
				
			;Charr Homelands VQ
			Case $GC_I_MAP_ID_DALADA_UPLANDS							
				VQDaladaUplands()								
			Case $GC_I_MAP_ID_GROTHMAR_WARDOWNS							
				VQGrothmarWardowns()								
			Case $GC_I_MAP_ID_SACNOTH_VALLEY								
				VQSacnothValley()	
				
			;Far Shiverpeaks VQ
			Case $GC_I_MAP_ID_BJORA_MARCHES						
				VQBjoraMarches()								
			Case $GC_I_MAP_ID_DRAKKAR_LAKE								
				VQDrakkarLake()								
			Case $GC_I_MAP_ID_ICE_CLIFF_CHASMS							
				VQIceCliffChasms()								
			Case $GC_I_MAP_ID_JAGA_MORAINE							
				VQJagaMoraine()								
			Case $GC_I_MAP_ID_NORRHART_DOMAINS								
				VQNorrhartDomains()								
			Case $GC_I_MAP_ID_VARAJAR_FELLS_1						
				VQVarajarFells()	
				
			;Tarnished Coast VQ
			Case $GC_I_MAP_ID_ARBOR_BAY							
				VQArborBay()								
			Case $GC_I_MAP_ID_ALCAZIA_TANGLE								
				VQAlcaziaTangle()								
			Case $GC_I_MAP_ID_MAGUS_STONES								
				VQMagusStones()								
			Case $GC_I_MAP_ID_RIVEN_EARTH							
				VQRivenEarth()								
			Case $GC_I_MAP_ID_SPARKFLY_SWAMP								
				VQSparkflySwamp()								
			Case $GC_I_MAP_ID_VERDANT_CASCADES							
				VQVerdantCascades()
	EndSwitch
	
	Out(World_GetWorldInfo("FoesToKill"))
	If World_GetWorldInfo("FoesToKill") = 0 Then 
		
		;Looping current map
		IF GUICtrlRead($chkLoopMap) = $GUI_UNCHECKED Then
			GUICtrlSetState($checkboxIDs[$checkboxIndex], $GUI_UNCHECKED)
			Out("Map vanquished and stats updated!")
			UpdateAllTitlesProgress()
			;check if cartography mode is active
			IF GUICtrlRead($chkCartography) = $GUI_CHECKED Then
				$g_sPendingAction = "StopForCartographing"
			EndIf
		Else
			Map_TravelTo($cityID)
			Out("Looping map active - repeat map " & $mapName)
		EndIf

		Sleep(Other_GetPing() + 500)
		
				

		
		Return
	Else
		Out("Failed to vanquish " & $mapName)
		IF GUICtrlRead($chkEndManually) = $GUI_CHECKED Then
			$g_sPendingAction = "StopVanquishEndManually"
		EndIf
		Return
	EndIf
EndFunc   ;==>VanquishMap

Func GetBlessing($aX, $aY)
	Out("Getting Blessing (" & $aX & " , " & $aY & ")")
	Pathfinder_MoveTo($aX, $aY)
	Agent_GoNPC(GetNearestNPC($aX, $aY))
	Sleep(500)
	; Game_Dialog(0x83)
	; Sleep(1000)
	Game_Dialog(0x85)
	Sleep(300)
EndFunc 	;==>GetBlessing


Func EnterMapWithNPC($aX, $aY)
		Out("Enter map with NPC (" & $aX & " , " & $aY & ")")
		Pathfinder_MoveTo($aX, $aY)
		Agent_GoNPC(GetNearestNPC($aX, $aY))
		Sleep(1000)
		Game_Dialog(0x81)
		Game_Dialog(0x84)
		Sleep(5000)		
		Map_WaitMapIsLoaded()	
EndFunc 	;==>EnterMapWithNPC		

Func Pathfinder_MoveTo_Waypoints($aWaypoints)
Local $aAggroRange = 1250
Local $aFightRangeOut = 1300
	IF (UBound($aWaypoints) - 1) = 0 Then 
		("No Waipoints found")
		Return
	EndIf
    For $Index = 0 To UBound($aWaypoints) - 1
            If World_GetWorldInfo("FoesToKill") = 0 Then
                ExitLoop
				;Return
            EndIf
			$aFightRangeOut = 1500
			Out("moving to waypoint(" & $Index & "): " &$aWaypoints[$Index][0] & ", " & $aWaypoints[$Index][1] & ", AggroRange: " & $aAggroRange )
			MoveToFollowPath($aWaypoints[$Index][0], $aWaypoints[$Index][1], $aAggroRange, $aFightRangeOut)
    Next
EndFunc		;==>Pathfinder_MoveTo_Waypoints

Func Pathfinder_MoveTo_Waypoints_Reverse($aWaypoints)
Local $aAggroRange = 3500
Local $aFightRangeOut = 3550
    For $Index = UBound($aWaypoints) - 1 To 0 Step -1
            If World_GetWorldInfo("FoesToKill") = 0 Then
                ExitLoop
				;Return
            EndIf
			Out("moving to waypoint(" & $Index & "): " &$aWaypoints[$Index][0] & ", " & $aWaypoints[$Index][1] & ", AggroRange: " & $aAggroRange )
			MoveToFollowPath($aWaypoints[$Index][0], $aWaypoints[$Index][1], $aAggroRange, $aFightRangeOut)
    Next
EndFunc		;==>Pathfinder_MoveTo_Waypoints_Reverse

Func MoveToFollowPath($aX, $aY, $aAggroRange = 1250, $aFightRangeOut = 1500)
	$DLL_PATH = "..\..\API\Plugins\Pathfinder\GWPathfinder.dll"
	
	If Map_GetCharacterInfo("MapID") = $GC_I_MAP_ID_THE_MOUTH_OF_TORMENT Then
		Pathfinder_MoveTo($aX, $aY, -1, "Filter_TheMouthOfTorment", $aAggroRange, $aFightRangeOut , $g_i_FinisherMode, "")
	Else
		;Pathfinder_MoveTo($aX, $aY, -1, "FilterObstacle", $aAggroRange, $aFightRangeOut , $g_i_FinisherMode, "PickUpLoot")
		Pathfinder_MoveTo_Plus($aX, $aY, -1, "FilterObstacle", $aAggroRange, $aFightRangeOut , $g_i_FinisherMode, "PickUpItemsAndOpenChest")	
	EndIf
EndFunc   ;==>MoveToFollowPath

Func Filter_TheMouthOfTorment()
	Local $lavoid[1][3] = [[-1452, -4701, 1000]]
	Return $lavoid
EndFunc   ;==>Filter_TheMouthOfTorment

Func Agent_Filter_IsGadget($aAgentPtr)
	If Agent_GetAgentInfo($aAgentPtr, "IsGadgetType") Then Return True
	Return False
EndFunc   ;==>Agent_Filter_IsGadget

Func Agent_Filter_IsGadgetOrLiving($aAgentPtr)
	If Agent_GetAgentInfo($aAgentPtr, "IsLivingType") Then Return True
	If Agent_GetAgentInfo($aAgentPtr, "IsGadgetType") Then Return True
	Return False
EndFunc   ;==>Agent_Filter_IsGadgetOrLiving

Func FilterObstacle()
	If Map_GetInstanceInfo("IsOutpost") Then Return Agent_GetAgentsAsObstacles(1200, 85, "Agent_Filter_IsGadgetOrLiving")
	If Map_GetInstanceInfo("IsExplorable") Then Return Agent_GetAgentsAsObstacles(1200, 85, "Agent_Filter_IsGadget")
	Return 0
EndFunc   ;==>FilterObstacle

Func CheckMapLodedHardmode()
	Local $lDeadlock = TimerInit()
	Out("Testo... Checking Hardmode")
	Map_WaitMapIsLoaded()
	Sleep(Other_GetPing() + 500)
	While World_GetWorldInfo("FoesToKill") == 0
		If TimerDiff($lDeadlock) > 5000 Then
			Out("Timeout checking foes to kill. Hardmode active?")
			$g_sPendingAction = "StopWithError"
			Return False 
		EndIf
	WEnd
    Return True
EndFunc		;==>CheckMapLodedHardmode

; Finds the nearest Friendly NPC (Allegiance 0x6)
Func GetNearestNPC($a_f_X, $a_f_Y)
    Local $l_i_MaxAgents = Agent_GetMaxAgents()
    Local $l_i_BestID = 0
    Local $l_f_MinDist = 500
    
    For $i = 1 To $l_i_MaxAgents
        Local $l_p_Agent = Agent_GetAgentPtr($i)
        If $l_p_Agent = 0 Then ContinueLoop
        
        Local $l_i_Allegiance = Agent_GetAgentInfo($i, "Allegiance")
        If $l_i_Allegiance <> 0x6 Then ContinueLoop
        
        Local $l_f_AgentX = Agent_GetAgentInfo($i, "X")
        Local $l_f_AgentY = Agent_GetAgentInfo($i, "Y")
        
        Local $l_f_Dist = Sqrt(($a_f_X - $l_f_AgentX)^2 + ($a_f_Y - $l_f_AgentY)^2)
        
        If $l_f_Dist < $l_f_MinDist Then
            $l_f_MinDist = $l_f_Dist
            $l_i_BestID = $i
        EndIf
    Next
    
    Return $l_i_BestID
EndFunc
