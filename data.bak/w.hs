data Values = KLL String [[Values]] | KL String [Values] | KV String String deriving (Show)
values = {
  "Cd": [
    {
      "INC": "∅",
      "MAIN": {
        "INF-PRC": "’",
        "INF-CPT": "h",
        "FML-PRC": "w",
        "FML-CPT": "y"
      }
    },
    {
      "INC": "INF-PRC",
      "MAIN": {
        "INF-PRC": "hl",
        "INF-CPT": "hr",
        "FML-PRC": "hw",
        "FML-CPT": "hy"
      }
    },
    {
      "INC": "FML-PRC",
      "MAIN": {
        "INF-PRC": "hll",
        "INF-CPT": "hrr",
        "FML-PRC": "hm",
        "FML-CPT": "hn"
      }
    },
    {
      "INC": "INF-CPT",
      "MAIN": {
        "INF-PRC": "hlw",
        "INF-CPT": "hrw",
        "FML-PRC": "hmw",
        "FML-CPT": "hmy"
      }
    },
    {
      "INC": "FML-CPT",
      "MAIN": {
        "INF-PRC": "hly",
        "INF-CPT": "hrr",
        "FML-PRC": "hnw",
        "FML-CPT": "hny"
      }
    }
  ],
  "Vr": [
    {
      "STA": {
        "BSC": "aì",
        "CTE": "eì",
        "CSV": "oì",
        "OBJ": "öì",
        "INT": "ëì"
      },
      "DYN": {
        "BSC": "aù",
        "CTE": "eù",
        "CSV": "où",
        "OBJ": "öù",
        "INT": "öù"
      }
    },
    {
      "STA": {
        "BSC": "a",
        "CTE": "e",
        "CSV": "o",
        "OBJ": "u",
        "INT": "i"
      },
      "DYN": {
        "BSC": "ai",
        "CTE": "ei",
        "CSV": "oi",
        "OBJ": "ui",
        "INT": "ëi"
      }
    },
    {
      "STA": {
        "BSC": "ä",
        "CTE": "ë",
        "CSV": "ö",
        "OBJ": "ü",
        "INT": "ea"
      },
      "DYN": {
        "BSC": "au",
        "CTE": "eu",
        "CSV": "ou",
        "OBJ": "iu",
        "INT": "ëu"
      }
    },
    {
      "STA": {
        "BSC": "ao",
        "CTE": "eo",
        "CSV": "oa",
        "OBJ": "oe",
        "INT": "ae"
      },
      "DYN": {
        "BSC": "ia/ua",
        "CTE": "ie/ue",
        "CSV": "io/uo",
        "OBJ": "iö/uö",
        "INT": "ië/uë"
      }
    }
  ],
  "Vx": {
    "TYPE 1": {
      "0": "ae",
      "1": "a",
      "2": "e",
      "3": "o",
      "4": "u",
      "5": "i",
      "6": "ü",
      "7": "ö",
      "8": "ë",
      "9": "ä"
    },
    "TYPE 2": {
      "0": "ëu",
      "1": "ai",
      "2": "ei",
      "3": "oi",
      "4": "ui",
      "5": "ëi",
      "6": "iu",
      "7": "ou",
      "8": "eu",
      "9": "au"
    },
    "TYPE 3": {
      "0": "uë/ëù",
      "1": "ia/aì",
      "2": "ie/eì",
      "3": "io/oì",
      "4": "iö/öì",
      "5": "ië/ëì",
      "6": "uö/öù",
      "7": "uo/où",
      "8": "ue/eù",
      "9": "ua/aù"
    },
    "Ca STACKING": {
      "MAIN": "uä",
      "INC": "uë"
    }
  },
  "Ca": {
    "AFFILIATION": {
      "CSL": "∅/l",
      "ASO": "tļ/l-",
      "VAR": "r",
      "COA": "ř"
    },
    "CONFIGURATION": {
      "UNI": "∅",
      "DPX": "ň/nt",
      "DCT": "f/v",
      "AGG": "ţ/ḑ",
      "SEG": "m",
      "CPN": "n/nk",
      "COH": "t/d",
      "CST": "k/g",
      "MLT": "p/b"
    },
    "EXTENSION": {
      "DEL": "∅",
      "PRX": "s",
      "ICP": "z",
      "ATV": "ţ/f",
      "GRA": "š",
      "DPL": "ž"
    },
    "PERSPECTIVE": {
      "M": "∅",
      "P": "t/m",
      "N": "k/m",
      "A": "p/m"
    },
    "ESSENCE": {
      "NRM": "∅",
      "RPV": "gemination"
    },
    "CONTEXT": {
      "EXS": "∅",
      "FNC": "l/ly",
      "RPS": "r/ry",
      "AMG": "w/řy"
    }
  },
  "Vn": {
    "MNO": "∅/A",
    "PRL": "e",
    "CRO": "o",
    "RCP": "u",
    "CPL": "i",
    "DUP": "ü",
    "DEM": "ö",
    "IMT": "ë",
    "CNG": "ä",
    "PTI": "ao",
    "IDC": "eo",
    "MUT": "oa"
  },
  "Vp": {
    "CTX": "wai",
    "PCT": "wei",
    "ITR": "woi",
    "REP": "wui",
    "ITM": "wëi",
    "RCT": "wiu",
    "FRE": "wou",
    "FRG": "weu",
    "FLC": "wau"
  },
  "Ve": {
    "neutral": "∅",
    "1/BEN": "yai",
    "2/BEN": "yei",
    "3/BEN": "yoi",
    "all/BEN": "yui",
    "unknown": "yëu",
    "all/DET": "yiu",
    "3/DET": "you",
    "2/DET": "yeu",
    "1/DET": "yau"
  },
  "Vl": {
    "relative": {
      "none": "∅",
      "MIN": "wao",
      "IFR": "wea",
      "SBE": "woa",
      "DFC": "woe",
      "EQU": "wea",
      "SUR": "wöe",
      "SPL": "wöa",
      "SPQ": "weö",
      "MAX": "waö"
    },
    "absolute": {
      "none": "∅",
      "MIN": "yao",
      "IFR": "yea",
      "SBE": "yoa",
      "DFC": "yoe",
      "EQU": "yea",
      "SUR": "yöe",
      "SPL": "yöa",
      "SPQ": "yeö",
      "MAX": "yaö"
    }
  },
  "Vm1": {
    "null": "∅",
    "FAC": "a’",
    "SUB": "e’",
    "ASM": "i’",
    "SPC": "o’",
    "COU": "u’",
    "HYP": "ö’"
  },
  "Vm2": {
    "null": "∅/ë",
    "FAC": "a",
    "SUB": "e",
    "ASM": "i",
    "SPC": "o",
    "COU": "u",
    "HYP": "ö"
  },
  "Cm": {
    "null": "∅",
    "FAC": "h",
    "SUB": "hl",
    "ASM": "kn",
    "SPC": "ky",
    "COU": "tn",
    "HYP": "ty"
  },
  "Vt1": {
    "RTR": "ai",
    "PRS": "ei",
    "HAB": "oi",
    "PRG": "ui",
    "IMM": "ëi",
    "PCS": "iu",
    "REG": "ou",
    "ATC": "eu",
    "ATP": "au",
    "RSM": "ah",
    "CSS": "eh",
    "PAU": "oh",
    "RGR": "uh",
    "PCL": "ih",
    "CNT": "üh",
    "ICS": "öh",
    "SMM": "ëh",
    "IRP": "äh",
    "PMP": "aih",
    "CLM": "eih",
    "DLT": "oih",
    "TMP": "uih",
    "MTV": "ëih",
    "SQN": "iuh",
    "EPD": "ouh",
    "PTC": "euh",
    "PPR": "auh",
    "DCL": "a’h",
    "CCL": "e’h",
    "CUL": "o’h",
    "IMD": "u’h",
    "TRD": "i’h",
    "TNS": "ü’h",
    "ITC": "ö’h",
    "XPD": "ë’h",
    "LIM": "ä’h"
  },
  "Vt2": {
    "RTR": "wa",
    "PRS": "we",
    "HAB": "wo",
    "PRG": "wu",
    "IMM": "wi",
    "PCS": "wü",
    "REG": "wö",
    "ATC": "wë",
    "ATP": "wä",
    "RSM": "ya",
    "CSS": "ye",
    "PAU": "yo",
    "RGR": "yu",
    "PCL": "yi",
    "CNT": "yü",
    "ICS": "yö",
    "SMM": "yë",
    "IRP": "yä",
    "PMP": "ai",
    "CLM": "ei",
    "DLT": "oi",
    "TMP": "ui",
    "MTV": "ëi",
    "SQN": "iu",
    "EPD": "ou",
    "PTC": "eu",
    "PPR": "au",
    "DCL": "ao",
    "CCL": "eo",
    "CUL": "oa",
    "IMD": "oe",
    "TRD": "ea",
    "TNS": "öe",
    "ITC": "öa",
    "XPD": "eö",
    "LIM": "aö"
  },
  "Cc": {
    "CCO": "r",
    "CCw": "w/y",
    "CCn": "n",
    "CCs": "s",
    "CCm": "m",
    "CCp": "p",
    "CCt": "t",
    "CCk": "k",
    "CCz": "š",
    "CCg": "ň"
  },
  "Vc": {
    "TRANSRELATIVE": {
      "THM": "a",
      "ABS": "e",
      "ERG": "o",
      "IND": "u",
      "AFF": "i",
      "DAT": "ü",
      "EFF": "ö",
      "STM": "ë",
      "INS": "ä"
    },
    "APPOSITIVE": {
      "POS": "ai",
      "PRP": "ei",
      "GEN": "oi",
      "ATT": "ui",
      "PDC": "ëi",
      "ITP": "iu",
      "OGN": "ou",
      "IDP": "eu",
      "PAR": "au"
    },
    "ASSOCIATIVE": {
      "APL": "ia/aì",
      "PUR": "ie/eì",
      "TRA": "io/oì",
      "DFR": "iö/öì",
      "CRS": "ië/ëì",
      "TSP": "uö/öù",
      "CMM": "uo/où",
      "CMP": "ue/eù",
      "CSD": "ua/aù"
    },
    "ADVERBIAL": {
      "CON": "ao",
      "AVR": "eo",
      "CVS": "oa",
      "SIT": "oe",
      "FUN": "ea",
      "TFM": "öe",
      "CLA": "öa",
      "CSM": "eö",
      "RSL": "aö"
    },
    "SPATIO-TEMPORAL I": {
      "LOC": "á",
      "ATD": "é",
      "ALL": "ó",
      "ABL": "ú",
      "ORI": "í",
      "IRL": "û",
      "INV": "ô",
      "NAV": "â"
    },
    "SPATIO-TEMPORAL II": {
      "ASS": "ái",
      "CNR": "éi",
      "PER": "ói",
      "PRO": "úi",
      "PCV": "íu",
      "PCR": "óu",
      "ELP": "éu",
      "PLM": "áu"
    },
    "RELATIONAL I": {
      "REF": "iá/aí",
      "COR": "ié/eí",
      "CPS": "ió/oí",
      "DEP": "iô/öí",
      "PRD": "uô/öú",
      "ESS": "uó/oú",
      "ASI": "ué/eú",
      "CFM": "uá/aú"
    },
    "RELATIONAL II": {
      "ACT": "aó",
      "SEL": "eó",
      "COM": "oá",
      "UTL": "oé",
      "DSC": "eá",
      "RLT": "ae",
      "TRM": "aé",
      "VOC": "ëu"
    }
  },
  "Vk": {
    "CNF": {
      "PPS": {
        "antepenultimate": "a"
      },
      "EPI": {
        "antepenultimate": "ai"
      },
      "ALG": {
        "antepenultimate": "ia/aì"
      },
      "IPU": {
        "antepenultimate": "ao"
      },
      "RFU": {
        "pre-antepenultimate": "a",
        "penultimate": "a’a"
      },
      "REB": {
        "pre-antepenultimate": "ai",
        "penultimate": "aya"
      },
      "CJT": {
        "pre-antepenultimate": "ia/aì",
        "penultimate": "aye"
      },
      "EXV": {
        "pre-antepenultimate": "ao",
        "penultimate": "ayo"
      },
      "AXM": {
        "ultimate": "ayá"
      },
      "∅": {
        "ultimate": "ayó"
      }
    },
    "INF": {
      "PPS": {
        "antepenultimate": "e"
      },
      "EPI": {
        "antepenultimate": "ei"
      },
      "ALG": {
        "antepenultimate": "ie/eì"
      },
      "IPU": {
        "antepenultimate": "eo"
      },
      "RFU": {
        "pre-antepenultimate": "e",
        "penultimate": "e’e"
      },
      "REB": {
        "pre-antepenultimate": "ei",
        "penultimate": "eya"
      },
      "CJT": {
        "pre-antepenultimate": "ie/eì",
        "penultimate": "eye"
      },
      "EXV": {
        "pre-antepenultimate": "eo",
        "penultimate": "eyo"
      },
      "AXM": {
        "ultimate": "eyá"
      },
      "∅": {
        "ultimate": "eyó"
      }
    },
    "ITU": {
      "PPS": {
        "antepenultimate": "o"
      },
      "EPI": {
        "antepenultimate": "oi"
      },
      "ALG": {
        "antepenultimate": "io/oì"
      },
      "IPU": {
        "antepenultimate": "oa"
      },
      "RFU": {
        "pre-antepenultimate": "o",
        "penultimate": "o’o"
      },
      "REB": {
        "pre-antepenultimate": "oi",
        "penultimate": "oya"
      },
      "CJT": {
        "pre-antepenultimate": "io/oì",
        "penultimate": "oye"
      },
      "EXV": {
        "pre-antepenultimate": "oa",
        "penultimate": "oyo"
      },
      "AXM": {
        "ultimate": "oyá"
      },
      "∅": {
        "ultimate": "oyó"
      }
    },
    "REV": {
      "PPS": {
        "antepenultimate": "u"
      },
      "EPI": {
        "antepenultimate": "ui"
      },
      "ALG": {
        "antepenultimate": "iö/öì"
      },
      "IPU": {
        "antepenultimate": "oe"
      },
      "RFU": {
        "pre-antepenultimate": "u",
        "penultimate": "u’u"
      },
      "REB": {
        "pre-antepenultimate": "ui",
        "penultimate": "uya"
      },
      "CJT": {
        "pre-antepenultimate": "iö/öì",
        "penultimate": "uye"
      },
      "EXV": {
        "pre-antepenultimate": "oe",
        "penultimate": "uyo"
      },
      "AXM": {
        "ultimate": "uyá"
      },
      "∅": {
        "ultimate": "uyó"
      }
    },
    "HSY": {
      "PPS": {
        "antepenultimate": "i"
      },
      "EPI": {
        "antepenultimate": "ëi"
      },
      "ALG": {
        "antepenultimate": "ië/ëì"
      },
      "IPU": {
        "antepenultimate": "ea"
      },
      "RFU": {
        "pre-antepenultimate": "i",
        "penultimate": "i’i"
      },
      "REB": {
        "pre-antepenultimate": "ëi",
        "penultimate": "ëya"
      },
      "CJT": {
        "pre-antepenultimate": "ië/ëì",
        "penultimate": "ëye"
      },
      "EXV": {
        "pre-antepenultimate": "ea",
        "penultimate": "ëyo"
      },
      "AXM": {
        "ultimate": "ëyá"
      },
      "∅": {
        "ultimate": "ëyó"
      }
    },
    "USP": {
      "PPS": {
        "antepenultimate": "ü"
      },
      "EPI": {
        "antepenultimate": "iu"
      },
      "ALG": {
        "antepenultimate": "uö/öù"
      },
      "IPU": {
        "antepenultimate": "öe"
      },
      "RFU": {
        "pre-antepenultimate": "ü",
        "penultimate": "ü’ü"
      },
      "REB": {
        "pre-antepenultimate": "iu",
        "penultimate": "iwa"
      },
      "CJT": {
        "pre-antepenultimate": "uö/öù",
        "penultimate": "iwe"
      },
      "EXV": {
        "pre-antepenultimate": "öe",
        "penultimate": "iwo"
      },
      "AXM": {
        "ultimate": "iwá"
      },
      "∅": {
        "ultimate": "iwó"
      }
    },
    "DIR": {
      "PPS": {
        "antepenultimate": "ö"
      },
      "EPI": {
        "antepenultimate": "ou"
      },
      "ALG": {
        "antepenultimate": "uo/où"
      },
      "IPU": {
        "antepenultimate": "öa"
      },
      "RFU": {
        "pre-antepenultimate": "ö",
        "penultimate": "ö’ö"
      },
      "REB": {
        "pre-antepenultimate": "ou",
        "penultimate": "owa"
      },
      "CJT": {
        "pre-antepenultimate": "uo/où",
        "penultimate": "owe"
      },
      "EXV": {
        "pre-antepenultimate": "öa",
        "penultimate": "owo"
      },
      "AXM": {
        "ultimate": "owá"
      },
      "∅": {
        "ultimate": "owó"
      }
    },
    "IRG": {
      "PPS": {
        "antepenultimate": "ë"
      },
      "EPI": {
        "antepenultimate": "eu"
      },
      "ALG": {
        "antepenultimate": "ue/eù"
      },
      "IPU": {
        "antepenultimate": "eö"
      },
      "RFU": {
        "pre-antepenultimate": "ë",
        "penultimate": "ë’ë"
      },
      "REB": {
        "pre-antepenultimate": "eu",
        "penultimate": "ewa"
      },
      "CJT": {
        "pre-antepenultimate": "ue/eù",
        "penultimate": "ewe"
      },
      "EXV": {
        "pre-antepenultimate": "eö",
        "penultimate": "ewo"
      },
      "AXM": {
        "ultimate": "ewá"
      },
      "∅": {
        "ultimate": "ewó"
      }
    },
    "DEC": {
      "PPS": {
        "antepenultimate": "ä"
      },
      "EPI": {
        "antepenultimate": "au"
      },
      "ALG": {
        "antepenultimate": "ua/aù"
      },
      "IPU": {
        "antepenultimate": "aö"
      },
      "RFU": {
        "pre-antepenultimate": "ä",
        "penultimate": "ä’ä"
      },
      "REB": {
        "pre-antepenultimate": "au",
        "penultimate": "awa"
      },
      "CJT": {
        "pre-antepenultimate": "ua/aù",
        "penultimate": "awe"
      },
      "EXV": {
        "pre-antepenultimate": "aö",
        "penultimate": "awo"
      },
      "AXM": {
        "ultimate": "awá"
      },
      "∅": {
        "ultimate": "awó"
      }
    }
  },
  "Register Adjunct": {
    "DISCURSIVE": {
      "open": "hya",
      "end": "hyia"
    },
    "PARENTHETICAL": {
      "open": "hye",
      "end": "hyie"
    },
    "IMPRESSIONISTIC": {
      "open": "hyai",
      "end": "hyau"
    },
    "COGITANT": {
      "open": "hyo",
      "end": "hyio"
    },
    "EXEMPLIFICATIVE": {
      "open": "hyö",
      "end": "hyiö"
    },
    "MATHS": {
      "open": "hyoi",
      "end": "hyou"
    },
    "CARRIER": {
      "open": "∅",
      "end": "hyi"
    }
  },
  "Personal Reference Adjunct": {
    "1m": {
      "description": "monadic speaker",
      "NEU": "l",
      "BEN": "n",
      "DET": "m",
      "gloss": "“I”"
    },
    "2m": {
      "description": "monadic addressee",
      "NEU": "s",
      "BEN": "š",
      "DET": "ž",
      "gloss": "“you (sg.)”"
    },
    "2p": {
      "description": "polyadic addressee",
      "NEU": "z",
      "BEN": "t",
      "DET": "d",
      "gloss": "“you (pl.)”"
    },
    "ma": {
      "description": "monadic animate 3rd party",
      "NEU": "r",
      "BEN": "p",
      "DET": "b",
      "gloss": "“he” / “she” / “they (sg.)”"
    },
    "pa": {
      "description": "polyadic animate 3rd party",
      "NEU": "ň",
      "BEN": "k",
      "DET": "g",
      "gloss": "“they (pl.)”"
    },
    "mi": {
      "description": "monadic inanimate 3rd party",
      "NEU": "x",
      "BEN": "ţ",
      "DET": "ḑ",
      "gloss": "“it”"
    },
    "pi": {
      "description": "polyadic inanimate 3rd party",
      "NEU": "ļ",
      "BEN": "f",
      "DET": "v",
      "gloss": "“they (inanimate)”"
    },
    "Mx": {
      "description": "mixed animate/inanimate 3rd party",
      "NEU": "ř",
      "BEN": "řř",
      "DET": "ňň",
      "gloss": "mixed animate+inanimate “s/he+it”, “they+those”, “it+they”, “those+s/he”, etc."
    },
    "Obv": {
      "description": "Obviative/Resumptive",
      "NEU": "c",
      "BEN": "ss",
      "DET": "zz",
      "gloss": "3 rd -party other than most recently referenced (used with SWR affix)"
    },
    "IPa": {
      "description": "impersonal animate",
      "NEU": "č",
      "BEN": "šš",
      "DET": "žž",
      "gloss": "“one” “you” “people” “a person” (French “on”; German “man”)"
    },
    "IPi": {
      "description": "impersonal inanimate",
      "NEU": "ļ",
      "BEN": "ff",
      "DET": "vv",
      "gloss": "“something” “a thing” “things”"
    },
    "Col": {
      "description": "Collective",
      "NEU": "ż",
      "BEN": "nn",
      "DET": "mm",
      "gloss": "NOMIC 3rd party"
    },
    "Abt": {
      "description": "Abstract",
      "NEU": "j",
      "BEN": "rr",
      "DET": "xx",
      "gloss": "ABSTRACT 3rd party"
    }
  },
  "Parsing Adjunct": {
    "monosyllabic": "’a’",
    "ultimate": "’e’",
    "penultimate": "’o’",
    "antepenultimate": "’u’",
    "pre-antepenultimate": "’i’"
  }
}