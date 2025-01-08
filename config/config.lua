Config = {}
Config.CodeLetters  = 3
Config.CodeNumbers  = 3
Config.CodeSpace = false


Config.premadeLoads = {
    [1] = {
        label = "UZI KIT",
        price = 5000,
        items = {
            ["WEAPON_MICROSMG"] = {
                label = "UZI",
                count = 1
            },
            ["ammo-45"] = {
                label = ".45ACP",
                count = 500
            },
            ["armour"] = {
                label = "Golyóálló Mellény",
                count = 5
            },
            ["adrenalin"] = {
                label = "Adrenalin Injekció",
                count = 2
            },
            ["at_suppressor_heavy"] = {
                label = "Tactical Suppressor",
                count = 1
            },
            ["at_clip_extended_smg"] = {
                label = "smg tárbővítő",
                count = 1
            },
            ["radio"] = {
                label = "Rádió",
                count = 1
            }
        }
    },
    [2] = {
        label = "CW KIT #1",
        price = 20000,
        items = {
            ["WEAPON_ASSAULTSMG"] = {
                label = "P90",
                count = 1
            },
            ["ammo-rifle"] = {
                label = "5.56x45",
                count = 1000
            },
            ["armour"] = {
                label = "Golyóálló Mellény",
                count = 15
            },
            ["adrenalin"] = {
                label = "Adrenalin Injekció",
                count = 15
            },
            ["radio"] = {
                label = "Rádió",
                count = 1
            },
            ["at_clip_extended_smg"] = {
                label = "smg tárbővítő",
                count = 1
            },
            ["at_suppressor_heavy"] = {
                label = "Tactical Suppressor",
                count = 1
            }
        }
    },
    [3] = {
        label = "CW KIT #2",
        price = 15000,
        items = {
            ["WEAPON_MACHINEPISTOL"] = {
                label = "TEC-9",
                count = 1
            },
            ["ammo-9"] = {
                label = "Pisztoly Ammo",
                count = 1000
            },
            ["armour"] = {
                label = "Golyóálló Mellény",
                count = 15
            },
            ["adrenalin"] = {
                label = "Adrenalin Injekció",
                count = 15
            },
            ["radio"] = {
                label = "Rádió",
                count = 1
            },
            ["at_clip_drum_smg"] = {
                label = "SMG dobtár",
                count = 1
            },
            ["at_suppressor_light"] = {
                label = "Supressor",
                count = 1
            }
        }
    },
    [4] = {
        label = "P90 KIT",
        price = 10000,
        items = {
            ["WEAPON_ASSAULTSMG"] = {
                label = "P90",
                count = 1
            },
            ["ammo-rifle"] = {
                label = "5.56x45",
                count = 500
            },
            ["armour"] = {
                label = "Golyóálló Mellény",
                count = 5
            },
            ["adrenalin"] = {
                label = "Adrenalin Injekció",
                count = 4
            },
            ["radio"] = {
                label = "Rádió",
                count = 1
            },
            ["at_clip_extended_smg"] = {
                label = "smg tárbővítő",
                count = 1
            },
            ["at_suppressor_heavy"] = {
                label = "Tactical Suppressor",
                count = 1
            }
        }
    },
    [5] = {
        label = "H&K G36C KIT",
        price = 10000,
        items = {
            ["WEAPON_SPECIALCARBINE"] = {
                label = "H&K G36C",
                count = 1
            },
            ["ammo-rifle"] = {
                label = "5.56x45",
                count = 500
            },
            ["armour"] = {
                label = "Golyóálló Mellény",
                count = 5
            },
            ["adrenalin"] = {
                label = "Adrenalin Injekció",
                count = 4
            },
            ["radio"] = {
                label = "Rádió",
                count = 1
            },
            ["at_suppressor_heavy"] = {
                label = "Tactical Suppressor",
                count = 1
            },
            ["at_clip_extended_rifle"] = {
                label = "Rifle tárbővítő",
                count = 1
            }
        }
    },
    [6] = {
        label = "TEC-9 KIT",
        price = 7500,
        items = {
            ["WEAPON_MACHINEPISTOL"] = {
                label = "TEC-9",
                count = 1
            },
            ["ammo-9"] = {
                label = "Pisztoly Ammo",
                count = 500
            },
            ["armour"] = {
                label = "Golyóálló Mellény",
                count = 5
            },
            ["adrenalin"] = {
                label = "Adrenalin Injekció",
                count = 3
            },
            ["radio"] = {
                label = "Rádió",
                count = 1
            },
            ["at_clip_drum_smg"] = {
                label = "smg dobtár",
                count = 1
            },
            ["at_suppressor_light"] = {
                label = "Supressor",
                count = 1
            }
        }
    }
}


Config.loadOutShops = {
    {coords = vector4(211.6285, 2796.4731, 44.6552, 106.6722)},  --safe1 
    {coords = vector4(320.4231, -204.8347, 53.0863, 218.3906)},  --safe2
    {coords = vector4(31.8115, -2685.2407, 11.0354, 179.2752)},  --ekorea
    {coords = vector4(-2135.8928, -383.1055, 12.1455, 143.9170)},  --ausztrália
    {coords = vector4(1702.5809, 6418.8643, 31.6393, 325.3533)},  --mikronezia
    {coords = vector4(-1154.1488, -1730.0513, 3.1673, 136.5222)},  --venezuela
    {coords = vector4(-54.9441, -2105.4170, 15.7049, 287.4596)},  --svajc
    {coords = vector4(1659.1277, 2208.1699, 78.0973, 260.0600)},  --csad
    {coords = vector4(1855.5817, 1824.6471, 64.0508, 113.5322)},  --etiopia
    {coords = vector4(2058.1838, 2817.9519, 49.3588, 221.5762)},  --nagybrit
    {coords = vector4(356.3091, -1669.1447, 47.3033, 233.9974)},  --izrael
    {coords = vector4(27.4122, -1734.0607, 28.3030, 297.0444)},  --spanyol
    {coords = vector4(3292.7656, 5186.3120, 17.4153, 335.9434)},  --alban
    {coords = vector4(2749.4678, 1387.8677, 23.5121, 9.3042)},  --dominika
    {coords = vector4(982.1860, -1830.5737, 30.2243, 245.0711)},  --irak
    {coords = vector4(2005.1998, 4744.6011, 40.0664, 299.6068)},  --costa
    {coords = vector4(1542.6091, 1957.4841, 99.6740, 89.0738)},  --afgan
    {coords = vector4(1530.9043, 1515.3956, 106.4105, 90.6317)},  --monaco
    {coords = vector4(2575.3474, 474.3908, 113.9234, 356.9122)},  --dkorea
    {coords = vector4(2759.8252, 3464.8740, 54.7333, 70.6814)},  --myanmar
    {coords = vector4(670.9922, 1276.5123, 359.2962, 353.1606)},  --szlovak
    {coords = vector4(1179.2396, 130.2932, 79.8865, 134.8810)},  --azer
    {coords = vector4(619.5635, 2739.3848, 40.9447, 1.4264)},  --Bolivia
    {coords = vector4(1555.3824, 870.6412, 76.4436, 246.4649)},  --kolumbia
    {coords = vector4(1931.3612, 2934.0498, 44.7068, 113.0763)},  --torok
    {coords = vector4(2598.052, 4422.632, 39.434, 42.519)},  --kina
    {coords = vector4(2070.3679, 1527.7762, 75.2411, 25.8753)},  --nauru
    {coords = vector4(2488.6423, -370.3259, 92.7353, 216.2894)},  --egyiptom
    {coords = vector4(430.0233, 6467.0747, 27.7718, 235.6605)},  --japan
    {coords = vector4(2934.4343, 4337.1021, 51.8513, 206.5372)},  --sved
    {coords = vector4(2575.6262, 1746.7203, 23.7462, 356.8318)},  --argentina
    {coords = vector4(1460.0548, 6545.2832, 13.6341, 289.9436)},  --kam
    {coords = vector4(741.7531, 2519.9043, 72.0931, 328.6203)},  --kuba
    {coords = vector4(1181.6907, -1565.2883, 38.4011, 145.9406)},  --szerbia
    {coords = vector4(2211.2195, 2935.0105, 45.5811, 7.9102)},  --barbados
    {coords = vector4(1782.5070, 3264.3762, 40.9806, 98.9644)},  --marino
    {coords = vector4(255.7103, -776.3215, 29.6368, 68.9318)},  --nemet
    {coords = vector4(1379.8123, -710.8781, 65.5643, 251.0932)},  --norvegia
    {coords = vector4(3803.5872, 4467.5273, 3.8931, 0.2323)},  --india
    {coords = vector4(150.2819, -1280.7775, 28.1616, 118.1288)},  --puerto
    {coords = vector4(143.8674, 6444.1953, 30.4666, 233.0716)},  --ecuador
    {coords = vector4(1109.7272, 3074.6223, 39.5089, 106.9951)},  --kak
    {coords = vector4(2491.0481, 4960.6870, 43.7667, 43.8383)},  --kongo
    {coords = vector4(2494.8379, 5667.9526, 44.6750, 206.7489)},  --romania
    {coords = vector4(2368.8059, 2642.6958, 45.6508, 52.9263)},  --montenegro
    {coords = vector4(1220.1156, 1814.3812, 78.0185, 219.0697)},  --koszovo
    {coords = vector4(478.2069, 3145.7651, 42.5153, 284.1183)},  --mozambik
    {coords = vector4(2359.1233, 3132.4341, 47.2087, 346.2521)},  --andorra 
    {coords = vector4(356.0140, 3524.3494, 33.6235, 226.4867)},  --dzsibuti
    {coords = vector4(2749.9905, 3923.4307, 43.0291, 163.7256)},  --honduras
    {coords = vector4(4898.4121, -4923.5649, 2.3809, 104.4761)},  --cayo
    {coords = vector4(1171.2032, 3604.2109, 32.4715, 100.6650)},  --kamerun
    {coords = vector4(2523.5376, 4341.8496, 38.4207, 99.0687)},  --bosznia
    {coords = vector4(-379.0519, -105.2742, 37.6963, 273.7997)},  --irorszag
    {coords = vector4(-144.2670, 1915.8151, 196.1254, 186.2602)},  --arab
    {coords = vector4(1337.8667, 4388.4414, 43.3435, 163.5912)},  --marshall
	{coords = vector4(2160.8560, 5147.9106, 50.6626, 124.8601)},  --vietnam
    {coords = vector4(1668.0983, -1555.0017, 111.4951, 356.4129)},  --brazil
    {coords = vector4(1538.1958, 3794.1821, 37.1838, 98.2233)},  --togo
    {coords = vector4(1521.9458, -2143.0103, 76.1140, 83.2349)},  --iran
    {coords = vector4(1477.2798, -2328.4324, 70.9382, 292.6345)},  --palau
    {coords = vector4(2851.5044, 4645.4712, 48.0076, 293.8929)},  --szomalia
    {coords = vector4(2805.9941, 4794.9468, 46.1073, 40.2745)},  --lengy
    {coords = vector4(1347.7030, 2630.6785, 36.7095, 63.2692)},  --honved
    {coords = vector4(1424.6318, 1137.8182, 113.3449, 79.2415)},  --cw
    {coords = vector4(1206.1833, 4011.0405, 418.0051, 271.4332)}  --cw2
}