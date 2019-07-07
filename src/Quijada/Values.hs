module Quijada.Values where

data Values = KLL String [[Values]] | KL String [Values] | KV String String deriving (Show)

values = [
  KLL "Cd" [
    [
      KV "INC" "∅",
      KL "MAIN" [
        KV "INF-PRC" "’",
        KV "INF-CPT" "h",
        KV "FML-PRC" "w",
        KV "FML-CPT" "y"
      ]
    ],
    [
      KV "INC" "INF-PRC",
      KL "MAIN" [
        KV "INF-PRC" "hl",
        KV "INF-CPT" "hr",
        KV "FML-PRC" "hw",
        KV "FML-CPT" "hy"
      ]
    ],
    [
      KV "INC" "FML-PRC",
      KL "MAIN" [
        KV "INF-PRC" "hll",
        KV "INF-CPT" "hrr",
        KV "FML-PRC" "hm",
        KV "FML-CPT" "hn"
      ]
    ],
    [
      KV "INC" "INF-CPT",
      KL "MAIN" [
        KV "INF-PRC" "hlw",
        KV "INF-CPT" "hrw",
        KV "FML-PRC" "hmw",
        KV "FML-CPT" "hmy"
      ]
    ],
    [
      KV "INC" "FML-CPT",
      KL "MAIN" [
        KV "INF-PRC" "hly",
        KV "INF-CPT" "hrr",
        KV "FML-PRC" "hnw",
        KV "FML-CPT" "hny"
      ]
    ]
  ],
  KLL "Vr" [
    [
      KL "STA" [
        KV "BSC" "aì",
        KV "CTE" "eì",
        KV "CSV" "oì",
        KV "OBJ" "öì",
        KV "INT" "ëì"
      ],
      KL "DYN" [
        KV "BSC" "aù",
        KV "CTE" "eù",
        KV "CSV" "où",
        KV "OBJ" "öù",
        KV "INT" "öù"
      ]
    ],
    [
      KL "STA" [
        KV "BSC" "a",
        KV "CTE" "e",
        KV "CSV" "o",
        KV "OBJ" "u",
        KV "INT" "i"
      ],
      KL "DYN" [
        KV "BSC" "ai",
        KV "CTE" "ei",
        KV "CSV" "oi",
        KV "OBJ" "ui",
        KV "INT" "ëi"
      ]
    ],
    [
      KL "STA" [
        KV "BSC" "ä",
        KV "CTE" "ë",
        KV "CSV" "ö",
        KV "OBJ" "ü",
        KV "INT" "ea"
      ],
      KL "DYN" [
        KV "BSC" "au",
        KV "CTE" "eu",
        KV "CSV" "ou",
        KV "OBJ" "iu",
        KV "INT" "ëu"
      ]
    ],
    [
      KL "STA" [
        KV "BSC" "ao",
        KV "CTE" "eo",
        KV "CSV" "oa",
        KV "OBJ" "oe",
        KV "INT" "ae"
      ],
      KL "DYN" [
        KV "BSC" "ia/ua",
        KV "CTE" "ie/ue",
        KV "CSV" "io/uo",
        KV "OBJ" "iö/uö",
        KV "INT" "ië/uë"
      ]
    ]
  ],
  KL "Vx" [
    KL "TYPE 1" [
      KV "0" "ae",
      KV "1" "a",
      KV "2" "e",
      KV "3" "o",
      KV "4" "u",
      KV "5" "i",
      KV "6" "ü",
      KV "7" "ö",
      KV "8" "ë",
      KV "9" "ä"
    ],
    KL "TYPE 2" [
      KV "0" "ëu",
      KV "1" "ai",
      KV "2" "ei",
      KV "3" "oi",
      KV "4" "ui",
      KV "5" "ëi",
      KV "6" "iu",
      KV "7" "ou",
      KV "8" "eu",
      KV "9" "au"
    ],
    KL "TYPE 3" [
      KV "0" "uë/ëù",
      KV "1" "ia/aì",
      KV "2" "ie/eì",
      KV "3" "io/oì",
      KV "4" "iö/öì",
      KV "5" "ië/ëì",
      KV "6" "uö/öù",
      KV "7" "uo/où",
      KV "8" "ue/eù",
      KV "9" "ua/aù"
    ],
    KL "Ca STACKING" [
      KV "MAIN" "uä",
      KV "INC" "uë"
    ]
  ],
  KL "Ca" [
    KL "AFFILIATION" [
      KV "CSL" "∅/l",
      KV "ASO" "tļ/l-",
      KV "VAR" "r",
      KV "COA" "ř"
    ],
    KL "CONFIGURATION" [
      KV "UNI" "∅",
      KV "DPX" "ň/nt",
      KV "DCT" "f/v",
      KV "AGG" "ţ/ḑ",
      KV "SEG" "m",
      KV "CPN" "n/nk",
      KV "COH" "t/d",
      KV "CST" "k/g",
      KV "MLT" "p/b"
    ],
    KL "EXTENSION" [
      KV "DEL" "∅",
      KV "PRX" "s",
      KV "ICP" "z",
      KV "ATV" "ţ/f",
      KV "GRA" "š",
      KV "DPL" "ž"
    ],
    KL "PERSPECTIVE" [
      KV "M" "∅",
      KV "P" "t/m",
      KV "N" "k/m",
      KV "A" "p/m"
    ],
    KL "ESSENCE" [
      KV "NRM" "∅",
      KV "RPV" "gemination"
    ],
    KL "CONTEXT" [
      KV "EXS" "∅",
      KV "FNC" "l/ly",
      KV "RPS" "r/ry",
      KV "AMG" "w/řy"
    ]
  ],
  KL "Vn" [
    KV "MNO" "∅/A",
    KV "PRL" "e",
    KV "CRO" "o",
    KV "RCP" "u",
    KV "CPL" "i",
    KV "DUP" "ü",
    KV "DEM" "ö",
    KV "IMT" "ë",
    KV "CNG" "ä",
    KV "PTI" "ao",
    KV "IDC" "eo",
    KV "MUT" "oa"
  ],
  KL "Vp" [
    KV "CTX" "wai",
    KV "PCT" "wei",
    KV "ITR" "woi",
    KV "REP" "wui",
    KV "ITM" "wëi",
    KV "RCT" "wiu",
    KV "FRE" "wou",
    KV "FRG" "weu",
    KV "FLC" "wau"
  ],
  KL "Ve" [
    KV "neutral" "∅",
    KV "1/BEN" "yai",
    KV "2/BEN" "yei",
    KV "3/BEN" "yoi",
    KV "all/BEN" "yui",
    KV "unknown" "yëu",
    KV "all/DET" "yiu",
    KV "3/DET" "you",
    KV "2/DET" "yeu",
    KV "1/DET" "yau"
  ],
  KL "Vl" [
    KL "relative" [
      KV "none" "∅",
      KV "MIN" "wao",
      KV "IFR" "wea",
      KV "SBE" "woa",
      KV "DFC" "woe",
      KV "EQU" "wea",
      KV "SUR" "wöe",
      KV "SPL" "wöa",
      KV "SPQ" "weö",
      KV "MAX" "waö"
    ],
    KL "absolute" [
      KV "none" "∅",
      KV "MIN" "yao",
      KV "IFR" "yea",
      KV "SBE" "yoa",
      KV "DFC" "yoe",
      KV "EQU" "yea",
      KV "SUR" "yöe",
      KV "SPL" "yöa",
      KV "SPQ" "yeö",
      KV "MAX" "yaö"
    ]
  ],
  KL "Vm1" [
    KV "null" "∅",
    KV "FAC" "a’",
    KV "SUB" "e’",
    KV "ASM" "i’",
    KV "SPC" "o’",
    KV "COU" "u’",
    KV "HYP" "ö’"
  ],
  KL "Vm2" [
    KV "null" "∅/ë",
    KV "FAC" "a",
    KV "SUB" "e",
    KV "ASM" "i",
    KV "SPC" "o",
    KV "COU" "u",
    KV "HYP" "ö"
  ],
  KL "Cm" [
    KV "null" "∅",
    KV "FAC" "h",
    KV "SUB" "hl",
    KV "ASM" "kn",
    KV "SPC" "ky",
    KV "COU" "tn",
    KV "HYP" "ty"
  ],
  KL "Vt1" [
    KV "RTR" "ai",
    KV "PRS" "ei",
    KV "HAB" "oi",
    KV "PRG" "ui",
    KV "IMM" "ëi",
    KV "PCS" "iu",
    KV "REG" "ou",
    KV "ATC" "eu",
    KV "ATP" "au",
    KV "RSM" "ah",
    KV "CSS" "eh",
    KV "PAU" "oh",
    KV "RGR" "uh",
    KV "PCL" "ih",
    KV "CNT" "üh",
    KV "ICS" "öh",
    KV "SMM" "ëh",
    KV "IRP" "äh",
    KV "PMP" "aih",
    KV "CLM" "eih",
    KV "DLT" "oih",
    KV "TMP" "uih",
    KV "MTV" "ëih",
    KV "SQN" "iuh",
    KV "EPD" "ouh",
    KV "PTC" "euh",
    KV "PPR" "auh",
    KV "DCL" "a’h",
    KV "CCL" "e’h",
    KV "CUL" "o’h",
    KV "IMD" "u’h",
    KV "TRD" "i’h",
    KV "TNS" "ü’h",
    KV "ITC" "ö’h",
    KV "XPD" "ë’h",
    KV "LIM" "ä’h"
  ],
  KL "Vt2" [
    KV "RTR" "wa",
    KV "PRS" "we",
    KV "HAB" "wo",
    KV "PRG" "wu",
    KV "IMM" "wi",
    KV "PCS" "wü",
    KV "REG" "wö",
    KV "ATC" "wë",
    KV "ATP" "wä",
    KV "RSM" "ya",
    KV "CSS" "ye",
    KV "PAU" "yo",
    KV "RGR" "yu",
    KV "PCL" "yi",
    KV "CNT" "yü",
    KV "ICS" "yö",
    KV "SMM" "yë",
    KV "IRP" "yä",
    KV "PMP" "ai",
    KV "CLM" "ei",
    KV "DLT" "oi",
    KV "TMP" "ui",
    KV "MTV" "ëi",
    KV "SQN" "iu",
    KV "EPD" "ou",
    KV "PTC" "eu",
    KV "PPR" "au",
    KV "DCL" "ao",
    KV "CCL" "eo",
    KV "CUL" "oa",
    KV "IMD" "oe",
    KV "TRD" "ea",
    KV "TNS" "öe",
    KV "ITC" "öa",
    KV "XPD" "eö",
    KV "LIM" "aö"
  ],
  KL "Cc" [
    KV "CCO" "r",
    KV "CCw" "w/y",
    KV "CCn" "n",
    KV "CCs" "s",
    KV "CCm" "m",
    KV "CCp" "p",
    KV "CCt" "t",
    KV "CCk" "k",
    KV "CCz" "š",
    KV "CCg" "ň"
  ],
  KL "Vc" [
    KL "TRANSRELATIVE" [
      KV "THM" "a",
      KV "ABS" "e",
      KV "ERG" "o",
      KV "IND" "u",
      KV "AFF" "i",
      KV "DAT" "ü",
      KV "EFF" "ö",
      KV "STM" "ë",
      KV "INS" "ä"
    ],
    KL "APPOSITIVE" [
      KV "POS" "ai",
      KV "PRP" "ei",
      KV "GEN" "oi",
      KV "ATT" "ui",
      KV "PDC" "ëi",
      KV "ITP" "iu",
      KV "OGN" "ou",
      KV "IDP" "eu",
      KV "PAR" "au"
    ],
    KL "ASSOCIATIVE" [
      KV "APL" "ia/aì",
      KV "PUR" "ie/eì",
      KV "TRA" "io/oì",
      KV "DFR" "iö/öì",
      KV "CRS" "ië/ëì",
      KV "TSP" "uö/öù",
      KV "CMM" "uo/où",
      KV "CMP" "ue/eù",
      KV "CSD" "ua/aù"
    ],
    KL "ADVERBIAL" [
      KV "CON" "ao",
      KV "AVR" "eo",
      KV "CVS" "oa",
      KV "SIT" "oe",
      KV "FUN" "ea",
      KV "TFM" "öe",
      KV "CLA" "öa",
      KV "CSM" "eö",
      KV "RSL" "aö"
    ],
    KL "SPATIO-TEMPORAL I" [
      KV "LOC" "á",
      KV "ATD" "é",
      KV "ALL" "ó",
      KV "ABL" "ú",
      KV "ORI" "í",
      KV "IRL" "û",
      KV "INV" "ô",
      KV "NAV" "â"
    ],
    KL "SPATIO-TEMPORAL II" [
      KV "ASS" "ái",
      KV "CNR" "éi",
      KV "PER" "ói",
      KV "PRO" "úi",
      KV "PCV" "íu",
      KV "PCR" "óu",
      KV "ELP" "éu",
      KV "PLM" "áu"
    ],
    KL "RELATIONAL I" [
      KV "REF" "iá/aí",
      KV "COR" "ié/eí",
      KV "CPS" "ió/oí",
      KV "DEP" "iô/öí",
      KV "PRD" "uô/öú",
      KV "ESS" "uó/oú",
      KV "ASI" "ué/eú",
      KV "CFM" "uá/aú"
    ],
    KL "RELATIONAL II" [
      KV "ACT" "aó",
      KV "SEL" "eó",
      KV "COM" "oá",
      KV "UTL" "oé",
      KV "DSC" "eá",
      KV "RLT" "ae",
      KV "TRM" "aé",
      KV "VOC" "ëu"
    ]
  ],
  KL "Vk" [
    KL "CNF" [
      KL "PPS" [
        KV "antepenultimate" "a"
      ],
      KL "EPI" [
        KV "antepenultimate" "ai"
      ],
      KL "ALG" [
        KV "antepenultimate" "ia/aì"
      ],
      KL "IPU" [
        KV "antepenultimate" "ao"
      ],
      KL "RFU" [
        KV "pre-antepenultimate" "a",
        KV "penultimate" "a’a"
      ],
      KL "REB" [
        KV "pre-antepenultimate" "ai",
        KV "penultimate" "aya"
      ],
      KL "CJT" [
        KV "pre-antepenultimate" "ia/aì",
        KV "penultimate" "aye"
      ],
      KL "EXV" [
        KV "pre-antepenultimate" "ao",
        KV "penultimate" "ayo"
      ],
      KL "AXM" [
        KV "ultimate" "ayá"
      ],
      KL "∅" [
        KV "ultimate" "ayó"
      ]
    ],
    KL "INF" [
      KL "PPS" [
        KV "antepenultimate" "e"
      ],
      KL "EPI" [
        KV "antepenultimate" "ei"
      ],
      KL "ALG" [
        KV "antepenultimate" "ie/eì"
      ],
      KL "IPU" [
        KV "antepenultimate" "eo"
      ],
      KL "RFU" [
        KV "pre-antepenultimate" "e",
        KV "penultimate" "e’e"
      ],
      KL "REB" [
        KV "pre-antepenultimate" "ei",
        KV "penultimate" "eya"
      ],
      KL "CJT" [
        KV "pre-antepenultimate" "ie/eì",
        KV "penultimate" "eye"
      ],
      KL "EXV" [
        KV "pre-antepenultimate" "eo",
        KV "penultimate" "eyo"
      ],
      KL "AXM" [
        KV "ultimate" "eyá"
      ],
      KL "∅" [
        KV "ultimate" "eyó"
      ]
    ],
    KL "ITU" [
      KL "PPS" [
        KV "antepenultimate" "o"
      ],
      KL "EPI" [
        KV "antepenultimate" "oi"
      ],
      KL "ALG" [
        KV "antepenultimate" "io/oì"
      ],
      KL "IPU" [
        KV "antepenultimate" "oa"
      ],
      KL "RFU" [
        KV "pre-antepenultimate" "o",
        KV "penultimate" "o’o"
      ],
      KL "REB" [
        KV "pre-antepenultimate" "oi",
        KV "penultimate" "oya"
      ],
      KL "CJT" [
        KV "pre-antepenultimate" "io/oì",
        KV "penultimate" "oye"
      ],
      KL "EXV" [
        KV "pre-antepenultimate" "oa",
        KV "penultimate" "oyo"
      ],
      KL "AXM" [
        KV "ultimate" "oyá"
      ],
      KL "∅" [
        KV "ultimate" "oyó"
      ]
    ],
    KL "REV" [
      KL "PPS" [
        KV "antepenultimate" "u"
      ],
      KL "EPI" [
        KV "antepenultimate" "ui"
      ],
      KL "ALG" [
        KV "antepenultimate" "iö/öì"
      ],
      KL "IPU" [
        KV "antepenultimate" "oe"
      ],
      KL "RFU" [
        KV "pre-antepenultimate" "u",
        KV "penultimate" "u’u"
      ],
      KL "REB" [
        KV "pre-antepenultimate" "ui",
        KV "penultimate" "uya"
      ],
      KL "CJT" [
        KV "pre-antepenultimate" "iö/öì",
        KV "penultimate" "uye"
      ],
      KL "EXV" [
        KV "pre-antepenultimate" "oe",
        KV "penultimate" "uyo"
      ],
      KL "AXM" [
        KV "ultimate" "uyá"
      ],
      KL "∅" [
        KV "ultimate" "uyó"
      ]
    ],
    KL "HSY" [
      KL "PPS" [
        KV "antepenultimate" "i"
      ],
      KL "EPI" [
        KV "antepenultimate" "ëi"
      ],
      KL "ALG" [
        KV "antepenultimate" "ië/ëì"
      ],
      KL "IPU" [
        KV "antepenultimate" "ea"
      ],
      KL "RFU" [
        KV "pre-antepenultimate" "i",
        KV "penultimate" "i’i"
      ],
      KL "REB" [
        KV "pre-antepenultimate" "ëi",
        KV "penultimate" "ëya"
      ],
      KL "CJT" [
        KV "pre-antepenultimate" "ië/ëì",
        KV "penultimate" "ëye"
      ],
      KL "EXV" [
        KV "pre-antepenultimate" "ea",
        KV "penultimate" "ëyo"
      ],
      KL "AXM" [
        KV "ultimate" "ëyá"
      ],
      KL "∅" [
        KV "ultimate" "ëyó"
      ]
    ],
    KL "USP" [
      KL "PPS" [
        KV "antepenultimate" "ü"
      ],
      KL "EPI" [
        KV "antepenultimate" "iu"
      ],
      KL "ALG" [
        KV "antepenultimate" "uö/öù"
      ],
      KL "IPU" [
        KV "antepenultimate" "öe"
      ],
      KL "RFU" [
        KV "pre-antepenultimate" "ü",
        KV "penultimate" "ü’ü"
      ],
      KL "REB" [
        KV "pre-antepenultimate" "iu",
        KV "penultimate" "iwa"
      ],
      KL "CJT" [
        KV "pre-antepenultimate" "uö/öù",
        KV "penultimate" "iwe"
      ],
      KL "EXV" [
        KV "pre-antepenultimate" "öe",
        KV "penultimate" "iwo"
      ],
      KL "AXM" [
        KV "ultimate" "iwá"
      ],
      KL "∅" [
        KV "ultimate" "iwó"
      ]
    ],
    KL "DIR" [
      KL "PPS" [
        KV "antepenultimate" "ö"
      ],
      KL "EPI" [
        KV "antepenultimate" "ou"
      ],
      KL "ALG" [
        KV "antepenultimate" "uo/où"
      ],
      KL "IPU" [
        KV "antepenultimate" "öa"
      ],
      KL "RFU" [
        KV "pre-antepenultimate" "ö",
        KV "penultimate" "ö’ö"
      ],
      KL "REB" [
        KV "pre-antepenultimate" "ou",
        KV "penultimate" "owa"
      ],
      KL "CJT" [
        KV "pre-antepenultimate" "uo/où",
        KV "penultimate" "owe"
      ],
      KL "EXV" [
        KV "pre-antepenultimate" "öa",
        KV "penultimate" "owo"
      ],
      KL "AXM" [
        KV "ultimate" "owá"
      ],
      KL "∅" [
        KV "ultimate" "owó"
      ]
    ],
    KL "IRG" [
      KL "PPS" [
        KV "antepenultimate" "ë"
      ],
      KL "EPI" [
        KV "antepenultimate" "eu"
      ],
      KL "ALG" [
        KV "antepenultimate" "ue/eù"
      ],
      KL "IPU" [
        KV "antepenultimate" "eö"
      ],
      KL "RFU" [
        KV "pre-antepenultimate" "ë",
        KV "penultimate" "ë’ë"
      ],
      KL "REB" [
        KV "pre-antepenultimate" "eu",
        KV "penultimate" "ewa"
      ],
      KL "CJT" [
        KV "pre-antepenultimate" "ue/eù",
        KV "penultimate" "ewe"
      ],
      KL "EXV" [
        KV "pre-antepenultimate" "eö",
        KV "penultimate" "ewo"
      ],
      KL "AXM" [
        KV "ultimate" "ewá"
      ],
      KL "∅" [
        KV "ultimate" "ewó"
      ]
    ],
    KL "DEC" [
      KL "PPS" [
        KV "antepenultimate" "ä"
      ],
      KL "EPI" [
        KV "antepenultimate" "au"
      ],
      KL "ALG" [
        KV "antepenultimate" "ua/aù"
      ],
      KL "IPU" [
        KV "antepenultimate" "aö"
      ],
      KL "RFU" [
        KV "pre-antepenultimate" "ä",
        KV "penultimate" "ä’ä"
      ],
      KL "REB" [
        KV "pre-antepenultimate" "au",
        KV "penultimate" "awa"
      ],
      KL "CJT" [
        KV "pre-antepenultimate" "ua/aù",
        KV "penultimate" "awe"
      ],
      KL "EXV" [
        KV "pre-antepenultimate" "aö",
        KV "penultimate" "awo"
      ],
      KL "AXM" [
        KV "ultimate" "awá"
      ],
      KL "∅" [
        KV "ultimate" "awó"
      ]
    ]
  ],
  KL "Register Adjunct" [
    KL "DISCURSIVE" [
      KV "open" "hya",
      KV "end" "hyia"
    ],
    KL "PARENTHETICAL" [
      KV "open" "hye",
      KV "end" "hyie"
    ],
    KL "IMPRESSIONISTIC" [
      KV "open" "hyai",
      KV "end" "hyau"
    ],
    KL "COGITANT" [
      KV "open" "hyo",
      KV "end" "hyio"
    ],
    KL "EXEMPLIFICATIVE" [
      KV "open" "hyö",
      KV "end" "hyiö"
    ],
    KL "MATHS" [
      KV "open" "hyoi",
      KV "end" "hyou"
    ],
    KL "CARRIER" [
      KV "open" "∅",
      KV "end" "hyi"
    ]
  ],
  KL "Personal Reference Adjunct" [
    KL "1m" [
      KV "description" "monadic speaker",
      KV "NEU" "l",
      KV "BEN" "n",
      KV "DET" "m",
      KV "gloss" "“I”"
    ],
    KL "2m" [
      KV "description" "monadic addressee",
      KV "NEU" "s",
      KV "BEN" "š",
      KV "DET" "ž",
      KV "gloss" "“you (sg.)”"
    ],
    KL "2p" [
      KV "description" "polyadic addressee",
      KV "NEU" "z",
      KV "BEN" "t",
      KV "DET" "d",
      KV "gloss" "“you (pl.)”"
    ],
    KL "ma" [
      KV "description" "monadic animate 3rd party",
      KV "NEU" "r",
      KV "BEN" "p",
      KV "DET" "b",
      KV "gloss" "“he” / “she” / “they (sg.)”"
    ],
    KL "pa" [
      KV "description" "polyadic animate 3rd party",
      KV "NEU" "ň",
      KV "BEN" "k",
      KV "DET" "g",
      KV "gloss" "“they (pl.)”"
    ],
    KL "mi" [
      KV "description" "monadic inanimate 3rd party",
      KV "NEU" "x",
      KV "BEN" "ţ",
      KV "DET" "ḑ",
      KV "gloss" "“it”"
    ],
    KL "pi" [
      KV "description" "polyadic inanimate 3rd party",
      KV "NEU" "ļ",
      KV "BEN" "f",
      KV "DET" "v",
      KV "gloss" "“they (inanimate)”"
    ],
    KL "Mx" [
      KV "description" "mixed animate/inanimate 3rd party",
      KV "NEU" "ř",
      KV "BEN" "řř",
      KV "DET" "ňň",
      KV "gloss" "mixed animate+inanimate “s/he+it”, “they+those”, “it+they”, “those+s/he”, etc."
    ],
    KL "Obv" [
      KV "description" "Obviative/Resumptive",
      KV "NEU" "c",
      KV "BEN" "ss",
      KV "DET" "zz",
      KV "gloss" "3 rd -party other than most recently referenced (used with SWR affix)"
    ],
    KL "IPa" [
      KV "description" "impersonal animate",
      KV "NEU" "č",
      KV "BEN" "šš",
      KV "DET" "žž",
      KV "gloss" "“one” “you” “people” “a person” (French “on”; German “man”)"
    ],
    KL "IPi" [
      KV "description" "impersonal inanimate",
      KV "NEU" "ļ",
      KV "BEN" "ff",
      KV "DET" "vv",
      KV "gloss" "“something” “a thing” “things”"
    ],
    KL "Col" [
      KV "description" "Collective",
      KV "NEU" "ż",
      KV "BEN" "nn",
      KV "DET" "mm",
      KV "gloss" "NOMIC 3rd party"
    ],
    KL "Abt" [
      KV "description" "Abstract",
      KV "NEU" "j",
      KV "BEN" "rr",
      KV "DET" "xx",
      KV "gloss" "ABSTRACT 3rd party"
    ]
  ],
  KL "Parsing Adjunct" [
    KV "monosyllabic" "’a’",
    KV "ultimate" "’e’",
    KV "penultimate" "’o’",
    KV "antepenultimate" "’u’",
    KV "pre-antepenultimate" "’i’"
  ]]
