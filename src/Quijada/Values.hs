module Quijada.Values where

import Quijada.ProcVal

values = [
  KV "Cd" [
    KV "INC: ∅" [
      KV "MAIN" [
        KV "INF-PRC" "’",
        KV "INF-CPT" "h",
        KV "FML-PRC" "w",
        KV "FML-CPT" "y"
      ]
    ],
    KV "INC: INF-PRC" [
      KV "MAIN" [
        KV "INF-PRC" "hl",
        KV "INF-CPT" "hr",
        KV "FML-PRC" "hw",
        KV "FML-CPT" "hy"
      ]
    ],
    KV "INC: FML-PRC" [
      KV "MAIN" [
        KV "INF-PRC" "hll",
        KV "INF-CPT" "hrr",
        KV "FML-PRC" "hm",
        KV "FML-CPT" "hn"
      ]
    ],
    KV "INC: INF-CPT" [
      KV "MAIN" [
        KV "INF-PRC" "hlw",
        KV "INF-CPT" "hrw",
        KV "FML-PRC" "hmw",
        KV "FML-CPT" "hmy"
      ]
    ],
    KV "INC:FML-CPT" [
      KV "MAIN" [
        KV "INF-PRC" "hly",
        KV "INF-CPT" "hrr",
        KV "FML-PRC" "hnw",
        KV "FML-CPT" "hny"
      ]
    ]
  ],
  KV "Vr" [
    KV "STEM:0" [
      KV "STA" [
        KV "BSC" "aì",
        KV "CTE" "eì",
        KV "CSV" "oì",
        KV "OBJ" "öì",
        KV "INT" "ëì"
      ],
      KV "DYN" [
        KV "BSC" "aù",
        KV "CTE" "eù",
        KV "CSV" "où",
        KV "OBJ" "öù",
        KV "INT" "öù"
      ]
    ],
    KV "STEM:1" [
      KV "STA" [
        KV "BSC" "a",
        KV "CTE" "e",
        KV "CSV" "o",
        KV "OBJ" "u",
        KV "INT" "i"
      ],
      KV "DYN" [
        KV "BSC" "ai",
        KV "CTE" "ei",
        KV "CSV" "oi",
        KV "OBJ" "ui",
        KV "INT" "ëi"
      ]
    ],
    KV "STEM:2" [
      KV "STA" [
        KV "BSC" "ä",
        KV "CTE" "ë",
        KV "CSV" "ö",
        KV "OBJ" "ü",
        KV "INT" "ea"
      ],
      KV "DYN" [
        KV "BSC" "au",
        KV "CTE" "eu",
        KV "CSV" "ou",
        KV "OBJ" "iu",
        KV "INT" "ëu"
      ]
    ],
    KV "STEM:3" [
      KV "STA" [
        KV "BSC" "ao",
        KV "CTE" "eo",
        KV "CSV" "oa",
        KV "OBJ" "oe",
        KV "INT" "ae"
      ],
      KV "DYN" [
        KV "BSC" "ia/ua",
        KV "CTE" "ie/ue",
        KV "CSV" "io/uo",
        KV "OBJ" "iö/uö",
        KV "INT" "ië/uë"
      ]
    ]
  ],
  KV "Vx" [
    KV "TYPE:1" [
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
    KV "TYPE:2" [
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
    KV "TYPE:3" [
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
    KV "Ca:STACKING" [
      KV "MAIN" "uä",
      KV "INC" "uë"
    ]
  ],
  KV "Ca" [
    KV "AFFILIATION" [
      KV "CSL" "∅/l",
      KV "ASO" "tļ/l-",
      KV "VAR" "r",
      KV "COA" "ř"
    ],
    KV "CONFIGURATION" [
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
    KV "EXTENSION" [
      KV "DEL" "∅",
      KV "PRX" "s",
      KV "ICP" "z",
      KV "ATV" "ţ/f",
      KV "GRA" "š",
      KV "DPL" "ž"
    ],
    KV "PERSPECTIVE" [
      KV "M" "∅",
      KV "P" "t/m",
      KV "N" "k/m",
      KV "A" "p/m"
    ],
    KV "ESSENCE" [
      KV "NRM" "∅",
      KV "RPV" "gemination"
    ],
    KV "CONTEXT" [
      KV "EXS" "∅",
      KV "FNC" "l/ly",
      KV "RPS" "r/ry",
      KV "AMG" "w/řy"
    ]
  ],
  KV "Vn" [
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
  KV "Vp" [
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
  KV "Ve" [
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
  KV "Vl" [
    KV "relative" [
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
    KV "absolute" [
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
  KV "Vm1" [
    KV "null" "∅",
    KV "FAC" "a’",
    KV "SUB" "e’",
    KV "ASM" "i’",
    KV "SPC" "o’",
    KV "COU" "u’",
    KV "HYP" "ö’"
  ],
  KV "Vm2" [
    KV "null" "∅/ë",
    KV "FAC" "a",
    KV "SUB" "e",
    KV "ASM" "i",
    KV "SPC" "o",
    KV "COU" "u",
    KV "HYP" "ö"
  ],
  KV "Cm" [
    KV "null" "∅",
    KV "FAC" "h",
    KV "SUB" "hl",
    KV "ASM" "kn",
    KV "SPC" "ky",
    KV "COU" "tn",
    KV "HYP" "ty"
  ],
  KV "Vt1" [
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
  KV "Vt2" [
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
  KV "Cc" [
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
  KV "Vc" [
    KV "TRANSRELATIVE" [
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
    KV "APPOSITIVE" [
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
    KV "ASSOCIATIVE" [
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
    KV "ADVERBIAL" [
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
    KV "SPATIO-TEMPORAL I" [
      KV "LOC" "á",
      KV "ATD" "é",
      KV "ALL" "ó",
      KV "ABL" "ú",
      KV "ORI" "í",
      KV "IRL" "û",
      KV "INV" "ô",
      KV "NAV" "â"
    ],
    KV "SPATIO-TEMPORAL II" [
      KV "ASS" "ái",
      KV "CNR" "éi",
      KV "PER" "ói",
      KV "PRO" "úi",
      KV "PCV" "íu",
      KV "PCR" "óu",
      KV "ELP" "éu",
      KV "PLM" "áu"
    ],
    KV "RELATIONAL I" [
      KV "REF" "iá/aí",
      KV "COR" "ié/eí",
      KV "CPS" "ió/oí",
      KV "DEP" "iô/öí",
      KV "PRD" "uô/öú",
      KV "ESS" "uó/oú",
      KV "ASI" "ué/eú",
      KV "CFM" "uá/aú"
    ],
    KV "RELATIONAL II" [
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
  KV "Vk" [
    KV "CNF" [
      KV "PPS" [
        KV "antepenultimate" "a"
      ],
      KV "EPI" [
        KV "antepenultimate" "ai"
      ],
      KV "ALG" [
        KV "antepenultimate" "ia/aì"
      ],
      KV "IPU" [
        KV "antepenultimate" "ao"
      ],
      KV "RFU" [
        KV "pre-antepenultimate" "a",
        KV "penultimate" "a’a"
      ],
      KV "REB" [
        KV "pre-antepenultimate" "ai",
        KV "penultimate" "aya"
      ],
      KV "CJT" [
        KV "pre-antepenultimate" "ia/aì",
        KV "penultimate" "aye"
      ],
      KV "EXV" [
        KV "pre-antepenultimate" "ao",
        KV "penultimate" "ayo"
      ],
      KV "AXM" [
        KV "ultimate" "ayá"
      ],
      KV "∅" [
        KV "ultimate" "ayó"
      ]
    ],
    KV "INF" [
      KV "PPS" [
        KV "antepenultimate" "e"
      ],
      KV "EPI" [
        KV "antepenultimate" "ei"
      ],
      KV "ALG" [
        KV "antepenultimate" "ie/eì"
      ],
      KV "IPU" [
        KV "antepenultimate" "eo"
      ],
      KV "RFU" [
        KV "pre-antepenultimate" "e",
        KV "penultimate" "e’e"
      ],
      KV "REB" [
        KV "pre-antepenultimate" "ei",
        KV "penultimate" "eya"
      ],
      KV "CJT" [
        KV "pre-antepenultimate" "ie/eì",
        KV "penultimate" "eye"
      ],
      KV "EXV" [
        KV "pre-antepenultimate" "eo",
        KV "penultimate" "eyo"
      ],
      KV "AXM" [
        KV "ultimate" "eyá"
      ],
      KV "∅" [
        KV "ultimate" "eyó"
      ]
    ],
    KV "ITU" [
      KV "PPS" [
        KV "antepenultimate" "o"
      ],
      KV "EPI" [
        KV "antepenultimate" "oi"
      ],
      KV "ALG" [
        KV "antepenultimate" "io/oì"
      ],
      KV "IPU" [
        KV "antepenultimate" "oa"
      ],
      KV "RFU" [
        KV "pre-antepenultimate" "o",
        KV "penultimate" "o’o"
      ],
      KV "REB" [
        KV "pre-antepenultimate" "oi",
        KV "penultimate" "oya"
      ],
      KV "CJT" [
        KV "pre-antepenultimate" "io/oì",
        KV "penultimate" "oye"
      ],
      KV "EXV" [
        KV "pre-antepenultimate" "oa",
        KV "penultimate" "oyo"
      ],
      KV "AXM" [
        KV "ultimate" "oyá"
      ],
      KV "∅" [
        KV "ultimate" "oyó"
      ]
    ],
    KV "REV" [
      KV "PPS" [
        KV "antepenultimate" "u"
      ],
      KV "EPI" [
        KV "antepenultimate" "ui"
      ],
      KV "ALG" [
        KV "antepenultimate" "iö/öì"
      ],
      KV "IPU" [
        KV "antepenultimate" "oe"
      ],
      KV "RFU" [
        KV "pre-antepenultimate" "u",
        KV "penultimate" "u’u"
      ],
      KV "REB" [
        KV "pre-antepenultimate" "ui",
        KV "penultimate" "uya"
      ],
      KV "CJT" [
        KV "pre-antepenultimate" "iö/öì",
        KV "penultimate" "uye"
      ],
      KV "EXV" [
        KV "pre-antepenultimate" "oe",
        KV "penultimate" "uyo"
      ],
      KV "AXM" [
        KV "ultimate" "uyá"
      ],
      KV "∅" [
        KV "ultimate" "uyó"
      ]
    ],
    KV "HSY" [
      KV "PPS" [
        KV "antepenultimate" "i"
      ],
      KV "EPI" [
        KV "antepenultimate" "ëi"
      ],
      KV "ALG" [
        KV "antepenultimate" "ië/ëì"
      ],
      KV "IPU" [
        KV "antepenultimate" "ea"
      ],
      KV "RFU" [
        KV "pre-antepenultimate" "i",
        KV "penultimate" "i’i"
      ],
      KV "REB" [
        KV "pre-antepenultimate" "ëi",
        KV "penultimate" "ëya"
      ],
      KV "CJT" [
        KV "pre-antepenultimate" "ië/ëì",
        KV "penultimate" "ëye"
      ],
      KV "EXV" [
        KV "pre-antepenultimate" "ea",
        KV "penultimate" "ëyo"
      ],
      KV "AXM" [
        KV "ultimate" "ëyá"
      ],
      KV "∅" [
        KV "ultimate" "ëyó"
      ]
    ],
    KV "USP" [
      KV "PPS" [
        KV "antepenultimate" "ü"
      ],
      KV "EPI" [
        KV "antepenultimate" "iu"
      ],
      KV "ALG" [
        KV "antepenultimate" "uö/öù"
      ],
      KV "IPU" [
        KV "antepenultimate" "öe"
      ],
      KV "RFU" [
        KV "pre-antepenultimate" "ü",
        KV "penultimate" "ü’ü"
      ],
      KV "REB" [
        KV "pre-antepenultimate" "iu",
        KV "penultimate" "iwa"
      ],
      KV "CJT" [
        KV "pre-antepenultimate" "uö/öù",
        KV "penultimate" "iwe"
      ],
      KV "EXV" [
        KV "pre-antepenultimate" "öe",
        KV "penultimate" "iwo"
      ],
      KV "AXM" [
        KV "ultimate" "iwá"
      ],
      KV "∅" [
        KV "ultimate" "iwó"
      ]
    ],
    KV "DIR" [
      KV "PPS" [
        KV "antepenultimate" "ö"
      ],
      KV "EPI" [
        KV "antepenultimate" "ou"
      ],
      KV "ALG" [
        KV "antepenultimate" "uo/où"
      ],
      KV "IPU" [
        KV "antepenultimate" "öa"
      ],
      KV "RFU" [
        KV "pre-antepenultimate" "ö",
        KV "penultimate" "ö’ö"
      ],
      KV "REB" [
        KV "pre-antepenultimate" "ou",
        KV "penultimate" "owa"
      ],
      KV "CJT" [
        KV "pre-antepenultimate" "uo/où",
        KV "penultimate" "owe"
      ],
      KV "EXV" [
        KV "pre-antepenultimate" "öa",
        KV "penultimate" "owo"
      ],
      KV "AXM" [
        KV "ultimate" "owá"
      ],
      KV "∅" [
        KV "ultimate" "owó"
      ]
    ],
    KV "IRG" [
      KV "PPS" [
        KV "antepenultimate" "ë"
      ],
      KV "EPI" [
        KV "antepenultimate" "eu"
      ],
      KV "ALG" [
        KV "antepenultimate" "ue/eù"
      ],
      KV "IPU" [
        KV "antepenultimate" "eö"
      ],
      KV "RFU" [
        KV "pre-antepenultimate" "ë",
        KV "penultimate" "ë’ë"
      ],
      KV "REB" [
        KV "pre-antepenultimate" "eu",
        KV "penultimate" "ewa"
      ],
      KV "CJT" [
        KV "pre-antepenultimate" "ue/eù",
        KV "penultimate" "ewe"
      ],
      KV "EXV" [
        KV "pre-antepenultimate" "eö",
        KV "penultimate" "ewo"
      ],
      KV "AXM" [
        KV "ultimate" "ewá"
      ],
      KV "∅" [
        KV "ultimate" "ewó"
      ]
    ],
    KV "DEC" [
      KV "PPS" [
        KV "antepenultimate" "ä"
      ],
      KV "EPI" [
        KV "antepenultimate" "au"
      ],
      KV "ALG" [
        KV "antepenultimate" "ua/aù"
      ],
      KV "IPU" [
        KV "antepenultimate" "aö"
      ],
      KV "RFU" [
        KV "pre-antepenultimate" "ä",
        KV "penultimate" "ä’ä"
      ],
      KV "REB" [
        KV "pre-antepenultimate" "au",
        KV "penultimate" "awa"
      ],
      KV "CJT" [
        KV "pre-antepenultimate" "ua/aù",
        KV "penultimate" "awe"
      ],
      KV "EXV" [
        KV "pre-antepenultimate" "aö",
        KV "penultimate" "awo"
      ],
      KV "AXM" [
        KV "ultimate" "awá"
      ],
      KV "∅" [
        KV "ultimate" "awó"
      ]
    ]
  ],
  KV "Register Adjunct" [
    KV "DISCURSIVE" [
      KV "open" "hya",
      KV "end" "hyia"
    ],
    KV "PARENTHETICAL" [
      KV "open" "hye",
      KV "end" "hyie"
    ],
    KV "IMPRESSIONISTIC" [
      KV "open" "hyai",
      KV "end" "hyau"
    ],
    KV "COGITANT" [
      KV "open" "hyo",
      KV "end" "hyio"
    ],
    KV "EXEMPLIFICATIVE" [
      KV "open" "hyö",
      KV "end" "hyiö"
    ],
    KV "MATHS" [
      KV "open" "hyoi",
      KV "end" "hyou"
    ],
    KV "CARRIER" [
      KV "open" "∅",
      KV "end" "hyi"
    ]
  ],
  KV "Personal Reference Adjunct" [
    KV "1m" [
      KV "description" "monadic speaker",
      KV "NEU" "l",
      KV "BEN" "n",
      KV "DET" "m",
      KV "gloss" "“I”"
    ],
    KV "2m" [
      KV "description" "monadic addressee",
      KV "NEU" "s",
      KV "BEN" "š",
      KV "DET" "ž",
      KV "gloss" "“you (sg.)”"
    ],
    KV "2p" [
      KV "description" "polyadic addressee",
      KV "NEU" "z",
      KV "BEN" "t",
      KV "DET" "d",
      KV "gloss" "“you (pl.)”"
    ],
    KV "ma" [
      KV "description" "monadic animate 3rd party",
      KV "NEU" "r",
      KV "BEN" "p",
      KV "DET" "b",
      KV "gloss" "“he” / “she” / “they (sg.)”"
    ],
    KV "pa" [
      KV "description" "polyadic animate 3rd party",
      KV "NEU" "ň",
      KV "BEN" "k",
      KV "DET" "g",
      KV "gloss" "“they (pl.)”"
    ],
    KV "mi" [
      KV "description" "monadic inanimate 3rd party",
      KV "NEU" "x",
      KV "BEN" "ţ",
      KV "DET" "ḑ",
      KV "gloss" "“it”"
    ],
    KV "pi" [
      KV "description" "polyadic inanimate 3rd party",
      KV "NEU" "ļ",
      KV "BEN" "f",
      KV "DET" "v",
      KV "gloss" "“they (inanimate)”"
    ],
    KV "Mx" [
      KV "description" "mixed animate/inanimate 3rd party",
      KV "NEU" "ř",
      KV "BEN" "řř",
      KV "DET" "ňň",
      KV "gloss" "mixed animate+inanimate “s/he+it”, “they+those”, “it+they”, “those+s/he”, etc."
    ],
    KV "Obv" [
      KV "description" "Obviative/Resumptive",
      KV "NEU" "c",
      KV "BEN" "ss",
      KV "DET" "zz",
      KV "gloss" "3 rd -party other than most recently referenced (used with SWR affix)"
    ],
    KV "IPa" [
      KV "description" "impersonal animate",
      KV "NEU" "č",
      KV "BEN" "šš",
      KV "DET" "žž",
      KV "gloss" "“one” “you” “people” “a person” (French “on”; German “man”)"
    ],
    KV "IPi" [
      KV "description" "impersonal inanimate",
      KV "NEU" "ļ",
      KV "BEN" "ff",
      KV "DET" "vv",
      KV "gloss" "“something” “a thing” “things”"
    ],
    KV "Col" [
      KV "description" "Collective",
      KV "NEU" "ż",
      KV "BEN" "nn",
      KV "DET" "mm",
      KV "gloss" "NOMIC 3rd party"
    ],
    KV "Abt" [
      KV "description" "Abstract",
      KV "NEU" "j",
      KV "BEN" "rr",
      KV "DET" "xx",
      KV "gloss" "ABSTRACT 3rd party"
    ]
  ],
  KV "Parsing Adjunct" [
    KV "monosyllabic" "’a’",
    KV "ultimate" "’e’",
    KV "penultimate" "’o’",
    KV "antepenultimate" "’u’",
    KV "pre-antepenultimate" "’i’"
  ]]
