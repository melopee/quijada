module Quijada.Values where

data Tree = N String | P String String | L String [Tree] deriving (Show, Eq)

values = [
  L "Cd" [
    L "INC:∅" [
      L "MAIN" [
        P "INF-PRC" "’",
        P "INF-CPT" "h",
        P "FML-PRC" "w",
        P "FML-CPT" "y"
      ]
    ],
    L "INC:INF-PRC" [
      L "MAIN" [
        P "INF-PRC" "hl",
        P "INF-CPT" "hr",
        P "FML-PRC" "hw",
        P "FML-CPT" "hy"
      ]
    ],
    L "INC:FML-PRC" [
      L "MAIN" [
        P "INF-PRC" "hll",
        P "INF-CPT" "hrr",
        P "FML-PRC" "hm",
        P "FML-CPT" "hn"
      ]
    ],
    L "INC:INF-CPT" [
      L "MAIN" [
        P "INF-PRC" "hlw",
        P "INF-CPT" "hrw",
        P "FML-PRC" "hmw",
        P "FML-CPT" "hmy"
      ]
    ],
    L "INC:FML-CPT" [
      L "MAIN" [
        P "INF-PRC" "hly",
        P "INF-CPT" "hrr",
        P "FML-PRC" "hnw",
        P "FML-CPT" "hny"
      ]
    ]
  ],
  L "Vr" [
    L "STEM:0" [
      L "STA" [
        P "BSC" "aì",
        P "CTE" "eì",
        P "CSV" "oì",
        P "OBJ" "öì",
        P "INT" "ëì"
      ],
      L "DYN" [
        P "BSC" "aù",
        P "CTE" "eù",
        P "CSV" "où",
        P "OBJ" "öù",
        P "INT" "öù"
      ]
    ],
    L "STEM:1" [
      L "STA" [
        P "BSC" "a",
        P "CTE" "e",
        P "CSV" "o",
        P "OBJ" "u",
        P "INT" "i"
      ],
      L "DYN" [
        P "BSC" "ai",
        P "CTE" "ei",
        P "CSV" "oi",
        P "OBJ" "ui",
        P "INT" "ëi"
      ]
    ],
    L "STEM:2" [
      L "STA" [
        P "BSC" "ä",
        P "CTE" "ë",
        P "CSV" "ö",
        P "OBJ" "ü",
        P "INT" "ea"
      ],
      L "DYN" [
        P "BSC" "au",
        P "CTE" "eu",
        P "CSV" "ou",
        P "OBJ" "iu",
        P "INT" "ëu"
      ]
    ],
    L "STEM:3" [
      L "STA" [
        P "BSC" "ao",
        P "CTE" "eo",
        P "CSV" "oa",
        P "OBJ" "oe",
        P "INT" "ae"
      ],
      L "DYN" [
        P "BSC" "ia/ua",
        P "CTE" "ie/ue",
        P "CSV" "io/uo",
        P "OBJ" "iö/uö",
        P "INT" "ië/uë"
      ]
    ]
  ],
  L "Vx" [
    L "TYPE:1" [
      P "0" "ae",
      P "1" "a",
      P "2" "e",
      P "3" "o",
      P "4" "u",
      P "5" "i",
      P "6" "ü",
      P "7" "ö",
      P "8" "ë",
      P "9" "ä"
    ],
    L "TYPE:2" [
      P "0" "ëu",
      P "1" "ai",
      P "2" "ei",
      P "3" "oi",
      P "4" "ui",
      P "5" "ëi",
      P "6" "iu",
      P "7" "ou",
      P "8" "eu",
      P "9" "au"
    ],
    L "TYPE:3" [
      P "0" "uë/ëù",
      P "1" "ia/aì",
      P "2" "ie/eì",
      P "3" "io/oì",
      P "4" "iö/öì",
      P "5" "ië/ëì",
      P "6" "uö/öù",
      P "7" "uo/où",
      P "8" "ue/eù",
      P "9" "ua/aù"
    ],
    L "Ca:STACKING" [
      P "MAIN" "uä",
      P "INC" "uë"
    ]
  ],
  L "Ca" [
    L "AFFILIATION" [
      P "CSL" "∅/l",
      P "ASO" "tļ/l-",
      P "VAR" "r",
      P "COA" "ř"
    ],
    L "CONFIGURATION" [
      P "UNI" "∅",
      P "DPX" "ň/nt",
      P "DCT" "f/v",
      P "AGG" "ţ/ḑ",
      P "SEG" "m",
      P "CPN" "n/nk",
      P "COH" "t/d",
      P "CST" "k/g",
      P "MLT" "p/b"
    ],
    L "EXTENSION" [
      P "DEL" "∅",
      P "PRX" "s",
      P "ICP" "z",
      P "ATV" "ţ/f",
      P "GRA" "š",
      P "DPL" "ž"
    ],
    L "PERSPECTIVE" [
      P "M" "∅",
      P "P" "t/m",
      P "N" "k/m",
      P "A" "p/m"
    ],
    L "ESSENCE" [
      P "NRM" "∅",
      P "RPV" "gemination"
    ],
    L "CONTEXT" [
      P "EXS" "∅",
      P "FNC" "l/ly",
      P "RPS" "r/ry",
      P "AMG" "w/řy"
    ]
  ],
  L "Vn" [
    P "MNO" "∅/A",
    P "PRL" "e",
    P "CRO" "o",
    P "RCP" "u",
    P "CPL" "i",
    P "DUP" "ü",
    P "DEM" "ö",
    P "IMT" "ë",
    P "CNG" "ä",
    P "PTI" "ao",
    P "IDC" "eo",
    P "MUT" "oa"
  ],
  L "Vp" [
    P "CTX" "wai",
    P "PCT" "wei",
    P "ITR" "woi",
    P "REP" "wui",
    P "ITM" "wëi",
    P "RCT" "wiu",
    P "FRE" "wou",
    P "FRG" "weu",
    P "FLC" "wau"
  ],
  L "Ve" [
    P "neutral" "∅",
    P "1/BEN" "yai",
    P "2/BEN" "yei",
    P "3/BEN" "yoi",
    P "all/BEN" "yui",
    P "unknown" "yëu",
    P "all/DET" "yiu",
    P "3/DET" "you",
    P "2/DET" "yeu",
    P "1/DET" "yau"
  ],
  L "Vl" [
    L "relative" [
      P "none" "∅",
      P "MIN" "wao",
      P "IFR" "wea",
      P "SBE" "woa",
      P "DFC" "woe",
      P "EQU" "wea",
      P "SUR" "wöe",
      P "SPL" "wöa",
      P "SPQ" "weö",
      P "MAX" "waö"
    ],
    L "absolute" [
      P "none" "∅",
      P "MIN" "yao",
      P "IFR" "yea",
      P "SBE" "yoa",
      P "DFC" "yoe",
      P "EQU" "yea",
      P "SUR" "yöe",
      P "SPL" "yöa",
      P "SPQ" "yeö",
      P "MAX" "yaö"
    ]
  ],
  L "Vm1" [
    P "null" "∅",
    P "FAC" "a’",
    P "SUB" "e’",
    P "ASM" "i’",
    P "SPC" "o’",
    P "COU" "u’",
    P "HYP" "ö’"
  ],
  L "Vm2" [
    P "null" "∅/ë",
    P "FAC" "a",
    P "SUB" "e",
    P "ASM" "i",
    P "SPC" "o",
    P "COU" "u",
    P "HYP" "ö"
  ],
  L "Cm" [
    P "null" "∅",
    P "FAC" "h",
    P "SUB" "hl",
    P "ASM" "kn",
    P "SPC" "ky",
    P "COU" "tn",
    P "HYP" "ty"
  ],
  L "Vt1" [
    P "RTR" "ai",
    P "PRS" "ei",
    P "HAB" "oi",
    P "PRG" "ui",
    P "IMM" "ëi",
    P "PCS" "iu",
    P "REG" "ou",
    P "ATC" "eu",
    P "ATP" "au",
    P "RSM" "ah",
    P "CSS" "eh",
    P "PAU" "oh",
    P "RGR" "uh",
    P "PCL" "ih",
    P "CNT" "üh",
    P "ICS" "öh",
    P "SMM" "ëh",
    P "IRP" "äh",
    P "PMP" "aih",
    P "CLM" "eih",
    P "DLT" "oih",
    P "TMP" "uih",
    P "MTV" "ëih",
    P "SQN" "iuh",
    P "EPD" "ouh",
    P "PTC" "euh",
    P "PPR" "auh",
    P "DCL" "a’h",
    P "CCL" "e’h",
    P "CUL" "o’h",
    P "IMD" "u’h",
    P "TRD" "i’h",
    P "TNS" "ü’h",
    P "ITC" "ö’h",
    P "XPD" "ë’h",
    P "LIM" "ä’h"
  ],
  L "Vt2" [
    P "RTR" "wa",
    P "PRS" "we",
    P "HAB" "wo",
    P "PRG" "wu",
    P "IMM" "wi",
    P "PCS" "wü",
    P "REG" "wö",
    P "ATC" "wë",
    P "ATP" "wä",
    P "RSM" "ya",
    P "CSS" "ye",
    P "PAU" "yo",
    P "RGR" "yu",
    P "PCL" "yi",
    P "CNT" "yü",
    P "ICS" "yö",
    P "SMM" "yë",
    P "IRP" "yä",
    P "PMP" "ai",
    P "CLM" "ei",
    P "DLT" "oi",
    P "TMP" "ui",
    P "MTV" "ëi",
    P "SQN" "iu",
    P "EPD" "ou",
    P "PTC" "eu",
    P "PPR" "au",
    P "DCL" "ao",
    P "CCL" "eo",
    P "CUL" "oa",
    P "IMD" "oe",
    P "TRD" "ea",
    P "TNS" "öe",
    P "ITC" "öa",
    P "XPD" "eö",
    P "LIM" "aö"
  ],
  L "Cc" [
    P "CCO" "r",
    P "CCw" "w/y",
    P "CCn" "n",
    P "CCs" "s",
    P "CCm" "m",
    P "CCp" "p",
    P "CCt" "t",
    P "CCk" "k",
    P "CCz" "š",
    P "CCg" "ň"
  ],
  L "Vc" [
    L "TRANSRELATIVE" [
      P "THM" "a",
      P "ABS" "e",
      P "ERG" "o",
      P "IND" "u",
      P "AFF" "i",
      P "DAT" "ü",
      P "EFF" "ö",
      P "STM" "ë",
      P "INS" "ä"
    ],
    L "APPOSITIVE" [
      P "POS" "ai",
      P "PRP" "ei",
      P "GEN" "oi",
      P "ATT" "ui",
      P "PDC" "ëi",
      P "ITP" "iu",
      P "OGN" "ou",
      P "IDP" "eu",
      P "PAR" "au"
    ],
    L "ASSOCIATIVE" [
      P "APL" "ia/aì",
      P "PUR" "ie/eì",
      P "TRA" "io/oì",
      P "DFR" "iö/öì",
      P "CRS" "ië/ëì",
      P "TSP" "uö/öù",
      P "CMM" "uo/où",
      P "CMP" "ue/eù",
      P "CSD" "ua/aù"
    ],
    L "ADVERBIAL" [
      P "CON" "ao",
      P "AVR" "eo",
      P "CVS" "oa",
      P "SIT" "oe",
      P "FUN" "ea",
      P "TFM" "öe",
      P "CLA" "öa",
      P "CSM" "eö",
      P "RSL" "aö"
    ],
    L "SPATIO-TEMPORAL I" [
      P "LOC" "á",
      P "ATD" "é",
      P "ALL" "ó",
      P "ABL" "ú",
      P "ORI" "í",
      P "IRL" "û",
      P "INV" "ô",
      P "NAV" "â"
    ],
    L "SPATIO-TEMPORAL II" [
      P "ASS" "ái",
      P "CNR" "éi",
      P "PER" "ói",
      P "PRO" "úi",
      P "PCV" "íu",
      P "PCR" "óu",
      P "ELP" "éu",
      P "PLM" "áu"
    ],
    L "RELATIONAL I" [
      P "REF" "iá/aí",
      P "COR" "ié/eí",
      P "CPS" "ió/oí",
      P "DEP" "iô/öí",
      P "PRD" "uô/öú",
      P "ESS" "uó/oú",
      P "ASI" "ué/eú",
      P "CFM" "uá/aú"
    ],
    L "RELATIONAL II" [
      P "ACT" "aó",
      P "SEL" "eó",
      P "COM" "oá",
      P "UTL" "oé",
      P "DSC" "eá",
      P "RLT" "ae",
      P "TRM" "aé",
      P "VOC" "ëu"
    ]
  ],
  L "Vk" [
    L "CNF" [
      L "PPS" [
        P "antepenultimate" "a"
      ],
      L "EPI" [
        P "antepenultimate" "ai"
      ],
      L "ALG" [
        P "antepenultimate" "ia/aì"
      ],
      L "IPU" [
        P "antepenultimate" "ao"
      ],
      L "RFU" [
        P "pre-antepenultimate" "a",
        P "penultimate" "a’a"
      ],
      L "REB" [
        P "pre-antepenultimate" "ai",
        P "penultimate" "aya"
      ],
      L "CJT" [
        P "pre-antepenultimate" "ia/aì",
        P "penultimate" "aye"
      ],
      L "EXV" [
        P "pre-antepenultimate" "ao",
        P "penultimate" "ayo"
      ],
      L "AXM" [
        P "ultimate" "ayá"
      ],
      L "∅" [
        P "ultimate" "ayó"
      ]
    ],
    L "INF" [
      L "PPS" [
        P "antepenultimate" "e"
      ],
      L "EPI" [
        P "antepenultimate" "ei"
      ],
      L "ALG" [
        P "antepenultimate" "ie/eì"
      ],
      L "IPU" [
        P "antepenultimate" "eo"
      ],
      L "RFU" [
        P "pre-antepenultimate" "e",
        P "penultimate" "e’e"
      ],
      L "REB" [
        P "pre-antepenultimate" "ei",
        P "penultimate" "eya"
      ],
      L "CJT" [
        P "pre-antepenultimate" "ie/eì",
        P "penultimate" "eye"
      ],
      L "EXV" [
        P "pre-antepenultimate" "eo",
        P "penultimate" "eyo"
      ],
      L "AXM" [
        P "ultimate" "eyá"
      ],
      L "∅" [
        P "ultimate" "eyó"
      ]
    ],
    L "ITU" [
      L "PPS" [
        P "antepenultimate" "o"
      ],
      L "EPI" [
        P "antepenultimate" "oi"
      ],
      L "ALG" [
        P "antepenultimate" "io/oì"
      ],
      L "IPU" [
        P "antepenultimate" "oa"
      ],
      L "RFU" [
        P "pre-antepenultimate" "o",
        P "penultimate" "o’o"
      ],
      L "REB" [
        P "pre-antepenultimate" "oi",
        P "penultimate" "oya"
      ],
      L "CJT" [
        P "pre-antepenultimate" "io/oì",
        P "penultimate" "oye"
      ],
      L "EXV" [
        P "pre-antepenultimate" "oa",
        P "penultimate" "oyo"
      ],
      L "AXM" [
        P "ultimate" "oyá"
      ],
      L "∅" [
        P "ultimate" "oyó"
      ]
    ],
    L "REV" [
      L "PPS" [
        P "antepenultimate" "u"
      ],
      L "EPI" [
        P "antepenultimate" "ui"
      ],
      L "ALG" [
        P "antepenultimate" "iö/öì"
      ],
      L "IPU" [
        P "antepenultimate" "oe"
      ],
      L "RFU" [
        P "pre-antepenultimate" "u",
        P "penultimate" "u’u"
      ],
      L "REB" [
        P "pre-antepenultimate" "ui",
        P "penultimate" "uya"
      ],
      L "CJT" [
        P "pre-antepenultimate" "iö/öì",
        P "penultimate" "uye"
      ],
      L "EXV" [
        P "pre-antepenultimate" "oe",
        P "penultimate" "uyo"
      ],
      L "AXM" [
        P "ultimate" "uyá"
      ],
      L "∅" [
        P "ultimate" "uyó"
      ]
    ],
    L "HSY" [
      L "PPS" [
        P "antepenultimate" "i"
      ],
      L "EPI" [
        P "antepenultimate" "ëi"
      ],
      L "ALG" [
        P "antepenultimate" "ië/ëì"
      ],
      L "IPU" [
        P "antepenultimate" "ea"
      ],
      L "RFU" [
        P "pre-antepenultimate" "i",
        P "penultimate" "i’i"
      ],
      L "REB" [
        P "pre-antepenultimate" "ëi",
        P "penultimate" "ëya"
      ],
      L "CJT" [
        P "pre-antepenultimate" "ië/ëì",
        P "penultimate" "ëye"
      ],
      L "EXV" [
        P "pre-antepenultimate" "ea",
        P "penultimate" "ëyo"
      ],
      L "AXM" [
        P "ultimate" "ëyá"
      ],
      L "∅" [
        P "ultimate" "ëyó"
      ]
    ],
    L "USP" [
      L "PPS" [
        P "antepenultimate" "ü"
      ],
      L "EPI" [
        P "antepenultimate" "iu"
      ],
      L "ALG" [
        P "antepenultimate" "uö/öù"
      ],
      L "IPU" [
        P "antepenultimate" "öe"
      ],
      L "RFU" [
        P "pre-antepenultimate" "ü",
        P "penultimate" "ü’ü"
      ],
      L "REB" [
        P "pre-antepenultimate" "iu",
        P "penultimate" "iwa"
      ],
      L "CJT" [
        P "pre-antepenultimate" "uö/öù",
        P "penultimate" "iwe"
      ],
      L "EXV" [
        P "pre-antepenultimate" "öe",
        P "penultimate" "iwo"
      ],
      L "AXM" [
        P "ultimate" "iwá"
      ],
      L "∅" [
        P "ultimate" "iwó"
      ]
    ],
    L "DIR" [
      L "PPS" [
        P "antepenultimate" "ö"
      ],
      L "EPI" [
        P "antepenultimate" "ou"
      ],
      L "ALG" [
        P "antepenultimate" "uo/où"
      ],
      L "IPU" [
        P "antepenultimate" "öa"
      ],
      L "RFU" [
        P "pre-antepenultimate" "ö",
        P "penultimate" "ö’ö"
      ],
      L "REB" [
        P "pre-antepenultimate" "ou",
        P "penultimate" "owa"
      ],
      L "CJT" [
        P "pre-antepenultimate" "uo/où",
        P "penultimate" "owe"
      ],
      L "EXV" [
        P "pre-antepenultimate" "öa",
        P "penultimate" "owo"
      ],
      L "AXM" [
        P "ultimate" "owá"
      ],
      L "∅" [
        P "ultimate" "owó"
      ]
    ],
    L "IRG" [
      L "PPS" [
        P "antepenultimate" "ë"
      ],
      L "EPI" [
        P "antepenultimate" "eu"
      ],
      L "ALG" [
        P "antepenultimate" "ue/eù"
      ],
      L "IPU" [
        P "antepenultimate" "eö"
      ],
      L "RFU" [
        P "pre-antepenultimate" "ë",
        P "penultimate" "ë’ë"
      ],
      L "REB" [
        P "pre-antepenultimate" "eu",
        P "penultimate" "ewa"
      ],
      L "CJT" [
        P "pre-antepenultimate" "ue/eù",
        P "penultimate" "ewe"
      ],
      L "EXV" [
        P "pre-antepenultimate" "eö",
        P "penultimate" "ewo"
      ],
      L "AXM" [
        P "ultimate" "ewá"
      ],
      L "∅" [
        P "ultimate" "ewó"
      ]
    ],
    L "DEC" [
      L "PPS" [
        P "antepenultimate" "ä"
      ],
      L "EPI" [
        P "antepenultimate" "au"
      ],
      L "ALG" [
        P "antepenultimate" "ua/aù"
      ],
      L "IPU" [
        P "antepenultimate" "aö"
      ],
      L "RFU" [
        P "pre-antepenultimate" "ä",
        P "penultimate" "ä’ä"
      ],
      L "REB" [
        P "pre-antepenultimate" "au",
        P "penultimate" "awa"
      ],
      L "CJT" [
        P "pre-antepenultimate" "ua/aù",
        P "penultimate" "awe"
      ],
      L "EXV" [
        P "pre-antepenultimate" "aö",
        P "penultimate" "awo"
      ],
      L "AXM" [
        P "ultimate" "awá"
      ],
      L "∅" [
        P "ultimate" "awó"
      ]
    ]
  ],
  L "Register Adjunct" [
    L "DISCURSIVE" [
      P "open" "hya",
      P "end" "hyia"
    ],
    L "PARENTHETICAL" [
      P "open" "hye",
      P "end" "hyie"
    ],
    L "IMPRESSIONISTIC" [
      P "open" "hyai",
      P "end" "hyau"
    ],
    L "COGITANT" [
      P "open" "hyo",
      P "end" "hyio"
    ],
    L "EXEMPLIFICATIVE" [
      P "open" "hyö",
      P "end" "hyiö"
    ],
    L "MATHS" [
      P "open" "hyoi",
      P "end" "hyou"
    ],
    L "CARRIER" [
      P "open" "∅",
      P "end" "hyi"
    ]
  ],
  L "Personal Reference Adjunct" [
    L "1m" [
      P "description" "monadic speaker",
      P "NEU" "l",
      P "BEN" "n",
      P "DET" "m",
      P "gloss" "“I”"
    ],
    L "2m" [
      P "description" "monadic addressee",
      P "NEU" "s",
      P "BEN" "š",
      P "DET" "ž",
      P "gloss" "“you (sg.)”"
    ],
    L "2p" [
      P "description" "polyadic addressee",
      P "NEU" "z",
      P "BEN" "t",
      P "DET" "d",
      P "gloss" "“you (pl.)”"
    ],
    L "ma" [
      P "description" "monadic animate 3rd party",
      P "NEU" "r",
      P "BEN" "p",
      P "DET" "b",
      P "gloss" "“he” / “she” / “they (sg.)”"
    ],
    L "pa" [
      P "description" "polyadic animate 3rd party",
      P "NEU" "ň",
      P "BEN" "k",
      P "DET" "g",
      P "gloss" "“they (pl.)”"
    ],
    L "mi" [
      P "description" "monadic inanimate 3rd party",
      P "NEU" "x",
      P "BEN" "ţ",
      P "DET" "ḑ",
      P "gloss" "“it”"
    ],
    L "pi" [
      P "description" "polyadic inanimate 3rd party",
      P "NEU" "ļ",
      P "BEN" "f",
      P "DET" "v",
      P "gloss" "“they (inanimate)”"
    ],
    L "Mx" [
      P "description" "mixed animate/inanimate 3rd party",
      P "NEU" "ř",
      P "BEN" "řř",
      P "DET" "ňň",
      P "gloss" "mixed animate+inanimate “s/he+it”, “they+those”, “it+they”, “those+s/he”, etc."
    ],
    L "Obv" [
      P "description" "Obviative/Resumptive",
      P "NEU" "c",
      P "BEN" "ss",
      P "DET" "zz",
      P "gloss" "3 rd -party other than most recently referenced (used with SWR affix)"
    ],
    L "IPa" [
      P "description" "impersonal animate",
      P "NEU" "č",
      P "BEN" "šš",
      P "DET" "žž",
      P "gloss" "“one” “you” “people” “a person” (French “on”; German “man”)"
    ],
    L "IPi" [
      P "description" "impersonal inanimate",
      P "NEU" "ļ",
      P "BEN" "ff",
      P "DET" "vv",
      P "gloss" "“something” “a thing” “things”"
    ],
    L "Col" [
      P "description" "Collective",
      P "NEU" "ż",
      P "BEN" "nn",
      P "DET" "mm",
      P "gloss" "NOMIC 3rd party"
    ],
    L "Abt" [
      P "description" "Abstract",
      P "NEU" "j",
      P "BEN" "rr",
      P "DET" "xx",
      P "gloss" "ABSTRACT 3rd party"
    ]
  ],
  L "Parsing Adjunct" [
    P "monosyllabic" "’a’",
    P "ultimate" "’e’",
    P "penultimate" "’o’",
    P "antepenultimate" "’u’",
    P "pre-antepenultimate" "’i’"
  ]]
